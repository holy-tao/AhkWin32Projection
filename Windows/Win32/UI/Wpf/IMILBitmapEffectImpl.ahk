#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Imaging\IWICBitmapSource.ahk
#Include .\MilRectD.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that define an an out IMILBitmapEffect object.
 * @remarks
 * 
 * This interface must be implemented if a custom effect also exposes <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffect">IMILBitmapEffect</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mileffects/nn-mileffects-imilbitmapeffectimpl
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class IMILBitmapEffectImpl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMILBitmapEffectImpl
     * @type {Guid}
     */
    static IID => Guid("{cc2468f2-9936-47be-b4af-06b5df5dbcbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsInPlaceModificationAllowed", "SetParentEffect", "GetInputSource", "GetInputSourceBounds", "GetInputBitmapSource", "GetOutputBitmapSource", "Initialize"]

    /**
     * Determines whether the effect allows in-place modifications.
     * @param {IMILBitmapEffectOutputConnector} pOutputConnector Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectoutputconnector">IMILBitmapEffectOutputConnector</a>*</b>
     * 
     * The output connect to check if in-place modifications are allowed.
     * @returns {VARIANT_BOOL} Type: <b>VARIANT_BOOL*</b>
     * 
     * A pointer that receives <c>TRUE</code> if in-place modifications are allowed; otherwise, <code>FALSE</c>.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-isinplacemodificationallowed
     */
    IsInPlaceModificationAllowed(pOutputConnector) {
        result := ComCall(3, this, "ptr", pOutputConnector, "short*", &pfModifyInPlace := 0, "HRESULT")
        return pfModifyInPlace
    }

    /**
     * Sets the parent of the effect.
     * @param {IMILBitmapEffectGroup} pParentEffect Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mileffects/nn-mileffects-imilbitmapeffectgroup">IMILBitmapEffectGroup</a> parent of the effect.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-setparenteffect
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
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-getinputsource
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
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-getinputsourcebounds
     */
    GetInputSourceBounds(uiIndex) {
        pRect := MilRectD()
        result := ComCall(6, this, "uint", uiIndex, "ptr", pRect, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-getinputbitmapsource
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
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-getoutputbitmapsource
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mileffects/nf-mileffects-imilbitmapeffectimpl-initialize
     */
    Initialize(pInner) {
        result := ComCall(9, this, "ptr", pInner, "HRESULT")
        return result
    }
}
