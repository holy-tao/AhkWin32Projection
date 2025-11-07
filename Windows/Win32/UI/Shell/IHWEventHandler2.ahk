#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHWEventHandler.ahk

/**
 * Extends the IHWEventHandler interface to address User Account Control (UAC) elevation for device handlers.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ihweventhandler">IHWEventHandler</a> interface, from which it inherits.
 * 
 * Handlers that implement this interface should return quickly from calls to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler-handleevent">IHWEventHandler::HandleEvent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nf-shobjidl-ihweventhandler2-handleeventwithhwnd">IHWEventHandler2::HandleEventWithHWND</a> so they do not block the AutoPlay dialog from closing. Also, if a local server must be launched for the creation of this handler, it should not block the CreateInstance call; it should return as soon as possible.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ihweventhandler2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHWEventHandler2 extends IHWEventHandler{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHWEventHandler2
     * @type {Guid}
     */
    static IID => Guid("{cfcc809f-295d-42e8-9ffc-424b33c487e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleEventWithHWND"]

    /**
     * 
     * @param {PWSTR} pszDeviceID 
     * @param {PWSTR} pszAltDeviceID 
     * @param {PWSTR} pszEventType 
     * @param {HWND} hwndOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ihweventhandler2-handleeventwithhwnd
     */
    HandleEventWithHWND(pszDeviceID, pszAltDeviceID, pszEventType, hwndOwner) {
        pszDeviceID := pszDeviceID is String ? StrPtr(pszDeviceID) : pszDeviceID
        pszAltDeviceID := pszAltDeviceID is String ? StrPtr(pszAltDeviceID) : pszAltDeviceID
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := ComCall(6, this, "ptr", pszDeviceID, "ptr", pszAltDeviceID, "ptr", pszEventType, "ptr", hwndOwner, "HRESULT")
        return result
    }
}
