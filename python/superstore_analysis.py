import pandas as pd


DATA_FILE = "data/superstore.csv"
OUTPUT_FILE = "outputs/superstore_summary.xlsx"


def load_superstore_data(file_path):
    """Load the Superstore dataset from a CSV file."""
    return pd.read_csv(file_path)


def clean_superstore_data(df):
    """Clean and prepare the Superstore dataset for analysis."""
    df = df.copy()

    df["Order Date"] = pd.to_datetime(df["Order Date"], errors="coerce")
    df["Ship Date"] = pd.to_datetime(df["Ship Date"], errors="coerce")

    df["Sales"] = pd.to_numeric(df["Sales"], errors="coerce")
    df["Profit"] = pd.to_numeric(df["Profit"], errors="coerce")
    df["Quantity"] = pd.to_numeric(df["Quantity"], errors="coerce")
    df["Discount"] = pd.to_numeric(df["Discount"], errors="coerce")

    df = df.drop_duplicates()
    df = df.dropna(subset=["Order Date", "Sales", "Profit"])

    return df


def calculate_kpis(df):
    """Calculate key business KPIs used in the dashboard."""
    total_sales = df["Sales"].sum()
    total_profit = df["Profit"].sum()
    total_orders = df["Order ID"].nunique()
    total_quantity = df["Quantity"].sum()

    average_order_value = total_sales / total_orders
    profit_margin = (total_profit / total_sales) * 100

    return {
        "Total Sales": round(total_sales, 2),
        "Total Profit": round(total_profit, 2),
        "Total Orders": total_orders,
        "Total Quantity": int(total_quantity),
        "Average Order Value": round(average_order_value, 2),
        "Profit Margin %": round(profit_margin, 2),
    }


def create_summary_tables(df):
    """Create summary tables for dashboard insights."""
    sales_by_category = (
        df.groupby("Category", as_index=False)["Sales"]
        .sum()
        .sort_values("Sales", ascending=False)
    )

    profit_by_region = (
        df.groupby("Region", as_index=False)["Profit"]
        .sum()
        .sort_values("Profit", ascending=False)
    )

    top_products = (
        df.groupby("Product Name", as_index=False)["Sales"]
        .sum()
        .sort_values("Sales", ascending=False)
        .head(10)
    )

    loss_making_products = (
        df.groupby("Product Name", as_index=False)["Profit"]
        .sum()
        .sort_values("Profit")
        .head(10)
    )

    return {
        "Sales by Category": sales_by_category,
        "Profit by Region": profit_by_region,
        "Top Products": top_products,
        "Loss Making Products": loss_making_products,
    }


def export_analysis(kpis, summary_tables, output_file):
    """Export KPIs and summary tables to an Excel workbook."""
    with pd.ExcelWriter(output_file, engine="openpyxl") as writer:
        pd.DataFrame([kpis]).to_excel(writer, sheet_name="KPIs", index=False)

        for sheet_name, table in summary_tables.items():
            table.to_excel(writer, sheet_name=sheet_name[:31], index=False)


def main():
    df = load_superstore_data(DATA_FILE)
    cleaned_df = clean_superstore_data(df)

    kpis = calculate_kpis(cleaned_df)
    summary_tables = create_summary_tables(cleaned_df)

    export_analysis(kpis, summary_tables, OUTPUT_FILE)

    print("Superstore analysis completed successfully.")
    print(f"Summary exported to: {OUTPUT_FILE}")


if __name__ == "__main__":
    main()
