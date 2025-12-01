#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a generic transactional object that begins a transaction. By calling the methods of this class, you can compose the work of multiple COM objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * To create this object, call [**IObjectContext::CreateInstance**](/windows/desktop/api/ComSvcs/nf-comsvcs-iobjectcontext-createinstance).
 * 
 * The **TransactionContextEx** class was not designed to be used in Visual Basic. Use the [**TransactionContext**](transactioncontext.md) class instead.
 * @see https://learn.microsoft.com/windows/win32/cossdk/transactioncontextex
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class TransactionContextEx extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
