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
     * 
     * @param {Pointer<IUnknown>} pWindow 
     * @param {Pointer<IFrameworkInputPaneHandler>} pHandler 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    Advise(pWindow, pHandler, pdwCookie) {
        result := ComCall(3, this, "ptr", pWindow, "ptr", pHandler, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IFrameworkInputPaneHandler>} pHandler 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    AdviseWithHWND(hwnd, pHandler, pdwCookie) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(4, this, "ptr", hwnd, "ptr", pHandler, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    Unadvise(dwCookie) {
        result := ComCall(5, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prcInputPaneScreenLocation 
     * @returns {HRESULT} 
     */
    Location(prcInputPaneScreenLocation) {
        result := ComCall(6, this, "ptr", prcInputPaneScreenLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
