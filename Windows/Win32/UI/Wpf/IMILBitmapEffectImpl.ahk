#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMILBitmapEffectRenderContext.ahk" { IMILBitmapEffectRenderContext }
#Import ".\IMILBitmapEffectOutputConnector.ahk" { IMILBitmapEffectOutputConnector }
#Import ".\MilRectD.ahk" { MilRectD }
#Import ".\IMILBitmapEffectGroup.ahk" { IMILBitmapEffectGroup }
#Import "..\..\Graphics\Imaging\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Exposes methods that define an an out IMILBitmapEffect object.
 * @remarks
 * This interface must be implemented if a custom effect also exposes <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/nn-mileffects-imilbitmapeffectimpl
 * @namespace Windows.Win32.UI.Wpf
 */
export default struct IMILBitmapEffectImpl extends IUnknown {
    /**
     * The interface identifier for IMILBitmapEffectImpl
     * @type {Guid}
     */
    static IID := Guid("{cc2468f2-9936-47be-b4af-06b5df5dbcbb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMILBitmapEffectImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IsInPlaceModificationAllowed : IntPtr
        SetParentEffect              : IntPtr
        GetInputSource               : IntPtr
        GetInputSourceBounds         : IntPtr
        GetInputBitmapSource         : IntPtr
        GetOutputBitmapSource        : IntPtr
        Initialize                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMILBitmapEffectImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines whether the effect allows in-place modifications.
     * @param {IMILBitmapEffectOutputConnector} pOutputConnector Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>*</b>
     * 
     * The output connect to check if in-place modifications are allowed.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * A pointer that receives <c>TRUE</code> if in-place modifications are allowed; otherwise, <code>FALSE</c>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-isinplacemodificationallowed
     */
    IsInPlaceModificationAllowed(pOutputConnector) {
        result := ComCall(3, this, "ptr", pOutputConnector, VARIANT_BOOL.Ptr, &pfModifyInPlace := 0, "HRESULT")
        return pfModifyInPlace
    }

    /**
     * Sets the parent of the effect.
     * @param {IMILBitmapEffectGroup} pParentEffect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a> parent of the effect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-setparenteffect
     */
    SetParentEffect(pParentEffect) {
        result := ComCall(4, this, "ptr", pParentEffect, "HRESULT")
        return result
    }

    /**
     * Retrieves the input IWICBitmapSource Interface.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the input source.
     * @returns {IWICBitmapSource} Type: <b>IWICBitmapSource**</b>
     * 
     * A pointer that receives a pointer to the input bitmap source.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-getinputsource
     */
    GetInputSource(uiIndex) {
        result := ComCall(5, this, "uint", uiIndex, "ptr*", &ppBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppBitmapSource)
    }

    /**
     * Gets the bounds of the input source.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the bitmap source to retrieve.
     * @returns {MilRectD} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/ns-mileffects-milrectd">MIL_RECTD</a>*</b>
     * 
     * Pointer that receives the bounds of the input source.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-getinputsourcebounds
     */
    GetInputSourceBounds(uiIndex) {
        pRect := MilRectD()
        result := ComCall(6, this, "uint", uiIndex, MilRectD.Ptr, pRect, "HRESULT")
        return pRect
    }

    /**
     * Gets the input bitmap source of the effect of the given render context.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the of the input bitmap source.
     * @param {IMILBitmapEffectRenderContext} pRenderContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>.
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace Type: <b>VARIANT_BOOL*</b>
     * 
     * A value that indicates whether to modify in-place.
     * @returns {IWICBitmapSource} Type: <b>IWICBitmapSource**</b>
     * 
     * A pointer that receives a pointer to the input <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-getinputbitmapsource
     */
    GetInputBitmapSource(uiIndex, pRenderContext, pfModifyInPlace) {
        pfModifyInPlaceMarshal := pfModifyInPlace is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "uint", uiIndex, "ptr", pRenderContext, pfModifyInPlaceMarshal, pfModifyInPlace, "ptr*", &ppBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppBitmapSource)
    }

    /**
     * Gets the output bitmap source of the effect of the given render context.
     * @param {Integer} uiIndex Type: <b>ULONG</b>
     * 
     * The index of the of the output bitmap source.
     * @param {IMILBitmapEffectRenderContext} pRenderContext Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectrendercontext">IMILBitmapEffectRenderContext</a>.
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace Type: <b>VARIANT_BOOL*</b>
     * 
     * A value that indicates whether to modify in-place.
     * @returns {IWICBitmapSource} Type: <b>IWICBitmapSource**</b>
     * 
     * A pointer that receives a pointer to the output <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource Interface</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-getoutputbitmapsource
     */
    GetOutputBitmapSource(uiIndex, pRenderContext, pfModifyInPlace) {
        pfModifyInPlaceMarshal := pfModifyInPlace is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, "uint", uiIndex, "ptr", pRenderContext, pfModifyInPlaceMarshal, pfModifyInPlace, "ptr*", &ppBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppBitmapSource)
    }

    /**
     * Initializes the effect with the given object.
     * @param {IUnknown} pInner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The object to initialize the effect with.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mileffects/nf-mileffects-imilbitmapeffectimpl-initialize
     */
    Initialize(pInner) {
        result := ComCall(9, this, "ptr", pInner, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMILBitmapEffectImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsInPlaceModificationAllowed := CallbackCreate(GetMethod(implObj, "IsInPlaceModificationAllowed"), flags, 3)
        this.vtbl.SetParentEffect := CallbackCreate(GetMethod(implObj, "SetParentEffect"), flags, 2)
        this.vtbl.GetInputSource := CallbackCreate(GetMethod(implObj, "GetInputSource"), flags, 3)
        this.vtbl.GetInputSourceBounds := CallbackCreate(GetMethod(implObj, "GetInputSourceBounds"), flags, 3)
        this.vtbl.GetInputBitmapSource := CallbackCreate(GetMethod(implObj, "GetInputBitmapSource"), flags, 5)
        this.vtbl.GetOutputBitmapSource := CallbackCreate(GetMethod(implObj, "GetOutputBitmapSource"), flags, 5)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsInPlaceModificationAllowed)
        CallbackFree(this.vtbl.SetParentEffect)
        CallbackFree(this.vtbl.GetInputSource)
        CallbackFree(this.vtbl.GetInputSourceBounds)
        CallbackFree(this.vtbl.GetInputBitmapSource)
        CallbackFree(this.vtbl.GetOutputBitmapSource)
        CallbackFree(this.vtbl.Initialize)
    }
}
