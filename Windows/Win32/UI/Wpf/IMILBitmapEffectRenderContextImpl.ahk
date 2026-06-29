#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MILMatrixF.ahk" { MILMatrixF }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MilRectD.ahk" { MilRectD }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that define a IMILBitmapEffectRenderContext.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectrendercontextimpl
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectRenderContextImpl extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectRenderContextImpl
     * @type {Guid}
     */
    static IID := Guid("{4d25accb-797d-4fd2-b128-dffeff84fcc3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectRenderContextImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUseSoftwareRenderer : IntPtr
        GetTransform           : IntPtr
        UpdateTransform        : IntPtr
        GetOutputBounds        : IntPtr
        UpdateOutputBounds     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectRenderContextImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a value that indicates whether to use software rendering.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * A pointer that receives a value that indicates whether to use software rendering.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-getusesoftwarerenderer
     */
    GetUseSoftwareRenderer() {
        result := ComCall(3, this, VARIANT_BOOL.Ptr, &pfSoftware := 0, "HRESULT")
        return pfSoftware
    }

    /**
     * Gets the matrix transform of the render context.
     * @param {Pointer<MILMatrixF>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The matrix transform of the render context.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-gettransform
     */
    GetTransform(pMatrix) {
        result := ComCall(4, this, MILMatrixF.Ptr, pMatrix, "HRESULT")
        return result
    }

    /**
     * Updates the output transform with the new matrix.
     * @param {Pointer<MILMatrixF>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The new transform to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-updatetransform
     */
    UpdateTransform(pMatrix) {
        result := ComCall(5, this, MILMatrixF.Ptr, pMatrix, "HRESULT")
        return result
    }

    /**
     * Gets the output bounds of the render context.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * The output bounds.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-getoutputbounds
     */
    GetOutputBounds(pRect) {
        result := ComCall(6, this, MilRectD.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * Updates the output bounds with the given region.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * The new output bounds to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontextimpl-updateoutputbounds
     */
    UpdateOutputBounds(pRect) {
        result := ComCall(7, this, MilRectD.Ptr, pRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectRenderContextImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUseSoftwareRenderer := CallbackCreate(GetMethod(implObj, "GetUseSoftwareRenderer"), flags, 2)
        this.vtbl.GetTransform := CallbackCreate(GetMethod(implObj, "GetTransform"), flags, 2)
        this.vtbl.UpdateTransform := CallbackCreate(GetMethod(implObj, "UpdateTransform"), flags, 2)
        this.vtbl.GetOutputBounds := CallbackCreate(GetMethod(implObj, "GetOutputBounds"), flags, 2)
        this.vtbl.UpdateOutputBounds := CallbackCreate(GetMethod(implObj, "UpdateOutputBounds"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUseSoftwareRenderer)
        CallbackFree(this.vtbl.GetTransform)
        CallbackFree(this.vtbl.UpdateTransform)
        CallbackFree(this.vtbl.GetOutputBounds)
        CallbackFree(this.vtbl.UpdateOutputBounds)
    }
}
