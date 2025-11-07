#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_VIDEO_SAMPLE_DESC.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCryptoSessionPrivateDataSize", "GetVideoDecoderCaps", "CheckVideoDecoderDownsampling", "RecommendVideoDecoderDownsampleParameters"]

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @param {Pointer<Integer>} pPrivateInputSize 
     * @param {Pointer<Integer>} pPrivateOutputSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getcryptosessionprivatedatasize
     */
    GetCryptoSessionPrivateDataSize(pCryptoType, pDecoderProfile, pKeyExchangeType, pPrivateInputSize, pPrivateOutputSize) {
        pPrivateInputSizeMarshal := pPrivateInputSize is VarRef ? "uint*" : "ptr"
        pPrivateOutputSizeMarshal := pPrivateOutputSize is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pKeyExchangeType, pPrivateInputSizeMarshal, pPrivateInputSize, pPrivateOutputSizeMarshal, pPrivateOutputSize, "HRESULT")
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getvideodecodercaps
     */
    GetVideoDecoderCaps(pDecoderProfile, SampleWidth, SampleHeight, pFrameRate, BitRate, pCryptoType) {
        result := ComCall(21, this, "ptr", pDecoderProfile, "uint", SampleWidth, "uint", SampleHeight, "ptr", pFrameRate, "uint", BitRate, "ptr", pCryptoType, "uint*", &pDecoderCaps := 0, "HRESULT")
        return pDecoderCaps
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-checkvideodecoderdownsampling
     */
    CheckVideoDecoderDownsampling(pInputDesc, InputColorSpace, pInputConfig, pFrameRate, pOutputDesc, pSupported, pRealTimeHint) {
        pSupportedMarshal := pSupported is VarRef ? "int*" : "ptr"
        pRealTimeHintMarshal := pRealTimeHint is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "ptr", pInputDesc, "int", InputColorSpace, "ptr", pInputConfig, "ptr", pFrameRate, "ptr", pOutputDesc, pSupportedMarshal, pSupported, pRealTimeHintMarshal, pRealTimeHint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pInputDesc 
     * @param {Integer} InputColorSpace 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pInputConfig 
     * @param {Pointer<DXGI_RATIONAL>} pFrameRate 
     * @returns {D3D11_VIDEO_SAMPLE_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-recommendvideodecoderdownsampleparameters
     */
    RecommendVideoDecoderDownsampleParameters(pInputDesc, InputColorSpace, pInputConfig, pFrameRate) {
        pRecommendedOutputDesc := D3D11_VIDEO_SAMPLE_DESC()
        result := ComCall(23, this, "ptr", pInputDesc, "int", InputColorSpace, "ptr", pInputConfig, "ptr", pFrameRate, "ptr", pRecommendedOutputDesc, "HRESULT")
        return pRecommendedOutputDesc
    }
}
