CREATE NONCLUSTERED INDEX [IX_Prueba]
ON [Warehouse].[StockItemTransactions] ([LastEditedBy])
INCLUDE (
    [StockItemTransactionID],
    [StockItemID],
    [TransactionTypeID],
    [CustomerID],
    [InvoiceID],
    [SupplierID],
    [PurchaseOrderID],
    [TransactionOccurredWhen],
    [Quantity],
    [LastEditedWhen]
);

SET STATISTICS IO ON -- Datos sobre la consulta
GO

SELECT TOP 10000 * 
FROM Application.People p INNER JOIN 
       Sales.InvoiceLines i ON p.PersonID = i.LastEditedBy INNER JOIN 
       Warehouse.StockItemTransactions s ON p.PersonID = s.LastEditedBy
ORDER BY i.StockItemID
GO