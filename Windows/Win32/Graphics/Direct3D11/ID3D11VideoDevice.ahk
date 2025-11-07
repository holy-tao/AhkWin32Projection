#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoDecoder.ahk
#Include .\ID3D11VideoProcessor.ahk
#Include .\ID3D11AuthenticatedChannel.ahk
#Include .\ID3D11CryptoSession.ahk
#Include .\ID3D11VideoDecoderOutputView.ahk
#Include .\ID3D11VideoProcessorInputView.ahk
#Include .\ID3D11VideoProcessorOutputView.ahk
#Include .\ID3D11VideoProcessorEnumerator.ahk
#Include .\D3D11_VIDEO_DECODER_CONFIG.ahk
#Include .\D3D11_VIDEO_CONTENT_PROTECTION_CAPS.ahk
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
     * @returns {ID3D11VideoDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder
     */
    CreateVideoDecoder(pVideoDesc, pConfig) {
        result := ComCall(3, this, "ptr", pVideoDesc, "ptr", pConfig, "ptr*", &ppDecoder := 0, "HRESULT")
        return ID3D11VideoDecoder(ppDecoder)
    }

    /**
     * 
     * @param {ID3D11VideoProcessorEnumerator} pEnum 
     * @param {Integer} RateConversionIndex 
     * @returns {ID3D11VideoProcessor} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor
     */
    CreateVideoProcessor(pEnum, RateConversionIndex) {
        result := ComCall(4, this, "ptr", pEnum, "uint", RateConversionIndex, "ptr*", &ppVideoProcessor := 0, "HRESULT")
        return ID3D11VideoProcessor(ppVideoProcessor)
    }

    /**
     * 
     * @param {Integer} ChannelType 
     * @returns {ID3D11AuthenticatedChannel} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createauthenticatedchannel
     */
    CreateAuthenticatedChannel(ChannelType) {
        result := ComCall(5, this, "int", ChannelType, "ptr*", &ppAuthenticatedChannel := 0, "HRESULT")
        return ID3D11AuthenticatedChannel(ppAuthenticatedChannel)
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Pointer<Guid>} pKeyExchangeType 
     * @returns {ID3D11CryptoSession} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createcryptosession
     */
    CreateCryptoSession(pCryptoType, pDecoderProfile, pKeyExchangeType) {
        result := ComCall(6, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pKeyExchangeType, "ptr*", &ppCryptoSession := 0, "HRESULT")
        return ID3D11CryptoSession(ppCryptoSession)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {Pointer<D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC>} pDesc 
     * @returns {ID3D11VideoDecoderOutputView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview
     */
    CreateVideoDecoderOutputView(pResource, pDesc) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppVDOVView := 0, "HRESULT")
        return ID3D11VideoDecoderOutputView(ppVDOVView)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {ID3D11VideoProcessorEnumerator} pEnum 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC>} pDesc 
     * @returns {ID3D11VideoProcessorInputView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorinputview
     */
    CreateVideoProcessorInputView(pResource, pEnum, pDesc) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr*", &ppVPIView := 0, "HRESULT")
        return ID3D11VideoProcessorInputView(ppVPIView)
    }

    /**
     * 
     * @param {ID3D11Resource} pResource 
     * @param {ID3D11VideoProcessorEnumerator} pEnum 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC>} pDesc 
     * @returns {ID3D11VideoProcessorOutputView} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessoroutputview
     */
    CreateVideoProcessorOutputView(pResource, pEnum, pDesc) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr*", &ppVPOView := 0, "HRESULT")
        return ID3D11VideoProcessorOutputView(ppVPOView)
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pDesc 
     * @returns {ID3D11VideoProcessorEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator
     */
    CreateVideoProcessorEnumerator(pDesc) {
        result := ComCall(10, this, "ptr", pDesc, "ptr*", &ppEnum := 0, "HRESULT")
        return ID3D11VideoProcessorEnumerator(ppEnum)
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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile
     */
    GetVideoDecoderProfile(Index) {
        pDecoderProfile := Guid()
        result := ComCall(12, this, "uint", Index, "ptr", pDecoderProfile, "HRESULT")
        return pDecoderProfile
    }

    /**
     * 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} Format 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-checkvideodecoderformat
     */
    CheckVideoDecoderFormat(pDecoderProfile, Format) {
        result := ComCall(13, this, "ptr", pDecoderProfile, "int", Format, "int*", &pSupported := 0, "HRESULT")
        return pSupported
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfigcount
     */
    GetVideoDecoderConfigCount(pDesc) {
        result := ComCall(14, this, "ptr", pDesc, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc 
     * @param {Integer} Index 
     * @returns {D3D11_VIDEO_DECODER_CONFIG} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfig
     */
    GetVideoDecoderConfig(pDesc, Index) {
        pConfig := D3D11_VIDEO_DECODER_CONFIG()
        result := ComCall(15, this, "ptr", pDesc, "uint", Index, "ptr", pConfig, "HRESULT")
        return pConfig
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @returns {D3D11_VIDEO_CONTENT_PROTECTION_CAPS} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-getcontentprotectioncaps
     */
    GetContentProtectionCaps(pCryptoType, pDecoderProfile) {
        pCaps := D3D11_VIDEO_CONTENT_PROTECTION_CAPS()
        result := ComCall(16, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * 
     * @param {Pointer<Guid>} pCryptoType 
     * @param {Pointer<Guid>} pDecoderProfile 
     * @param {Integer} Index 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-checkcryptokeyexchange
     */
    CheckCryptoKeyExchange(pCryptoType, pDecoderProfile, Index) {
        pKeyExchangeType := Guid()
        result := ComCall(17, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "uint", Index, "ptr", pKeyExchangeType, "HRESULT")
        return pKeyExchangeType
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
