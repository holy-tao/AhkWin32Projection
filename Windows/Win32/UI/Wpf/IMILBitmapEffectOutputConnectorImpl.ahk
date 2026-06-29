#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectInputConnector.ahk" { IMILBitmapEffectInputConnector }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that define an output connector. (IMILBitmapEffectOutputConnectorImpl)
 * @remarks
 * This interface must be implemented if an effect also implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnectorimpl
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectOutputConnectorImpl extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectOutputConnectorImpl
     * @type {Guid}
     */
    static IID := Guid("{21fae777-8b39-4bfa-9f2d-f3941ed36913}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectOutputConnectorImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddBackLink    : IntPtr
        RemoveBackLink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectOutputConnectorImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IMILBitmapEffectOutputConnectorImpl::AddBackLink method
     * @param {IMILBitmapEffectInputConnector} pConnection Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectoutputconnectorimpl-addbacklink
     */
    AddBackLink(pConnection) {
        result := ComCall(3, this, "ptr", pConnection, "HRESULT")
        return result
    }

    /**
     * IMILBitmapEffectOutputConnectorImpl::RemoveBackLink method
     * @param {IMILBitmapEffectInputConnector} pConnection Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectinputconnector">IMILBitmapEffectInputConnector</a>*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectoutputconnectorimpl-removebacklink
     */
    RemoveBackLink(pConnection) {
        result := ComCall(4, this, "ptr", pConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectOutputConnectorImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddBackLink := CallbackCreate(GetMethod(implObj, "AddBackLink"), flags, 2)
        this.vtbl.RemoveBackLink := CallbackCreate(GetMethod(implObj, "RemoveBackLink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddBackLink)
        CallbackFree(this.vtbl.RemoveBackLink)
    }
}
