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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoDecoder", "CreateVideoProcessor", "CreateAuthenticatedChannel", "CreateCryptoSession", "CreateVideoDecoderOutputView", "CreateVideoProcessorInputView", "CreateVideoProcessorOutputView", "CreateVideoProcessorEnumerator", "GetVideoDecoderProfileCount", "GetVideoDecoderProfile", "CheckVideoDecoderFormat", "GetVideoDecoderConfigCount", "GetVideoDecoderConfig", "GetContentProtectionCaps", "CheckCryptoKeyExchange", "SetPrivateData", "SetPrivateDataInterface"]

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pVideoDesc 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig 
     * @param {Pointer<ID3D11VideoDecoder>} ppDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder
     */
    CreateVideoDecoder(pVideoDesc, pConfig, ppDecoder) {
        result := ComCall(3, this, "ptr", pVideoDesc, "ptr", pConfig, "ptr*", ppDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessorEnumerator} pEnum 
     * @param {Integer} RateConversionIndex 
     * @param {Pointer<ID3D11VideoProcessor>} ppVideoProcessor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor
     */
    CreateVideoProcessor(pEnum, RateConversionIndex, ppVideoProcessor) {
        result := ComCall(4, this, "ptr", pEnum, "uint", RateConversionIndex, "ptr*", ppVideoProcessor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ChannelType 
     * @param {Pointer<ID3D11AuthenticatedChannel>} ppAuthenticatedChannel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createauthenticatedchannel
     */
    CreateAuthenticatedChannel(ChannelType, ppAuthenticatedChannel) {
        result := ComCall(5, this, "int", ChannelType, "ptr*", ppAuthenticatedChannel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @param {Pointer<ID3D11CryptoSession>} ppCryptoSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createcryptosession
     */
    CreateCryptoSession(pCryptoType, pDecoderProfile, pKeyExchangeType, ppCryptoSession) {
        result := ComCall(6, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pKeyExchangeType, "ptr*", ppCryptoSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoDecoderOutputView>} ppVDOVView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview
     */
    CreateVideoDecoderOutputView(pResource, pDesc, ppVDOVView) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", ppVDOVView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {ID3D11VideoProcessorEnumerator} pEnum 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoProcessorInputView>} ppVPIView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorinputview
     */
    CreateVideoProcessorInputView(pResource, pEnum, pDesc, ppVPIView) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr*", ppVPIView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {ID3D11VideoProcessorEnumerator} pEnum 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoProcessorOutputView>} ppVPOView 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessoroutputview
     */
    CreateVideoProcessorOutputView(pResource, pEnum, pDesc, ppVPOView) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr*", ppVPOView, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pDesc 
     * @param {Pointer<ID3D11VideoProcessorEnumerator>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator
     */
    CreateVideoProcessorEnumerator(pDesc, ppEnum) {
        result := ComCall(10, this, "ptr", pDesc, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofilecount
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile
     */
    GetVideoDecoderProfile(Index, pDecoderProfile) {
        result := ComCall(12, this, "uint", Index, "ptr", pDecoderProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} Format 
     * @param {Pointer<BOOL>} pSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-checkvideodecoderformat
     */
    CheckVideoDecoderFormat(pDecoderProfile, Format, pSupported) {
        result := ComCall(13, this, "ptr", pDecoderProfile, "int", Format, "ptr", pSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfigcount
     */
    GetVideoDecoderConfigCount(pDesc, pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pDesc, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc 
     * @param {Integer} Index 
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfig
     */
    GetVideoDecoderConfig(pDesc, Index, pConfig) {
        result := ComCall(15, this, "ptr", pDesc, "uint", Index, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<D3D11_VIDEO_CONTENT_PROTECTION_CAPS>} pCaps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getcontentprotectioncaps
     */
    GetContentProtectionCaps(pCryptoType, pDecoderProfile, pCaps) {
        result := ComCall(16, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} Index 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-checkcryptokeyexchange
     */
    CheckCryptoKeyExchange(pCryptoType, pDecoderProfile, Index, pKeyExchangeType) {
        result := ComCall(17, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "uint", Index, "ptr", pKeyExchangeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(18, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(19, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }
}
