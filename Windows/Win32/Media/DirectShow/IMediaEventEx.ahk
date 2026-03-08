#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMediaEvent.ahk

/**
 * The IMediaEventEx interface inherits the IMediaEvent interface, which contains methods for retrieving event notifications and for overriding the filter graph's default handling of events.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-imediaeventex
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
     * @remarks
     * This method designates a window that will process event notifications. Whenever the Filter Graph Manager puts an event in the event queue, it will also post a message to the designated window. The <i>hwnd</i> parameter specifies the window, and the <i>lMsg</i> parameter specifies the message. The application should define a private window message for this purpose. The message's <i>lParam</i> parameter is set to the value of <b>lInstanceData</b>, and the <i>wParam</i> parameter is set to zero.
     * 
     * When the window receives the message, it should call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-getevent">IMediaEvent::GetEvent</a> method to retrieve the event. Events are asynchronous, so the queue might contain several events (or none). Call <b>GetEvent</b> repeatedly, until it returns an error code.
     * @param {Pointer} hwnd Handle to the window, or <b>NULL</b> to stop receiving event messages.
     * @param {Integer} lMsg Window message to be passed as the notification.
     * @param {Pointer} lInstanceData Value to be passed as the <i>lParam</i> parameter for the <i>lMsg</i> message.
     * @returns {HRESULT} Returns S_OK if successful or E_INVALIDARG if the <i>hwnd</i> parameter is not a valid handle to a window.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaeventex-setnotifywindow
     */
    SetNotifyWindow(hwnd, lMsg, lInstanceData) {
        result := ComCall(13, this, "ptr", hwnd, "int", lMsg, "ptr", lInstanceData, "HRESULT")
        return result
    }

    /**
     * The SetNotifyFlags method enables or disables event notifications.
     * @remarks
     * By default, the Filter Graph Manager posts event notifications for the application. If the <i>lNoNotifyFlags</i> parameter is AM_MEDIAEVENT_NONOTIFY, the Filter Graph Manager clears any pending event notifications from the queue, and does not post any new ones.
     * 
     * If event notifications are disabled, the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-geteventhandle">IMediaEvent::GetEventHandle</a> method is signaled at the end of each stream—that is, whenever the Filter Graph Manager receives an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-complete">EC_COMPLETE</a> event.
     * @param {Integer} lNoNotifyFlags 
     * @returns {HRESULT} Returns S_OK if successful, or E_INVALIDARG if the <i>lNoNotifyFlags</i> parameter is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaeventex-setnotifyflags
     */
    SetNotifyFlags(lNoNotifyFlags) {
        result := ComCall(14, this, "int", lNoNotifyFlags, "HRESULT")
        return result
    }

    /**
     * The GetNotifyFlags method determines whether event notifications are enabled.
     * @remarks
     * By default, the Filter Graph Manager posts event notifications for the application. To disable event notification, call the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaeventex-setnotifyflags">IMediaEventEx::SetNotifyFlags</a> method with the value AM_MEDIAEVENT_NONOTIFY.
     * 
     * If event notifications are disabled, the handle returned by the <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-imediaevent-geteventhandle">IMediaEvent::GetEventHandle</a> method is signaled at the end of each stream—that is, whenever the Filter Graph Manager receives an <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ec-complete">EC_COMPLETE</a> event.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-imediaeventex-getnotifyflags
     */
    GetNotifyFlags() {
        result := ComCall(15, this, "int*", &lplNoNotifyFlags := 0, "HRESULT")
        return lplNoNotifyFlags
    }
}
