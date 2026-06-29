#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an app to be notified when the input pane (the on-screen keyboard or handwriting panel) is being shown or hidden. This allows the app window to adjust its display so that no input areas (such as a text box) are obscured by the input pane.
 * @remarks
 * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
 * Implement this interface if your app needs to be informed when the input pane is shown or hidden, or its screen coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IFrameworkInputPaneHandler extends IUnknown {
    /**
     * The interface identifier for IFrameworkInputPaneHandler
     * @type {Guid}
     */
    static IID := Guid("{226c537b-1e76-4d9e-a760-33db29922f18}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFrameworkInputPaneHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Showing : IntPtr
        Hiding  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFrameworkInputPaneHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called before the input pane is shown, to allow the app window to make any necessary adjustments to its UI in response to the reduced screen space available to it.
     * @param {Pointer<RECT>} prcInputPaneScreenLocation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that supplies the screen coordinates that the input pane will occupy.
     * @param {BOOL} fEnsureFocusedElementInView Type: <b>BOOL*</b>
     * 
     * A pointer to a value that is set to <b>true</b> if the app should attempt to keep its currently focused element (such as a text box) in view, which could require the app to move the element or rearrange its UI.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpanehandler-showing
     */
    Showing(prcInputPaneScreenLocation, fEnsureFocusedElementInView) {
        result := ComCall(3, this, RECT.Ptr, prcInputPaneScreenLocation, BOOL, fEnsureFocusedElementInView, "HRESULT")
        return result
    }

    /**
     * Called when the input pane is about to leave the display.
     * @param {BOOL} fEnsureFocusedElementInView Type: <b>BOOL*</b>
     * 
     * A pointer to a value that is set to <b>true</b> if the app should attempt to keep its currently focused element (such as a text box) in view, which could require the app to rearrange its UI or move the element, usually back to its layout before the input pane was shown.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-iframeworkinputpanehandler-hiding
     */
    Hiding(fEnsureFocusedElementInView) {
        result := ComCall(4, this, BOOL, fEnsureFocusedElementInView, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFrameworkInputPaneHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Showing := CallbackCreate(GetMethod(implObj, "Showing"), flags, 3)
        this.vtbl.Hiding := CallbackCreate(GetMethod(implObj, "Hiding"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Showing)
        CallbackFree(this.vtbl.Hiding)
    }
}
