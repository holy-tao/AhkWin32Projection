#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the video decoding and video processing capabilities of a Microsoft Direct3D 11 device.
 * @remarks
 * 
  * The Direct3D 11 device supports this interface. To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> interface pointer.
  * 
  * If you query an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a> for <b>ID3D11VideoDevice</b> and the Direct3D 11 device created is using the reference rasterizer or WARP, or is a hardware device and you are using the Microsoft Basic Display Adapter, <b>E_NOINTERFACE</b> is returned.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videodevice
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoDevice extends IUnknown{
    /**
     * The interface identifier for ID3D11VideoDevice
     * @type {Guid}
     */
    static IID => Guid("{10ec4d5b-975a-4689-b9e4-d0aac30fe333}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pVideoDesc 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig 
     * @param {Pointer<ID3D11VideoDecoder>} ppDecoder 
     * @returns {HRESULT} 
     */
    CreateVideoDecoder(pVideoDesc, pConfig, ppDecoder) {
        result := ComCall(3, this, "ptr", pVideoDesc, "ptr", pConfig, "ptr", ppDecoder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessorEnumerator>} pEnum 
     * @param {Integer} RateConversionIndex 
     * @param {Pointer<ID3D11VideoProcessor>} ppVideoProcessor 
     * @returns {HRESULT} 
     */
    CreateVideoProcessor(pEnum, RateConversionIndex, ppVideoProcessor) {
        result := ComCall(4, this, "ptr", pEnum, "uint", RateConversionIndex, "ptr", ppVideoProcessor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ChannelType 
     * @param {Pointer<ID3D11AuthenticatedChannel>} ppAuthenticatedChannel 
     * @returns {HRESULT} 
     */
    CreateAuthenticatedChannel(ChannelType, ppAuthenticatedChannel) {
        result := ComCall(5, this, "int", ChannelType, "ptr", ppAuthenticatedChannel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @param {Pointer<ID3D11CryptoSession>} ppCryptoSession 
     * @returns {HRESULT} 
     */
    CreateCryptoSession(pCryptoType, pDecoderProfile, pKeyExchangeType, ppCryptoSession) {
        result := ComCall(6, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pKeyExchangeType, "ptr", ppCryptoSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoDecoderOutputView>} ppVDOVView 
     * @returns {HRESULT} 
     */
    CreateVideoDecoderOutputView(pResource, pDesc, ppVDOVView) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr", ppVDOVView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<ID3D11VideoProcessorEnumerator>} pEnum 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoProcessorInputView>} ppVPIView 
     * @returns {HRESULT} 
     */
    CreateVideoProcessorInputView(pResource, pEnum, pDesc, ppVPIView) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr", ppVPIView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11Resource>} pResource 
     * @param {Pointer<ID3D11VideoProcessorEnumerator>} pEnum 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoProcessorOutputView>} ppVPOView 
     * @returns {HRESULT} 
     */
    CreateVideoProcessorOutputView(pResource, pEnum, pDesc, ppVPOView) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr", ppVPOView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoProcessorEnumerator>} ppEnum 
     * @returns {HRESULT} 
     */
    CreateVideoProcessorEnumerator(pDesc, ppEnum) {
        result := ComCall(10, this, "ptr", pDesc, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetVideoDecoderProfileCount() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @returns {HRESULT} 
     */
    GetVideoDecoderProfile(Index, pDecoderProfile) {
        result := ComCall(12, this, "uint", Index, "ptr", pDecoderProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} Format 
     * @param {Pointer<BOOL>} pSupported 
     * @returns {HRESULT} 
     */
    CheckVideoDecoderFormat(pDecoderProfile, Format, pSupported) {
        result := ComCall(13, this, "ptr", pDecoderProfile, "int", Format, "ptr", pSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetVideoDecoderConfigCount(pDesc, pCount) {
        result := ComCall(14, this, "ptr", pDesc, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc 
     * @param {Integer} Index 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig 
     * @returns {HRESULT} 
     */
    GetVideoDecoderConfig(pDesc, Index, pConfig) {
        result := ComCall(15, this, "ptr", pDesc, "uint", Index, "ptr", pConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<D3D11_VIDEO_CONTENT_PROTECTION_CAPS>} pCaps 
     * @returns {HRESULT} 
     */
    GetContentProtectionCaps(pCryptoType, pDecoderProfile, pCaps) {
        result := ComCall(16, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} Index 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @returns {HRESULT} 
     */
    CheckCryptoKeyExchange(pCryptoType, pDecoderProfile, Index, pKeyExchangeType) {
        result := ComCall(17, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "uint", Index, "ptr", pKeyExchangeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(18, this, "ptr", guid, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<IUnknown>} pData 
     * @returns {HRESULT} 
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(19, this, "ptr", guid, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
