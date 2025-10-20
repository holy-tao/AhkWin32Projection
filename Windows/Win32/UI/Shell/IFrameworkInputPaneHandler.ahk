#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables an app to be notified when the input pane (the on-screen keyboard or handwriting panel) is being shown or hidden. This allows the app window to adjust its display so that no input areas (such as a text box) are obscured by the input pane.
 * @remarks
 * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * Implement this interface if your app needs to be informed when the input pane is shown or hidden, or its screen coordinates.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IFrameworkInputPaneHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkInputPaneHandler
     * @type {Guid}
     */
    static IID => Guid("{226c537b-1e76-4d9e-a760-33db29922f18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Showing", "Hiding"]

    /**
     * 
     * @param {Pointer<RECT>} prcInputPaneScreenLocation 
     * @param {BOOL} fEnsureFocusedElementInView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpanehandler-showing
     */
    Showing(prcInputPaneScreenLocation, fEnsureFocusedElementInView) {
        result := ComCall(3, this, "ptr", prcInputPaneScreenLocation, "int", fEnsureFocusedElementInView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnsureFocusedElementInView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpanehandler-hiding
     */
    Hiding(fEnsureFocusedElementInView) {
        result := ComCall(4, this, "int", fEnsureFocusedElementInView, "HRESULT")
        return result
    }
}
