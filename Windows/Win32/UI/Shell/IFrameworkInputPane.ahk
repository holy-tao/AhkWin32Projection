#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods that enable apps to be informed of state changes and location for the input pane.
 * @remarks
 * 
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Do not implement this interface; the implementation is supplied with Windows as CLSID_FrameworkInputPane.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iframeworkinputpane
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFrameworkInputPane extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkInputPane
     * @type {Guid}
     */
    static IID => Guid("{5752238b-24f0-495a-82f1-2fd593056796}")

    /**
     * The class identifier for FrameworkInputPane
     * @type {Guid}
     */
    static CLSID => Guid("{d5120aa3-46ba-44c5-822d-ca8092c1fc72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Advise", "AdviseWithHWND", "Unadvise", "Location"]

    /**
     * Registers the app's input pane handler object to receive notifications on behalf of a window when an event triggers the input pane. This method differs from AdviseWithHWND in that it references its window through an object that implements ICoreWindow.
     * @param {IUnknown} pWindow Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the window (an object that implements <a href="https://docs.microsoft.com/uwp/api/windows.ui.core.icorewindow">ICoreWindow</a>) for which the handler should listen for input pane events.
     * @param {IFrameworkInputPaneHandler} pHandler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a> interface pointer to the handler instance for this app.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a cookie for that can be used later to unregister the handler through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise">Unadvise</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advise
     */
    Advise(pWindow, pHandler) {
        result := ComCall(3, this, "ptr", pWindow, "ptr", pHandler, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Registers the app's input pane handler object to receive notifications on behalf of a window when an event triggers the input pane. This method differs from Advise in that it references its window through an HWND.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * The handle of the window for which the handler should listen for input pane events.
     * @param {IFrameworkInputPaneHandler} pHandler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler">IFrameworkInputPaneHandler</a> interface pointer to the handler instance for this app.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives a cookie for that can be used later to unregister the handler through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise">Unadvise</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advisewithhwnd
     */
    AdviseWithHWND(hwnd, pHandler) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "ptr", pHandler, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters an app's input pane handler object so that it no longer receives notifications.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A cookie that identifies the handler. This value was obtained when you registered the handler through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advise">Advise</a> method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Gets the current location of the input pane.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that, when this method returns successfully, receives the location of the input pane, in screen coordinates. If the input pane is not visible, this structure receives an empty rectangle.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iframeworkinputpane-location
     */
    Location() {
        prcInputPaneScreenLocation := RECT()
        result := ComCall(6, this, "ptr", prcInputPaneScreenLocation, "HRESULT")
        return prcInputPaneScreenLocation
    }
}
