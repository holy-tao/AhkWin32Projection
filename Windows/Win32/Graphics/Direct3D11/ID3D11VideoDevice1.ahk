#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoDevice.ahk

/**
 * Provides the video decoding and video processing capabilities of a Microsoft Direct3D 11 device.
 * @remarks
 * 
  * The Direct3D 11 device supports this interface. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11device1">ID3D11Device1</a> interface pointer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11videodevice1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoDevice1 extends ID3D11VideoDevice{
    /**
     * The interface identifier for ID3D11VideoDevice1
     * @type {Guid}
     */
    static IID => Guid("{29da1d51-1321-4454-804b-f5fc9f861f0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @param {Pointer<UInt32>} pPrivateInputSize 
     * @param {Pointer<UInt32>} pPrivateOutputSize 
     * @returns {HRESULT} 
     */
    GetCryptoSessionPrivateDataSize(pCryptoType, pDecoderProfile, pKeyExchangeType, pPrivateInputSize, pPrivateOutputSize) {
        result := ComCall(20, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pKeyExchangeType, "uint*", pPrivateInputSize, "uint*", pPrivateOutputSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} SampleWidth 
     * @param {Integer} SampleHeight 
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate 
     * @param {Integer} BitRate 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<UInt32>} pDecoderCaps 
     * @returns {HRESULT} 
     */
    GetVideoDecoderCaps(pDecoderProfile, SampleWidth, SampleHeight, pFrameRate, BitRate, pCryptoType, pDecoderCaps) {
        result := ComCall(21, this, "ptr", pDecoderProfile, "uint", SampleWidth, "uint", SampleHeight, "ptr", pFrameRate, "uint", BitRate, "ptr", pCryptoType, "uint*", pDecoderCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pInputDesc 
     * @param {Integer} InputColorSpace 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pInputConfig 
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate 
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc 
     * @param {Pointer<BOOL>} pSupported 
     * @param {Pointer<BOOL>} pRealTimeHint 
     * @returns {HRESULT} 
     */
    CheckVideoDecoderDownsampling(pInputDesc, InputColorSpace, pInputConfig, pFrameRate, pOutputDesc, pSupported, pRealTimeHint) {
        result := ComCall(22, this, "ptr", pInputDesc, "int", InputColorSpace, "ptr", pInputConfig, "ptr", pFrameRate, "ptr", pOutputDesc, "ptr", pSupported, "ptr", pRealTimeHint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pInputDesc 
     * @param {Integer} InputColorSpace 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pInputConfig 
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate 
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pRecommendedOutputDesc 
     * @returns {HRESULT} 
     */
    RecommendVideoDecoderDownsampleParameters(pInputDesc, InputColorSpace, pInputConfig, pFrameRate, pRecommendedOutputDesc) {
        result := ComCall(23, this, "ptr", pInputDesc, "int", InputColorSpace, "ptr", pInputConfig, "ptr", pFrameRate, "ptr", pRecommendedOutputDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
