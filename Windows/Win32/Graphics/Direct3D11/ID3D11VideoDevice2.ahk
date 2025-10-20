#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoDevice1.ahk

/**
 * Provides the video decoding and video processing capabilities of a Microsoft Direct3D 11 device.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_4/nn-d3d11_4-id3d11videodevice2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoDevice2 extends ID3D11VideoDevice1{
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
     * 
     * @param {Integer} Feature 
     * @param {Pointer} pFeatureSupportData 
     * @param {Integer} FeatureSupportDataSize 
     * @returns {HRESULT} 
     */
    CheckFeatureSupport(Feature, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(24, this, "int", Feature, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Integer} flags 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    NegotiateCryptoSessionKeyExchangeMT(pCryptoSession, flags, DataSize, pData) {
        result := ComCall(25, this, "ptr", pCryptoSession, "int", flags, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
