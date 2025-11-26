#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaEvent.ahk

/**
 * The IMediaEventEx interface inherits the IMediaEvent interface, which contains methods for retrieving event notifications and for overriding the filter graph's default handling of events.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-imediaeventex
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaEventEx extends IMediaEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEventEx
     * @type {Guid}
     */
    static IID => Guid("{56a868c0-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNotifyWindow", "SetNotifyFlags", "GetNotifyFlags"]

    /**
     * The SetNotifyWindow method registers a window to process event notifications.
     * @param {Pointer} hwnd Handle to the window, or <b>NULL</b> to stop receiving event messages.
     * @param {Integer} lMsg Window message to be passed as the notification.
     * @param {Pointer} lInstanceData Value to be passed as the <i>lParam</i> parameter for the <i>lMsg</i> message.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>hwnd</i> parameter is not a valid handle to a window.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaeventex-setnotifywindow
     */
    SetNotifyWindow(hwnd, lMsg, lInstanceData) {
        result := ComCall(13, this, "ptr", hwnd, "int", lMsg, "ptr", lInstanceData, "HRESULT")
        return result
    }

    /**
     * The SetNotifyFlags method enables or disables event notifications.
     * @param {Integer} lNoNotifyFlags 
     * @returns {HRESULT} Returns S_OK if successful, or E_INVALIDARG if the <i>lNoNotifyFlags</i> parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaeventex-setnotifyflags
     */
    SetNotifyFlags(lNoNotifyFlags) {
        result := ComCall(14, this, "int", lNoNotifyFlags, "HRESULT")
        return result
    }

    /**
     * The GetNotifyFlags method determines whether event notifications are enabled.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-imediaeventex-getnotifyflags
     */
    GetNotifyFlags() {
        result := ComCall(15, this, "int*", &lplNoNotifyFlags := 0, "HRESULT")
        return lplNoNotifyFlags
    }
}
