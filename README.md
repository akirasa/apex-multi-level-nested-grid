
📖 ERP Multi-Level Nested Grid — Documentation & User Guide

A high-performance, dynamic nested table plugin for Oracle APEX. It allows
developers to inject expandable child tables (Master ➔ Detail ➔ Sub-Detail)
directly beneath rows in Interactive Reports (IR) and Interactive Grids (IG)
without page redirects or full-page reloads.

1️⃣ Core Concept & Workflow

The plugin transforms traditional tabular reports into hierarchical multi-tier
tables:

1.  Level 1 (Master): The primary Interactive Report or Interactive Grid on your
    page.
2.  Level 2 (Detail): An embedded child table that dynamically renders beneath a
    clicked row via an AJAX-executed SQL query.
3.  Level 3 (Sub-Detail - Optional): A nested grandchild table that expands from
    within a Level 2 row, providing 3 full layers of nested data.

2️⃣ Step-by-Step Setup Guide

Step 1: Import the Plugin

1.  In Application Builder, open your target application.
2.  Go to Shared Components ➔ Plug-ins.
3.  Click Import.
4.  Choose dynamic_action_plugin_erp_multi_level_nested_grid (1).sql and finish
    the installation wizard.

Step 2: Prepare the Master Report (IR or IG)

Ensure your main report query includes a column that represents the record's
primary ID (e.g., REQ_ID).

Example Master Query:

SELECT order_id AS req_id,
       customer_name,
       order_date,
       order_status,
       total_amount
  FROM orders;

Note: The plugin automatically detects the column specified as the key column,
hides its raw text, and renders an interactive "عرض / View" expand button in its
place.

Step 3: Create the Dynamic Action

1.  In Page Designer, switch to the Dynamic Actions tab.
2.  Create a new Dynamic Action:
      - Name: DA_Init_Nested_Grid
      - Event: Page Load (or After Refresh on the target region).
3.  Under the True Action, configure:
      - Action: ERP Multi-Level Nested Grid.

Step 4: Configure Plugin Attributes

| Attribute Name               | Required? | Description & Recommended Value                                                                        |
| :--------------------------- | :-------: | :----------------------------------------------------------------------------------------------------- |
| **Level 2 SQL (Detail)**     | **Yes**   | The SQL query for the first nested table (uses parent ID as bind variable).                            |
| **Region Static ID**         | *No*      | Static ID of your IR or IG region. If left blank, the plugin automatically detects the primary report. |
| **Level 1 Key Column**       | **Yes**   | The column alias from the master query that triggers the expand action (e.g. `REQ_ID`).                |
| **Level 3 SQL (Sub-Detail)** | *No*      | SQL query for the 3rd-level nested grid (if 3-level hierarchy is needed).                              |
| **Level 2 Key Column**       | *No*      | The column alias from Level 2 SQL that links to Level 3 (e.g. `REQ_ROW_ID`).                           |
| **Titles & Badges**          | *No*      | Defines the ribbon title and summary pills: `Title : Col1, Col2 \| Title : Col1, Col2`.                |
| **Table Style**              | *No*      | UI styling: `Modern Blue`, `Dark Slate`, `Emerald Mint`, or `Compact Striped`.                         |
| **Enable Quick Search**      | *No*      | Adds an instant client-side search box inside the sub-table (`Yes` / `No`).                            |
| **RTL Layout**               | *No*      | Right-to-Left orientation for Arabic or LTR for English (`Yes` / `No`).                                |

3️⃣ Real-World Implementation Examples

📌 Example 1: Invoices & Items (2-Level Master-Detail)

  - Goal: Expand any invoice row to display its line items without page
    redirection.

Master Report Query (Level 1):

SELECT invoice_id AS req_id,
       customer_name,
       invoice_date,
       net_amount
  FROM invoices;

Plugin Settings:

  - Level 1 Key Column: REQ_ID
  - Level 2 SQL (Detail):
    SELECT item_name        AS "Item Description",
           quantity         AS "Qty",
           unit_price       AS "Unit Price",
           (quantity * unit_price) AS "Total"
      FROM invoice_items
     WHERE invoice_id = :REQ_ID
  - Titles & Badges:
    Invoice Items : customer_name, net_amount
    (The plugin will locate customer_name and net_amount values from the master
    row and display them as smart badges in the ribbon header).

📌 Example 2: Procurement Tracking (3 Full Levels)

  - Level 1 (Master): Purchase Order Header.
  - Level 2 (Detail): Order Line Items.
  - Level 3 (Sub-Detail): Item Serials & Warehouse Locations.

1. Master Report Query (Level 1):

SELECT po_header_id AS req_id,
       vendor_name   AS "Vendor",
       po_number     AS "PO Number",
       creation_date AS "Order Date"
  FROM po_headers;

2. Level 2 SQL Query:

SELECT line_id          AS req_row_id,
       item_code        AS "Item Code",
       item_description AS "Description",
       ordered_qty      AS "Quantity"
  FROM po_lines
 WHERE po_header_id = :REQ_ID

(Notice: line_id AS req_row_id provides the binding key for Level 3).

3. Level 3 SQL Query (Sub-Detail):

SELECT serial_no      AS "Serial Number",
       warehouse_code AS "Warehouse",
       shelf_location AS "Shelf"
  FROM po_line_serials
 WHERE line_id = :REQ_ROW_ID

4. Configure Titles & Badges for Both Levels:

Separate Level 2 and Level 3 settings using a vertical pipe (|):

PO Lines : Vendor, PO Number | Item Serials : Item Code

4️⃣ Automatic Bind Variables Reference

The plugin passes context variables automatically during AJAX fetch operations:

1.  :REQ_ID or :ACC_ID: Holds the selected primary key value from the Level 1
    row.
2.  :REQ_ROW_ID or :PEXPREV_ID: Holds the selected primary key value from the
    Level 2 row.
3.  Current Page Items (:Pxx_...): Any page item present on the active page
    (e.g., :P10_BRANCH_ID, :P10_YEAR) is parsed and bound into the SQL query
    without requiring manual dynamic action page-item submissions.
