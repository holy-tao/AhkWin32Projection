#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoDevice1.ahk

/**
 * Provides the video decoding and video processing capabilities of a Microsoft Direct3D 11 device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_4/nn-d3d11_4-id3d11videodevice2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoDevice2 extends ID3D11VideoDevice1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoDevice2
     * @type {Guid}
     */
    static IID => Guid("{59c0cb01-35f0-4a70-8f67-87905c906a53}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckFeatureSupport", "NegotiateCryptoSessionKeyExchangeMT"]

    /**
     * Gets information about the features that are supported by the current video driver. (ID3D11VideoDevice2::CheckFeatureSupport)
     * @param {Integer} Feature A member of the [D3D11_FEATURE_VIDEO](ne-d3d11_4-d3d11_feature_video.md) enumeration that specifies the feature to query for support.
     * @param {Pointer} pFeatureSupportData A structure that contains data that describes the configuration details of the feature for which support is requested and, upon the completion of the call, is populated with details about the level of support available. For information on the structure that is associated with each type of feature support request, see the field descriptions for [D3D11_FEATURE_VIDEO](ne-d3d11_4-d3d11_feature_video.md).
     * @param {Integer} FeatureSupportDataSize The size of the structure passed to the *pFeatureSupportData* parameter.
     * @returns {HRESULT} Returns **S_OK** if successful; otherwise, returns **E_INVALIDARG** if an unsupported data type is passed to the *pFeatureSupportData* parameter or a size mismatch is detected for the *FeatureSupportDataSize* parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_4/nf-d3d11_4-id3d11videodevice2-checkfeaturesupport
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(24, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {Integer} flags 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    NegotiateCryptoSessionKeyExchangeMT(pCryptoSession, flags, DataSize, pData) {
        result := ComCall(25, this, "ptr", pCryptoSession, "int", flags, "uint", DataSize, "ptr", pData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
