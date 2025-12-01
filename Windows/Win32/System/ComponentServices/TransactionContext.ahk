#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a generic transactional object that begins a transaction.
 * @remarks
 * To create this object, call [**IObjectContext::CreateInstance**](/windows/desktop/api/ComSvcs/nf-comsvcs-iobjectcontext-createinstance).
 * 
 * To use this class from Microsoft Visual Basic, add a reference to the COM+ Services Type Library. A TransactionContext object can be declared using "COMSVCSLib.TransactionContext" as the class name.
 * @see https://learn.microsoft.com/windows/win32/cossdk/transactioncontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class TransactionContext extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
