#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * 
 * @remarks
 * The **HRESULT** data type is the same as the [SCODE](scode.md) data type.
 * 
 * An **HRESULT** value consists of the following fields:
 *   
 * - A 1-bit code indicating severity, where zero represents success and 1 represents failure.
 * 
 * - A 4-bit reserved value.
 * 
 * - An 11-bit code indicating responsibility for the error or warning, also known as a facility code.
 * 
 * - A 16-bit code describing the error or warning.
 * 
 * Most MAPI interface methods and functions return **HRESULT** values to provide detailed cause formation. **HRESULT** values are also used widely in OLE interface methods. OLE provides several macros for converting between **HRESULT** values and **SCODE** values, another common data type for error handling.
 *   
 * > [!NOTE]
 * > In 64-bit MAPI, **HRESULT** is still a 32-bit value.
 *   
 * For information about the OLE use of **HRESULT** values, see the  *OLE Programmer's Reference*. For more information about the use of these values in MAPI, see [Error Handling](error-handling-in-mapi.md) and any of the following interface methods:
 *   
 * [IABLogon::GetLastError](iablogon-getlasterror.md)
 *   
 * [IMAPISupport::GetLastError](imapisupport-getlasterror.md)
 *   
 * [IMAPIControl::GetLastError](imapicontrol-getlasterror.md)
 *   
 * [IMAPITable::GetLastError](imapitable-getlasterror.md)
 *   
 * [IMAPIProp::GetLastError](imapiprop-getlasterror.md)
 *   
 * [IMAPIViewAdviseSink::OnPrint](imapiviewadvisesink-onprint.md)
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/hresult
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class HRESULT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
