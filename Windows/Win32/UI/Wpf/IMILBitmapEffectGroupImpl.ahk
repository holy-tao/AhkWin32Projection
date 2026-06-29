#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMILBitmapEffects.ahk" { IMILBitmapEffects }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectRenderContext.ahk" { IMILBitmapEffectRenderContext }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that define an effect group.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectgroupimpl
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectGroupImpl extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectGroupImpl
     * @type {Guid}
     */
    static IID := Guid("{78fed518-1cfc-4807-8b85-6b6e51398f62}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectGroupImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Preprocess        : IntPtr
        GetNumberChildren : IntPtr
        GetChildren       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectGroupImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Pre-process the given render context.
     * @param {IMILBitmapEffectRenderContext} pContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a> to process.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroupimpl-preprocess
     */
    Preprocess(pContext) {
        result := ComCall(3, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of children in an effect group.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * A pointer that receives the number of effects in the group.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroupimpl-getnumberchildren
     */
    GetNumberChildren() {
        result := ComCall(4, this, "uint*", &puiNumberChildren := 0, "HRESULT")
        return puiNumberChildren
    }

    /**
     * Gets the children of the effect group.
     * @returns {IMILBitmapEffects} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffects">IMILBitmapEffects</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffects">IMILBitmapEffects</a> group.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectgroupimpl-getchildren
     */
    GetChildren() {
        result := ComCall(5, this, "ptr*", &pChildren := 0, "HRESULT")
        return IMILBitmapEffects(pChildren)
    }

    Query(iid) {
        if (IMILBitmapEffectGroupImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Preprocess := CallbackCreate(GetMethod(implObj, "Preprocess"), flags, 2)
        this.vtbl.GetNumberChildren := CallbackCreate(GetMethod(implObj, "GetNumberChildren"), flags, 2)
        this.vtbl.GetChildren := CallbackCreate(GetMethod(implObj, "GetChildren"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Preprocess)
        CallbackFree(this.vtbl.GetNumberChildren)
        CallbackFree(this.vtbl.GetChildren)
    }
}
