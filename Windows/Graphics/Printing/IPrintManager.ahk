#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Enables access to PrintManager methods in a Windows Store app that manages multiple windows.
 * @see https://learn.microsoft.com/windows/win32/api//content/printmanagerinterop/nn-printmanagerinterop-iprintmanagerinterop
 * @namespace Windows.Graphics.Printing
 * @version WindowsRuntime 1.4
 */
class IPrintManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintManager
     * @type {Guid}
     */
    static IID => Guid("{ff2a9694-8c99-44fd-ae4a-19d9aa9a0f0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PrintTaskRequested", "remove_PrintTaskRequested"]

    /**
     * 
     * @param {TypedEventHandler<PrintManager, PrintTaskRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PrintTaskRequested(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PrintTaskRequested(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(7, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
