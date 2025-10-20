#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IMILBitmapEffectOutputConnector>} pOutputConnector 
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace 
     * @returns {HRESULT} 
     */
    IsInPlaceModificationAllowed(pOutputConnector, pfModifyInPlace) {
        result := ComCall(3, this, "ptr", pOutputConnector, "ptr", pfModifyInPlace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMILBitmapEffectGroup>} pParentEffect 
     * @returns {HRESULT} 
     */
    SetParentEffect(pParentEffect) {
        result := ComCall(4, this, "ptr", pParentEffect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IWICBitmapSource>} ppBitmapSource 
     * @returns {HRESULT} 
     */
    GetInputSource(uiIndex, ppBitmapSource) {
        result := ComCall(5, this, "uint", uiIndex, "ptr", ppBitmapSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<MilRectD>} pRect 
     * @returns {HRESULT} 
     */
    GetInputSourceBounds(uiIndex, pRect) {
        result := ComCall(6, this, "uint", uiIndex, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pRenderContext 
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace 
     * @param {Pointer<IWICBitmapSource>} ppBitmapSource 
     * @returns {HRESULT} 
     */
    GetInputBitmapSource(uiIndex, pRenderContext, pfModifyInPlace, ppBitmapSource) {
        result := ComCall(7, this, "uint", uiIndex, "ptr", pRenderContext, "ptr", pfModifyInPlace, "ptr", ppBitmapSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<IMILBitmapEffectRenderContext>} pRenderContext 
     * @param {Pointer<VARIANT_BOOL>} pfModifyInPlace 
     * @param {Pointer<IWICBitmapSource>} ppBitmapSource 
     * @returns {HRESULT} 
     */
    GetOutputBitmapSource(uiIndex, pRenderContext, pfModifyInPlace, ppBitmapSource) {
        result := ComCall(8, this, "uint", uiIndex, "ptr", pRenderContext, "ptr", pfModifyInPlace, "ptr", ppBitmapSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IUnknown>} pInner 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pInner) {
        result := ComCall(9, this, "ptr", pInner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
