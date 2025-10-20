#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {IUnknown} pWindow 
     * @param {IFrameworkInputPaneHandler} pHandler 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advise
     */
    Advise(pWindow, pHandler, pdwCookie) {
        result := ComCall(3, this, "ptr", pWindow, "ptr", pHandler, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IFrameworkInputPaneHandler} pHandler 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-advisewithhwnd
     */
    AdviseWithHWND(hwnd, pHandler, pdwCookie) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "ptr", pHandler, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-unadvise
     */
    Unadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcInputPaneScreenLocation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpane-location
     */
    Location(prcInputPaneScreenLocation) {
        result := ComCall(6, this, "ptr", prcInputPaneScreenLocation, "HRESULT")
        return result
    }
}
