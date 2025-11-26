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
     * Creates a video decoder device for Microsoft Direct3D 11.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pVideoDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a> structure that describes the video stream and the decoder profile.
     * @param {Pointer<D3D11_VIDEO_DECODER_CONFIG>} pConfig A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a> structure that specifies the decoder configuration.
     * @returns {ID3D11VideoDecoder} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createvideodecoder
     */
    CreateVideoDecoder(pVideoDesc, pConfig) {
        result := ComCall(3, this, "ptr", pVideoDesc, "ptr", pConfig, "ptr*", &ppDecoder := 0, "HRESULT")
        return ID3D11VideoDecoder(ppDecoder)
    }

    /**
     * Creates a video processor device for Microsoft Direct3D 11.
     * @param {ID3D11VideoProcessorEnumerator} pEnum A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorenumerator">ID3D11VideoProcessorEnumerator</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
     * @param {Integer} RateConversionIndex Specifies the frame-rate conversion capabilities for the video processor. The value is a zero-based index that corresponds to the <i>TypeIndex</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorrateconversioncaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorRateConversionCaps</a> method.
     * @returns {ID3D11VideoProcessor} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor
     */
    CreateVideoProcessor(pEnum, RateConversionIndex) {
        result := ComCall(4, this, "ptr", pEnum, "uint", RateConversionIndex, "ptr*", &ppVideoProcessor := 0, "HRESULT")
        return ID3D11VideoProcessor(ppVideoProcessor)
    }

    /**
     * Creates a channel to communicate with the Microsoft Direct3D device or the graphics driver.
     * @param {Integer} ChannelType Specifies the type of channel, as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_authenticated_channel_type">D3D11_AUTHENTICATED_CHANNEL_TYPE</a> enumeration.
     * @returns {ID3D11AuthenticatedChannel} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11authenticatedchannel">ID3D11AuthenticatedChannel</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createauthenticatedchannel
     */
    CreateAuthenticatedChannel(ChannelType) {
        result := ComCall(5, this, "int", ChannelType, "ptr*", &ppAuthenticatedChannel := 0, "HRESULT")
        return ID3D11AuthenticatedChannel(ppAuthenticatedChannel)
    }

    /**
     * Creates a cryptographic session to encrypt video content that is sent to the graphics driver.
     * @param {Pointer<Guid>} pCryptoType A pointer to a GUID that specifies the type of encryption to use. The following GUIDs are defined.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_CRYPTO_TYPE_AES128_CTR"></a><a id="d3d11_crypto_type_aes128_ctr"></a><dl>
     * <dt><b>D3D11_CRYPTO_TYPE_AES128_CTR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pDecoderProfile A pointer to a GUID that specifies the decoding profile. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a>. If decoding will not be used, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} pKeyExchangeType A pointer to a GUID that specifies the type of key exchange.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_KEY_EXCHANGE_RSAES_OAEP"></a><a id="d3d11_key_exchange_rsaes_oaep"></a><dl>
     * <dt><b>D3D11_KEY_EXCHANGE_RSAES_OAEP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller will create the session key, encrypt it with RSA Encryption Scheme - Optimal Asymmetric Encryption Padding (RSAES-OAEP) by using the driver's public key, and pass the session key to the driver.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {ID3D11CryptoSession} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createcryptosession
     */
    CreateCryptoSession(pCryptoType, pDecoderProfile, pKeyExchangeType) {
        result := ComCall(6, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pKeyExchangeType, "ptr*", &ppCryptoSession := 0, "HRESULT")
        return ID3D11CryptoSession(ppCryptoSession)
    }

    /**
     * Creates a resource view for a video decoder, describing the output sample for the decoding operation.
     * @param {ID3D11Resource} pResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface of the decoder surface. The resource must be created with the <b>D3D11_BIND_DECODER</b> flag. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_FLAG</a>.
     * @param {Pointer<D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_output_view_desc">D3D11_VIDEO_DECODER_OUTPUT_VIEW_DESC</a> structure that describes the view.
     * @returns {ID3D11VideoDecoderOutputView} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoderoutputview">ID3D11VideoDecoderOutputView</a> interface. The caller must release the interface. If this parameter is <b>NULL</b>, the method checks whether the view is supported, but does not create the view.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview
     */
    CreateVideoDecoderOutputView(pResource, pDesc) {
        result := ComCall(7, this, "ptr", pResource, "ptr", pDesc, "ptr*", &ppVDOVView := 0, "HRESULT")
        return ID3D11VideoDecoderOutputView(ppVDOVView)
    }

    /**
     * Creates a resource view for a video processor, describing the input sample for the video processing operation.
     * @param {ID3D11Resource} pResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface of the input surface.
     * @param {ID3D11VideoProcessorEnumerator} pEnum A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorenumerator">ID3D11VideoProcessorEnumerator</a> interface that specifies the video processor. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_input_view_desc">D3D11_VIDEO_PROCESSOR_INPUT_VIEW_DESC</a> structure that describes the view.
     * @returns {ID3D11VideoProcessorInputView} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorinputview">ID3D11VideoProcessorInputView</a> interface. The caller must release the resource. If this parameter is <b>NULL</b>, the method checks whether the view is supported, but does not create the view.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorinputview
     */
    CreateVideoProcessorInputView(pResource, pEnum, pDesc) {
        result := ComCall(8, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr*", &ppVPIView := 0, "HRESULT")
        return ID3D11VideoProcessorInputView(ppVPIView)
    }

    /**
     * Creates a resource view for a video processor, describing the output sample for the video processing operation.
     * @param {ID3D11Resource} pResource A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> interface of the output surface. The resource must be created with the <b>D3D11_BIND_RENDER_TARGET</b> flag. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_FLAG</a>.
     * @param {ID3D11VideoProcessorEnumerator} pEnum A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorenumerator">ID3D11VideoProcessorEnumerator</a> interface that specifies the video processor. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator">ID3D11VideoDevice::CreateVideoProcessorEnumerator</a>.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_output_view_desc">D3D11_VIDEO_PROCESSOR_OUTPUT_VIEW_DESC</a> structure that describes the view.
     * @returns {ID3D11VideoProcessorOutputView} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessoroutputview">ID3D11VideoProcessorOutputView</a> interface. The caller must release the resource. If this parameter is <b>NULL</b>, the method checks whether the view is supported, but does not create the view.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createvideoprocessoroutputview
     */
    CreateVideoProcessorOutputView(pResource, pEnum, pDesc) {
        result := ComCall(9, this, "ptr", pResource, "ptr", pEnum, "ptr", pDesc, "ptr*", &ppVPOView := 0, "HRESULT")
        return ID3D11VideoProcessorOutputView(ppVPOView)
    }

    /**
     * Enumerates the video processor capabilities of the driver.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc">D3D11_VIDEO_PROCESSOR_CONTENT_DESC</a> structure that describes the video content.
     * @returns {ID3D11VideoProcessorEnumerator} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessorenumerator">ID3D11VideoProcessorEnumerator</a> interface. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-createvideoprocessorenumerator
     */
    CreateVideoProcessorEnumerator(pDesc) {
        result := ComCall(10, this, "ptr", pDesc, "ptr*", &ppEnum := 0, "HRESULT")
        return ID3D11VideoProcessorEnumerator(ppEnum)
    }

    /**
     * Gets the number of profiles that are supported by the driver.
     * @returns {Integer} Returns the number of profiles.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofilecount
     */
    GetVideoDecoderProfileCount() {
        result := ComCall(11, this, "uint")
        return result
    }

    /**
     * Gets a profile that is supported by the driver.
     * @param {Integer} Index The zero-based index of the profile. To get the number of profiles that the driver supports, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofilecount">ID3D11VideoDevice::GetVideoDecoderProfileCount</a>.
     * @returns {Guid} Receives a GUID that identifies the profile.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile
     */
    GetVideoDecoderProfile(Index) {
        pDecoderProfile := Guid()
        result := ComCall(12, this, "uint", Index, "ptr", pDecoderProfile, "HRESULT")
        return pDecoderProfile
    }

    /**
     * Given aprofile, checks whether the driver supports a specified output format.
     * @param {Pointer<Guid>} pDecoderProfile A pointer to a GUID that identifies the profile. To get the list of supported profiles, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a>.
     * @param {Integer} Format A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> value that specifies the output format. Typical values include <b>DXGI_FORMAT_NV12</b> and <b>DXGI_FORMAT_420_OPAQUE</b>.
     * @returns {BOOL} Receives the value <b>TRUE</b> if the format is supported, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-checkvideodecoderformat
     */
    CheckVideoDecoderFormat(pDecoderProfile, Format) {
        result := ComCall(13, this, "ptr", pDecoderProfile, "int", Format, "int*", &pSupported := 0, "HRESULT")
        return pSupported
    }

    /**
     * Gets the number of decoder configurations that the driver supports for a specified video description.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a> structure that describes the video stream.
     * @returns {Integer} Receives the number of decoder configurations.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfigcount
     */
    GetVideoDecoderConfigCount(pDesc) {
        result := ComCall(14, this, "ptr", pDesc, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Gets a decoder configuration that is supported by the driver.
     * @param {Pointer<D3D11_VIDEO_DECODER_DESC>} pDesc A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_desc">D3D11_VIDEO_DECODER_DESC</a> structure that describes the video stream.
     * @param {Integer} Index The zero-based index of the decoder configuration. To get the number of configurations that the driver supports, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfigcount">ID3D11VideoDevice::GetVideoDecoderConfigCount</a>.
     * @returns {D3D11_VIDEO_DECODER_CONFIG} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_config">D3D11_VIDEO_DECODER_CONFIG</a> structure. The method fills in the structure with the decoder configuration.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-getvideodecoderconfig
     */
    GetVideoDecoderConfig(pDesc, Index) {
        pConfig := D3D11_VIDEO_DECODER_CONFIG()
        result := ComCall(15, this, "ptr", pDesc, "uint", Index, "ptr", pConfig, "HRESULT")
        return pConfig
    }

    /**
     * Queries the driver for its content protection capabilities.
     * @param {Pointer<Guid>} pCryptoType A pointer to a GUID that specifies the type of encryption to be used. The following GUIDs are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_CRYPTO_TYPE_AES128_CTR"></a><a id="d3d11_crypto_type_aes128_ctr"></a><dl>
     * <dt><b>D3D11_CRYPTO_TYPE_AES128_CTR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If no encryption will be used, set this parameter to <b>NULL</b>.
     * @param {Pointer<Guid>} pDecoderProfile A pointer to a GUID that specifies the decoding profile. To get profiles that the driver supports, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a>. If decoding will not be used, set this parameter to <b>NULL</b>.
     * 
     * The driver might disallow some combinations of encryption type and profile.
     * @returns {D3D11_VIDEO_CONTENT_PROTECTION_CAPS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_content_protection_caps">D3D11_VIDEO_CONTENT_PROTECTION_CAPS</a> structure. The method fills in this structure with the driver's content protection capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-getcontentprotectioncaps
     */
    GetContentProtectionCaps(pCryptoType, pDecoderProfile) {
        pCaps := D3D11_VIDEO_CONTENT_PROTECTION_CAPS()
        result := ComCall(16, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "ptr", pCaps, "HRESULT")
        return pCaps
    }

    /**
     * Gets a cryptographic key-exchange mechanism that is supported by the driver.
     * @param {Pointer<Guid>} pCryptoType A pointer to a GUID that specifies the type of encryption to be used. The following GUIDs are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3D11_CRYPTO_TYPE_AES128_CTR"></a><a id="d3d11_crypto_type_aes128_ctr"></a><dl>
     * <dt><b>D3D11_CRYPTO_TYPE_AES128_CTR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 128-bit Advanced Encryption Standard CTR mode (AES-CTR) block cipher.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pDecoderProfile A pointer to a GUID that specifies the decoding profile. To get  profiles that the driver supports, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getvideodecoderprofile">ID3D11VideoDevice::GetVideoDecoderProfile</a>. If decoding will not be used, set this parameter to <b>NULL</b>.
     * @param {Integer} Index The zero-based index of the key-exchange type. The driver reports the number of types in the <b>KeyExchangeTypeCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_content_protection_caps">D3D11_VIDEO_CONTENT_PROTECTION_CAPS</a> structure.
     * @returns {Guid} Receives a GUID that identifies the type of key exchange.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-checkcryptokeyexchange
     */
    CheckCryptoKeyExchange(pCryptoType, pDecoderProfile, Index) {
        pKeyExchangeType := Guid()
        result := ComCall(17, this, "ptr", pCryptoType, "ptr", pDecoderProfile, "uint", Index, "ptr", pKeyExchangeType, "HRESULT")
        return pKeyExchangeType
    }

    /**
     * Sets private data on the video device and associates that data with a GUID.
     * @param {Pointer<Guid>} guid The GUID associated with the data.
     * @param {Integer} DataSize The size of the data, in bytes.
     * @param {Pointer} pData A pointer to the data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(18, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Sets a private IUnknown pointer on the video device and associates that pointer with a GUID.
     * @param {Pointer<Guid>} guid The GUID associated with the pointer.
     * @param {IUnknown} pData A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videodevice-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(19, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }
}
