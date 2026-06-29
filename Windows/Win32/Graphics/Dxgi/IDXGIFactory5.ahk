#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXGI_FEATURE.ahk" { DXGI_FEATURE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIFactory4.ahk" { IDXGIFactory4 }

/**
 * This interface enables a single method to support variable refresh rate displays.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nn-dxgi1_5-idxgifactory5
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIFactory5 extends IDXGIFactory4 {
    /**
     * The interface identifier for IDXGIFactory5
     * @type {Guid}
     */
    static IID := Guid("{7632e1f5-ee65-4dca-87fd-84cd75f8838d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIFactory5 interfaces
    */
    struct Vtbl extends IDXGIFactory4.Vtbl {
        CheckFeatureSupport : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIFactory5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used to check for hardware feature support.
     * @remarks
     * Refer to the description of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG_ALLOW_TEARING</a>.
     * @param {DXGI_FEATURE} Feature Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_feature">DXGI_FEATURE</a></b>
     * 
     * Specifies one member of  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/ne-dxgi1_5-dxgi_feature">DXGI_FEATURE</a> to query support for.
     * @param {Integer} pFeatureSupportData Type: <b>void*</b>
     * 
     * Specifies a pointer to a buffer that will be filled with data that describes the feature support.
     * @param {Integer} FeatureSupportDataSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of <i>pFeatureSupportData</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns an HRESULT success or error code.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/nf-dxgi1_5-idxgifactory5-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(28, this, DXGI_FEATURE, Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDXGIFactory5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckFeatureSupport := CallbackCreate(GetMethod(implObj, "CheckFeatureSupport"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckFeatureSupport)
    }
}
