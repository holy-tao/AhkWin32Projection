#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IInkCommitRequestHandler.ahk" { IInkCommitRequestHandler }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * An IInkPresenterDesktop object represents an InkPresenter that can be configured and inserted into the DirectComposition visual tree of the Classic Windows app.
 * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkpresenterdesktop
 * @namespace Windows.Win32.UI.Input.Ink
 */
export default struct IInkPresenterDesktop extends IUnknown {
    /**
     * The interface identifier for IInkPresenterDesktop
     * @type {Guid}
     */
    static IID := Guid("{73f3c0d9-2e8b-48f3-895e-20cbd27b723b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkPresenterDesktop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRootVisual           : IntPtr
        SetCommitRequestHandler : IntPtr
        GetSize                 : IntPtr
        SetSize                 : IntPtr
        OnHighContrastChanged   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkPresenterDesktop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the connection to the app's DirectComposition visual tree.
     * @param {IUnknown} rootVisual The app's  <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-portal">DirectComposition</a> visual tree.
     * @param {IUnknown} device NULL for default ink rendering, or an <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice3">IDCompositionDevice3</a> object used to commit all pending DirectComposition commands for custom drying of ink input to the app's  <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-portal">DirectComposition</a> visual tree.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setrootvisual
     */
    SetRootVisual(rootVisual, device) {
        result := ComCall(3, this, "ptr", rootVisual, "ptr", device, "HRESULT")
        return result
    }

    /**
     * Sets an IInkCommitRequestHandler object that enables the app (instead of an IInkPresenterDesktop object) to commit all pending Microsoft DirectComposition commands to the app's DirectComposition visual tree.
     * @param {IInkCommitRequestHandler} handler The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkcommitrequesthandler">IInkCommitRequestHandler</a> that processes the ink input.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setcommitrequesthandler
     */
    SetCommitRequestHandler(handler) {
        result := ComCall(4, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Gets the size of the InkPresenter object.
     * @param {Pointer<Float>} width The width of the object, in DIPs.
     * @param {Pointer<Float>} height The height of the object, in DIPs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-getsize
     */
    GetSize(width, height) {
        widthMarshal := width is VarRef ? "float*" : "ptr"
        heightMarshal := height is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, widthMarshal, width, heightMarshal, height, "HRESULT")
        return result
    }

    /**
     * Sets the size of the InkPresenter object.
     * @param {Float} width The width of the object, in DIPs.
     * @param {Float} height The height of the object, in DIPs.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-setsize
     */
    SetSize(width, height) {
        result := ComCall(6, this, "float", width, "float", height, "HRESULT")
        return result
    }

    /**
     * Specifies a high contrast change handler. This handler is notified of changes to the high contrast system settings.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkpresenterdesktop-onhighcontrastchanged
     */
    OnHighContrastChanged() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInkPresenterDesktop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRootVisual := CallbackCreate(GetMethod(implObj, "SetRootVisual"), flags, 3)
        this.vtbl.SetCommitRequestHandler := CallbackCreate(GetMethod(implObj, "SetCommitRequestHandler"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 3)
        this.vtbl.SetSize := CallbackCreate(GetMethod(implObj, "SetSize"), flags, 3)
        this.vtbl.OnHighContrastChanged := CallbackCreate(GetMethod(implObj, "OnHighContrastChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRootVisual)
        CallbackFree(this.vtbl.SetCommitRequestHandler)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.SetSize)
        CallbackFree(this.vtbl.OnHighContrastChanged)
    }
}
