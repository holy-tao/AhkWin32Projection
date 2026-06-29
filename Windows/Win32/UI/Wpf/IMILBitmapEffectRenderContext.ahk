#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MILMatrixF.ahk" { MILMatrixF }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MilRectD.ahk" { MilRectD }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that define a IMILBitmapEffectRenderContext object.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectRenderContext extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectRenderContext
     * @type {Guid}
     */
    static IID := Guid("{12a2ec7e-2d33-44b2-b334-1abb7846e390}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectRenderContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetOutputPixelFormat   : IntPtr
        GetOutputPixelFormat   : IntPtr
        SetUseSoftwareRenderer : IntPtr
        SetInitialTransform    : IntPtr
        GetFinalTransform      : IntPtr
        SetOutputDPI           : IntPtr
        GetOutputDPI           : IntPtr
        SetRegionOfInterest    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectRenderContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the output pixel format.
     * @param {Pointer<Guid>} format Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The GUID of the output pixel format.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setoutputpixelformat
     */
    SetOutputPixelFormat(format) {
        result := ComCall(3, this, Guid.Ptr, format, "HRESULT")
        return result
    }

    /**
     * Gets the output pixel format GUID.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * The output pixel format GUID
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-getoutputpixelformat
     */
    GetOutputPixelFormat() {
        pFormat := Guid()
        result := ComCall(4, this, Guid.Ptr, pFormat, "HRESULT")
        return pFormat
    }

    /**
     * Sets a value to indicate whether to use software rendering.
     * @remarks
     * All Windows Presentation Foundation (WPF) effects are software rendered at this time.
     * @param {VARIANT_BOOL} fSoftware Type: <b>VARIANT_BOOL</b>
     * 
     * A value indicating whether to use software rendering.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setusesoftwarerenderer
     */
    SetUseSoftwareRenderer(fSoftware) {
        result := ComCall(5, this, VARIANT_BOOL, fSoftware, "HRESULT")
        return result
    }

    /**
     * Gets the initial MILMatrixF transform.
     * @param {Pointer<MILMatrixF>} pMatrix Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The initial transform.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setinitialtransform
     */
    SetInitialTransform(pMatrix) {
        result := ComCall(6, this, MILMatrixF.Ptr, pMatrix, "HRESULT")
        return result
    }

    /**
     * Gets the final MILMatrixF transform.
     * @returns {MILMatrixF} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milmatrixf">MILMatrixF</a>*</b>
     * 
     * The final transform.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-getfinaltransform
     */
    GetFinalTransform() {
        pMatrix := MILMatrixF()
        result := ComCall(7, this, MILMatrixF.Ptr, pMatrix, "HRESULT")
        return pMatrix
    }

    /**
     * Sets the output dots per inch (dpi).
     * @param {Float} dblDpiX Type: <b>double</b>
     * 
     * The horizontal resolution.
     * @param {Float} dblDpiY Type: <b>double</b>
     * 
     * The vertical resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setoutputdpi
     */
    SetOutputDPI(dblDpiX, dblDpiY) {
        result := ComCall(8, this, "double", dblDpiX, "double", dblDpiY, "HRESULT")
        return result
    }

    /**
     * Gets the output dots per inch (dpi).
     * @param {Pointer<Float>} pdblDpiX Type: <b>double*</b>
     * 
     * A pointer that receives the horizontal resolution.
     * @param {Pointer<Float>} pdblDpiY Type: <b>double*</b>
     * 
     * A pointer that receives the vertical resolution.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-getoutputdpi
     */
    GetOutputDPI(pdblDpiX, pdblDpiY) {
        pdblDpiXMarshal := pdblDpiX is VarRef ? "double*" : "ptr"
        pdblDpiYMarshal := pdblDpiY is VarRef ? "double*" : "ptr"

        result := ComCall(9, this, pdblDpiXMarshal, pdblDpiX, pdblDpiYMarshal, pdblDpiY, "HRESULT")
        return result
    }

    /**
     * Sets the region of interest for the effect.
     * @param {Pointer<MilRectD>} pRect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * The region of interest.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectrendercontext-setregionofinterest
     */
    SetRegionOfInterest(pRect) {
        result := ComCall(10, this, MilRectD.Ptr, pRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectRenderContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputPixelFormat := CallbackCreate(GetMethod(implObj, "SetOutputPixelFormat"), flags, 2)
        this.vtbl.GetOutputPixelFormat := CallbackCreate(GetMethod(implObj, "GetOutputPixelFormat"), flags, 2)
        this.vtbl.SetUseSoftwareRenderer := CallbackCreate(GetMethod(implObj, "SetUseSoftwareRenderer"), flags, 2)
        this.vtbl.SetInitialTransform := CallbackCreate(GetMethod(implObj, "SetInitialTransform"), flags, 2)
        this.vtbl.GetFinalTransform := CallbackCreate(GetMethod(implObj, "GetFinalTransform"), flags, 2)
        this.vtbl.SetOutputDPI := CallbackCreate(GetMethod(implObj, "SetOutputDPI"), flags, 3)
        this.vtbl.GetOutputDPI := CallbackCreate(GetMethod(implObj, "GetOutputDPI"), flags, 3)
        this.vtbl.SetRegionOfInterest := CallbackCreate(GetMethod(implObj, "SetRegionOfInterest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputPixelFormat)
        CallbackFree(this.vtbl.GetOutputPixelFormat)
        CallbackFree(this.vtbl.SetUseSoftwareRenderer)
        CallbackFree(this.vtbl.SetInitialTransform)
        CallbackFree(this.vtbl.GetFinalTransform)
        CallbackFree(this.vtbl.SetOutputDPI)
        CallbackFree(this.vtbl.GetOutputDPI)
        CallbackFree(this.vtbl.SetRegionOfInterest)
    }
}
