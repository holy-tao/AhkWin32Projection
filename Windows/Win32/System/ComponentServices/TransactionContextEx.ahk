#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Creates a generic transactional object that begins a transaction. By calling the methods of this class, you can compose the work of multiple COM objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * To create this object, call [**IObjectContext::CreateInstance**](/windows/desktop/api/ComSvcs/nf-comsvcs-iobjectcontext-createinstance).
 * 
 * The **TransactionContextEx** class was not designed to be used in Visual Basic. Use the [**TransactionContext**](transactioncontext.md) class instead.
 * @see https://learn.microsoft.com/windows/win32/cossdk/transactioncontextex
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct TransactionContextEx {
    #StructPack 1

}
