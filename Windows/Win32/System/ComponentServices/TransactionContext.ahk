#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Creates a generic transactional object that begins a transaction.
 * @remarks
 * To create this object, call [**IObjectContext::CreateInstance**](/windows/desktop/api/ComSvcs/nf-comsvcs-iobjectcontext-createinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A TransactionContext object can be declared using "COMSVCSLib.TransactionContext" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/transactioncontext
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct TransactionContext {
    #StructPack 1

}
