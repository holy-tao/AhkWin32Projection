#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11VideoDevice1.ahk" { ID3D11VideoDevice1 }
#Import ".\ID3D11CryptoSession.ahk" { ID3D11CryptoSession }
#Import ".\D3D11_CRYPTO_SESSION_KEY_EXCHANGE_FLAGS.ahk" { D3D11_CRYPTO_SESSION_KEY_EXCHANGE_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D11_FEATURE_VIDEO.ahk" { D3D11_FEATURE_VIDEO }

/**
 * Provides the video decoding and video processing capabilities of a Microsoft Direct3D 11 device.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11videodevice2
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoDevice2 extends ID3D11VideoDevice1 {
    /**
     * The interface identifier for ID3D11VideoDevice2
     * @type {Guid}
     */
    static IID := Guid("{59c0cb01-35f0-4a70-8f67-87905c906a53}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoDevice2 interfaces
    */
    struct Vtbl extends ID3D11VideoDevice1.Vtbl {
        CheckFeatureSupport                 : IntPtr
        NegotiateCryptoSessionKeyExchangeMT : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoDevice2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets information about the features that are supported by the current video driver. (ID3D11VideoDevice2::CheckFeatureSupport)
     * @param {D3D11_FEATURE_VIDEO} Feature A member of the [D3D11_FEATURE_VIDEO](ne-d3d11_4-d3d11_feature_video.md) enumeration that specifies the feature to query for support.
     * @param {Integer} pFeatureSupportData A structure that contains data that describes the configuration details of the feature for which support is requested and, upon the completion of the call, is populated with details about the level of support available. For information on the structure that is associated with each type of feature support request, see the field descriptions for [D3D11_FEATURE_VIDEO](ne-d3d11_4-d3d11_feature_video.md).
     * @param {Integer} FeatureSupportDataSize The size of the structure passed to the *pFeatureSupportData* parameter.
     * @returns {HRESULT} Returns **S_OK** if successful; otherwise, returns **E_INVALIDARG** if an unsupported data type is passed to the *pFeatureSupportData* parameter or a size mismatch is detected for the *FeatureSupportDataSize* parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videodevice2-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(24, this, D3D11_FEATURE_VIDEO, Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {D3D11_CRYPTO_SESSION_KEY_EXCHANGE_FLAGS} flags 
     * @param {Integer} DataSize 
     * @param {Integer} pData 
     * @returns {HRESULT} 
     */
    NegotiateCryptoSessionKeyExchangeMT(pCryptoSession, flags, DataSize, pData) {
        result := ComCall(25, this, "ptr", pCryptoSession, D3D11_CRYPTO_SESSION_KEY_EXCHANGE_FLAGS, flags, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11VideoDevice2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckFeatureSupport := CallbackCreate(GetMethod(implObj, "CheckFeatureSupport"), flags, 4)
        this.vtbl.NegotiateCryptoSessionKeyExchangeMT := CallbackCreate(GetMethod(implObj, "NegotiateCryptoSessionKeyExchangeMT"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckFeatureSupport)
        CallbackFree(this.vtbl.NegotiateCryptoSessionKeyExchangeMT)
    }
}
