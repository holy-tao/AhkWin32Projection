#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class IPrintSupportExtensionSession2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSupportExtensionSession2
     * @type {Guid}
     */
    static IID => Guid("{10fa8c11-6de8-5765-8fcf-e716e0f27ed1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PrinterSelected", "remove_PrinterSelected"]

    /**
     * 
     * @param {TypedEventHandler<PrintSupportExtensionSession, PrintSupportPrinterSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrinterSelected(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrinterSelected(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
