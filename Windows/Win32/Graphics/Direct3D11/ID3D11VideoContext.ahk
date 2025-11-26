#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D11_AUTHENTICATED_CONFIGURE_OUTPUT.ahk
#Include .\ID3D11DeviceChild.ahk

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11devicecontext">ID3D11DeviceContext</a> interface pointer.
 * 
 * This interface provides access to several areas of Microsoft Direct3Dvideo functionality:
 * 
 * <ul>
 * <li>Hardware-accelerated video decoding</li>
 * <li>Video processing</li>
 * <li>GPU-based content protection</li>
 * <li>Video encryption and decryption</li>
 * </ul>
 * In Microsoft Direct3D 9, the equivalent functions were distributed across several interfaces:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3dauthenticatedchannel9">IDirect3DAuthenticatedChannel9</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nn-d3d9-idirect3dcryptosession9">IDirect3DCryptoSession9</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideodecoder">IDirectXVideoDecoder</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirectxvideoprocessor">IDirectXVideoProcessor</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/nn-dxvahd-idxvahd_videoprocessor">IDXVAHD_VideoProcessor</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11videocontext
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoContext extends ID3D11DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoContext
     * @type {Guid}
     */
    static IID => Guid("{61f21c45-3c0e-4a74-9cea-67100d9ad5e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDecoderBuffer", "ReleaseDecoderBuffer", "DecoderBeginFrame", "DecoderEndFrame", "SubmitDecoderBuffers", "DecoderExtension", "VideoProcessorSetOutputTargetRect", "VideoProcessorSetOutputBackgroundColor", "VideoProcessorSetOutputColorSpace", "VideoProcessorSetOutputAlphaFillMode", "VideoProcessorSetOutputConstriction", "VideoProcessorSetOutputStereoMode", "VideoProcessorSetOutputExtension", "VideoProcessorGetOutputTargetRect", "VideoProcessorGetOutputBackgroundColor", "VideoProcessorGetOutputColorSpace", "VideoProcessorGetOutputAlphaFillMode", "VideoProcessorGetOutputConstriction", "VideoProcessorGetOutputStereoMode", "VideoProcessorGetOutputExtension", "VideoProcessorSetStreamFrameFormat", "VideoProcessorSetStreamColorSpace", "VideoProcessorSetStreamOutputRate", "VideoProcessorSetStreamSourceRect", "VideoProcessorSetStreamDestRect", "VideoProcessorSetStreamAlpha", "VideoProcessorSetStreamPalette", "VideoProcessorSetStreamPixelAspectRatio", "VideoProcessorSetStreamLumaKey", "VideoProcessorSetStreamStereoFormat", "VideoProcessorSetStreamAutoProcessingMode", "VideoProcessorSetStreamFilter", "VideoProcessorSetStreamExtension", "VideoProcessorGetStreamFrameFormat", "VideoProcessorGetStreamColorSpace", "VideoProcessorGetStreamOutputRate", "VideoProcessorGetStreamSourceRect", "VideoProcessorGetStreamDestRect", "VideoProcessorGetStreamAlpha", "VideoProcessorGetStreamPalette", "VideoProcessorGetStreamPixelAspectRatio", "VideoProcessorGetStreamLumaKey", "VideoProcessorGetStreamStereoFormat", "VideoProcessorGetStreamAutoProcessingMode", "VideoProcessorGetStreamFilter", "VideoProcessorGetStreamExtension", "VideoProcessorBlt", "NegotiateCryptoSessionKeyExchange", "EncryptionBlt", "DecryptionBlt", "StartSessionKeyRefresh", "FinishSessionKeyRefresh", "GetEncryptionBltKey", "NegotiateAuthenticatedChannelKeyExchange", "QueryAuthenticatedChannel", "ConfigureAuthenticatedChannel", "VideoProcessorSetStreamRotation", "VideoProcessorGetStreamRotation"]

    /**
     * Gets a pointer to a decoder buffer.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
     * @param {Integer} Type The type of buffer to retrieve, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_decoder_buffer_type">D3D11_VIDEO_DECODER_BUFFER_TYPE</a> enumeration.
     * @param {Pointer<Integer>} pBufferSize Receives the size of the buffer, in bytes.
     * @param {Pointer<Pointer<Void>>} ppBuffer Receives a pointer to the start of the memory buffer.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-getdecoderbuffer
     */
    GetDecoderBuffer(pDecoder, Type, pBufferSize, ppBuffer) {
        pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pDecoder, "int", Type, pBufferSizeMarshal, pBufferSize, ppBufferMarshal, ppBuffer, "HRESULT")
        return result
    }

    /**
     * Releases a buffer that was obtained by calling the ID3D11VideoContext::GetDecoderBuffer method.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
     * @param {Integer} Type The type of buffer to release. Specify the same value that was used in the <i>Type</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-getdecoderbuffer">GetDecoderBuffer</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-releasedecoderbuffer
     */
    ReleaseDecoderBuffer(pDecoder, Type) {
        result := ComCall(8, this, "ptr", pDecoder, "int", Type, "HRESULT")
        return result
    }

    /**
     * Starts a decoding operation to decode a video frame.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
     * @param {ID3D11VideoDecoderOutputView} pView A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoderoutputview">ID3D11VideoDecoderOutputView</a> interface. This interface describes the resource that will receive the decoded frame. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview">ID3D11VideoDevice::CreateVideoDecoderOutputView</a>.
     * @param {Integer} ContentKeySize The size of the content key that is specified in <i>pContentKey</i>. If <i>pContentKey</i> is NULL, set <i>ContentKeySize</i> to zero.
     * @param {Pointer} pContentKey An optional pointer to a content key that was used to encrypt the frame data. If no content key was used, set this parameter to <b>NULL</b>. If the caller provides a content key, the caller must use the session key to encrypt the content key.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.  <b>D3DERR_WASSTILLDRAWING</b> or <b>E_PENDING</b> is returned if the harware is busy, in which case the decoder should try to make the call again.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-decoderbeginframe
     */
    DecoderBeginFrame(pDecoder, pView, ContentKeySize, pContentKey) {
        result := ComCall(9, this, "ptr", pDecoder, "ptr", pView, "uint", ContentKeySize, "ptr", pContentKey, "HRESULT")
        return result
    }

    /**
     * Signals the end of a decoding operation.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-decoderendframe
     */
    DecoderEndFrame(pDecoder) {
        result := ComCall(10, this, "ptr", pDecoder, "HRESULT")
        return result
    }

    /**
     * Submits one or more buffers for decoding.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a> method.
     * @param {Integer} NumBuffers The number of buffers submitted for decoding.
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC>} pBufferDesc A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_buffer_desc">D3D11_VIDEO_DECODER_BUFFER_DESC</a> structures. The <i>NumBuffers</i> parameter specifies the number of elements in the array. Each element in the array describes a compressed buffer for decoding.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-submitdecoderbuffers
     */
    SubmitDecoderBuffers(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(11, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "HRESULT")
        return result
    }

    /**
     * Performs an extended function for decoding.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a>.
     * @param {Pointer<D3D11_VIDEO_DECODER_EXTENSION>} pExtensionData A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_decoder_extension">D3D11_VIDEO_DECODER_EXTENSION</a> structure that contains data for the function.
     * @returns {Integer} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-decoderextension
     */
    DecoderExtension(pDecoder, pExtensionData) {
        result := ComCall(12, this, "ptr", pDecoder, "ptr", pExtensionData, "int")
        return result
    }

    /**
     * Sets the target rectangle for the video processor.
     * @remarks
     * 
     * The target rectangle is the area within the destination surface where the output will be drawn. The target rectangle is given in pixel coordinates, relative to the destination surface.
     * 
     * If this method is never called, or if the <i>Enable</i> parameter is <b>FALSE</b>, the video processor writes to the entire destination surface.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {BOOL} Enable Specifies whether to apply the target rectangle.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162897(v=vs.85)">RECT</a> structure that specifies the target rectangle.  If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputtargetrect
     */
    VideoProcessorSetOutputTargetRect(pVideoProcessor, Enable, pRect) {
        ComCall(13, this, "ptr", pVideoProcessor, "int", Enable, "ptr", pRect)
    }

    /**
     * Sets the background color for the video processor.
     * @remarks
     * 
     * The video processor uses the background color to fill areas of the target rectangle that do not contain a video image. Areas outside the target rectangle are not affected.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {BOOL} YCbCr If <b>TRUE</b>, the color is specified as a YCbCr value. Otherwise, the color is specified as an RGB value.
     * @param {Pointer<D3D11_VIDEO_COLOR>} pColor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_color">D3D11_VIDEO_COLOR</a> structure that specifies the background color.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputbackgroundcolor
     */
    VideoProcessorSetOutputBackgroundColor(pVideoProcessor, YCbCr, pColor) {
        ComCall(14, this, "ptr", pVideoProcessor, "int", YCbCr, "ptr", pColor)
    }

    /**
     * Sets the output color space for the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_color_space">D3D11_VIDEO_PROCESSOR_COLOR_SPACE</a> structure that specifies the color space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputcolorspace
     */
    VideoProcessorSetOutputColorSpace(pVideoProcessor, pColorSpace) {
        ComCall(15, this, "ptr", pVideoProcessor, "ptr", pColorSpace)
    }

    /**
     * Sets the alpha fill mode for data that the video processor writes to the render target.
     * @remarks
     * 
     * To find out which fill modes the device supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> method. If the driver reports the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALPHA_FILL</b> capability, the driver supports all of the fill modes. Otherwise, the <i>AlphaFillMode</i> parameter must be <b>D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_OPAQUE</b>.
     * 
     * 
     * 
     * The default fill mode is <b>D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_OPAQUE</b>.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} AlphaFillMode The alpha fill mode, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_alpha_fill_mode">D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE</a> value.
     * @param {Integer} StreamIndex The zero-based index of an input stream. This parameter is used if <i>AlphaFillMode</i> is <b>D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_SOURCE_STREAM</b>. Otherwise, the parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputalphafillmode
     */
    VideoProcessorSetOutputAlphaFillMode(pVideoProcessor, AlphaFillMode, StreamIndex) {
        ComCall(16, this, "ptr", pVideoProcessor, "int", AlphaFillMode, "uint", StreamIndex)
    }

    /**
     * Sets the amount of downsampling to perform on the output.
     * @remarks
     * 
     * Downsampling is sometimes used to reduce the quality of premium content when other forms of content protection are not available. By default, downsampling is disabled.
     * 
     * If the <i>Enable</i> parameter is <b>TRUE</b>, the driver downsamples the composed image  to the specified size, and then scales it back to the size of the target rectangle.
     * 
     * The width and height of <i>Size</i> must be greater than zero. If the size is larger than the target rectangle, downsampling does not occur.
     * 
     * To use this feature, the driver must support downsampling, indicated by the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_CONSTRICTION</b> capability flag. To query for this capability, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a>.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {BOOL} Enable If <b>TRUE</b>, downsampling is enabled. Otherwise, downsampling is disabled and the <b>Size</b> member is ignored.
     * @param {SIZE} Size The sampling size.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputconstriction
     */
    VideoProcessorSetOutputConstriction(pVideoProcessor, Enable, Size) {
        ComCall(17, this, "ptr", pVideoProcessor, "int", Enable, "ptr", Size)
    }

    /**
     * Specifies whether the video processor produces stereo video frames.
     * @remarks
     * 
     * By default, the video processor produces mono video frames.
     * 
     * To use this feature, the driver must support stereo video, indicated by the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_STEREO</b> capability flag. To query for this capability, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a>.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {BOOL} Enable If <b>TRUE</b>, stereo output is enabled. Otherwise, the video processor produces mono video frames.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputstereomode
     */
    VideoProcessorSetOutputStereoMode(pVideoProcessor, Enable) {
        ComCall(18, this, "ptr", pVideoProcessor, "int", Enable)
    }

    /**
     * Sets a driver-specific video processing state.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<Guid>} pExtensionGuid A pointer to a GUID that identifies the operation. The meaning of this GUID is defined by the graphics driver.
     * @param {Integer} DataSize The size of the <i>pData</i> buffer, in bytes.
     * @param {Pointer<Void>} pData A pointer to a buffer that contains private state data. The method passes this buffer directly to the driver without validation. It is the responsibility of the driver to validate the data.
     * @returns {Integer} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputextension
     */
    VideoProcessorSetOutputExtension(pVideoProcessor, pExtensionGuid, DataSize, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(19, this, "ptr", pVideoProcessor, "ptr", pExtensionGuid, "uint", DataSize, pDataMarshal, pData, "int")
        return result
    }

    /**
     * Gets the current target rectangle for the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<BOOL>} Enabled Receives the value <b>TRUE</b> if the target rectangle was explicitly set using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputtargetrect">ID3D11VideoContext::VideoProcessorSetOutputTargetRect</a> method. Receives the value FALSE if the target rectangle was disabled or was never set.
     * @param {Pointer<RECT>} pRect If <i>Enabled</i> receives the value <b>TRUE</b>, this parameter receives the target rectangle. Otherwise, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputtargetrect
     */
    VideoProcessorGetOutputTargetRect(pVideoProcessor, Enabled, pRect) {
        EnabledMarshal := Enabled is VarRef ? "int*" : "ptr"

        ComCall(20, this, "ptr", pVideoProcessor, EnabledMarshal, Enabled, "ptr", pRect)
    }

    /**
     * Gets the current background color for the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<BOOL>} pYCbCr Receives the value <b>TRUE</b> if the background color is a YCbCr color, or <b>FALSE</b> if the background color is an RGB color.
     * @param {Pointer<D3D11_VIDEO_COLOR>} pColor A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_color">D3D11_VIDEO_COLOR</a> structure. The method fills in the structure with the background color.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputbackgroundcolor
     */
    VideoProcessorGetOutputBackgroundColor(pVideoProcessor, pYCbCr, pColor) {
        pYCbCrMarshal := pYCbCr is VarRef ? "int*" : "ptr"

        ComCall(21, this, "ptr", pVideoProcessor, pYCbCrMarshal, pYCbCr, "ptr", pColor)
    }

    /**
     * Gets the current output color space for the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_color_space">D3D11_VIDEO_PROCESSOR_COLOR_SPACE</a> structure. The method fills in the structure with the output color space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputcolorspace
     */
    VideoProcessorGetOutputColorSpace(pVideoProcessor, pColorSpace) {
        ComCall(22, this, "ptr", pVideoProcessor, "ptr", pColorSpace)
    }

    /**
     * Gets the current alpha fill mode for the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<Integer>} pAlphaFillMode Receives the alpha fill mode, as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_alpha_fill_mode">D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE</a> value.
     * @param {Pointer<Integer>} pStreamIndex If the alpha fill mode is <b>D3D11_VIDEO_PROCESSOR_ALPHA_FILL_MODE_SOURCE_STREAM</b>, this parameter receives the zero-based index of an input stream. The input stream provides the alpha values for the alpha fill.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputalphafillmode
     */
    VideoProcessorGetOutputAlphaFillMode(pVideoProcessor, pAlphaFillMode, pStreamIndex) {
        pAlphaFillModeMarshal := pAlphaFillMode is VarRef ? "int*" : "ptr"
        pStreamIndexMarshal := pStreamIndex is VarRef ? "uint*" : "ptr"

        ComCall(23, this, "ptr", pVideoProcessor, pAlphaFillModeMarshal, pAlphaFillMode, pStreamIndexMarshal, pStreamIndex)
    }

    /**
     * Gets the current level of downsampling that is performed by the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if downsampling was explicitly enabled using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputconstriction">ID3D11VideoContext::VideoProcessorSetOutputConstriction</a> method. Receives the value <b>FALSE</b> if the downsampling was disabled or was never set.
     * @param {Pointer<SIZE>} pSize If <i>Enabled</i> receives the value <b>TRUE</b>, this parameter receives the downsampling size. Otherwise, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputconstriction
     */
    VideoProcessorGetOutputConstriction(pVideoProcessor, pEnabled, pSize) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(24, this, "ptr", pVideoProcessor, pEnabledMarshal, pEnabled, "ptr", pSize)
    }

    /**
     * Queries whether the video processor produces stereo video frames.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if stereo output is enabled, or <b>FALSE</b> otherwise.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputstereomode
     */
    VideoProcessorGetOutputStereoMode(pVideoProcessor, pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(25, this, "ptr", pVideoProcessor, pEnabledMarshal, pEnabled)
    }

    /**
     * Gets private state data from the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Pointer<Guid>} pExtensionGuid A pointer to a GUID that identifies the state. The meaning of this GUID is defined by the graphics driver.
     * @param {Integer} DataSize The size of the <i>pData</i> buffer, in bytes.
     * @param {Pointer} pData A pointer to a buffer that receives the private state data.
     * @returns {Integer} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputextension
     */
    VideoProcessorGetOutputExtension(pVideoProcessor, pExtensionGuid, DataSize, pData) {
        result := ComCall(26, this, "ptr", pVideoProcessor, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * Specifies whether an input stream on the video processor contains interlaced or progressive frames.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Integer} FrameFormat A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_frame_format">D3D11_VIDEO_FRAME_FORMAT</a> value that specifies the interlacing.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamframeformat
     */
    VideoProcessorSetStreamFrameFormat(pVideoProcessor, StreamIndex, FrameFormat) {
        ComCall(27, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", FrameFormat)
    }

    /**
     * Sets the color space for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_color_space">D3D11_VIDEO_PROCESSOR_COLOR_SPACE</a> structure that specifies the color space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamcolorspace
     */
    VideoProcessorSetStreamColorSpace(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(28, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pColorSpace)
    }

    /**
     * Sets the rate at which the video processor produces output frames for an input stream.
     * @remarks
     * 
     * The standard output rates are normal frame-rate (<b>D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_NORMAL</b>) and half frame-rate (<b>D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_HALF</b>). In addition, the driver might support custom rates  for rate conversion or inverse telecine. To get the list of custom rates, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcustomrate">ID3D11VideoProcessorEnumerator::GetVideoProcessorCustomRate</a>.
     * 
     * Depending on the output rate, the driver might need to convert the frame rate. If so, the value of <i>RepeatFrame</i> controls whether the driver creates interpolated frames or simply repeats input frames.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Integer} OutputRate The output rate, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_output_rate">D3D11_VIDEO_PROCESSOR_OUTPUT_RATE</a> value.
     * @param {BOOL} RepeatFrame Specifies how the driver performs frame-rate conversion, if required.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Repeat frames.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interpolate frames.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DXGI_RATIONAL>} pCustomRate A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure. If <i>OutputRate</i> is <b>D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_CUSTOM</b>,  this parameter specifies the exact output rate. Otherwise, this parameter is ignored and can be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamoutputrate
     */
    VideoProcessorSetStreamOutputRate(pVideoProcessor, StreamIndex, OutputRate, RepeatFrame, pCustomRate) {
        ComCall(29, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", OutputRate, "int", RepeatFrame, "ptr", pCustomRate)
    }

    /**
     * Sets the source rectangle for an input stream on the video processor.
     * @remarks
     * 
     * The source rectangle is the portion of the input surface that is  blitted to the destination surface. The source rectangle is given in pixel coordinates, relative to the input surface.
     * 
     * If this method is never called, or if the <i>Enable</i> parameter is <b>FALSE</b>, the video processor reads from the entire input surface.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies whether to apply the source rectangle.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162897(v=vs.85)">RECT</a> structure that specifies the source rectangle. If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamsourcerect
     */
    VideoProcessorSetStreamSourceRect(pVideoProcessor, StreamIndex, Enable, pRect) {
        ComCall(30, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pRect)
    }

    /**
     * Sets the destination rectangle for an input stream on the video processor.
     * @remarks
     * 
     * The destination rectangle is the portion of the output surface that receives the blit for this stream. The destination rectangle is given in pixel coordinates, relative to the output surface.
     * 
     * The default destination rectangle is an empty rectangle (0, 0, 0, 0). If this method is never called, or if the <i>Enable</i> parameter is <b>FALSE</b>, no data is written from this stream.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies whether to apply the destination rectangle.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162897(v=vs.85)">RECT</a> structure that specifies the destination rectangle. If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamdestrect
     */
    VideoProcessorSetStreamDestRect(pVideoProcessor, StreamIndex, Enable, pRect) {
        ComCall(31, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pRect)
    }

    /**
     * Sets the planar alpha for an input stream on the video processor.
     * @remarks
     * 
     * To use this feature, the driver must support stereo video, indicated by the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALHPA_STREAM</a> capability flag. To query for this  capability, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a>.
     * 
     * Alpha blending is disabled by default. 
     *         
     * 
     * For each pixel, the destination color value is computed as follows:
     * 
     * <c>Cd = Cs * (As * Ap * Ae) + Cd * (1.0 - As * Ap * Ae)</c>
     * 
     * where:
     * 
     * <ul>
     * <li><c>Cd</c> = The color value of the destination pixel</li>
     * <li><c>Cs</c> = The color value of the source pixel</li>
     * <li><c>As</c> = The per-pixel source alpha</li>
     * <li><c>Ap</c> = The planar alpha value</li>
     * <li><c>Ae</c> = The palette-entry alpha value, or 1.0 (see Note)</li>
     * </ul>
     * <div class="alert"><b>Note</b>  Palette-entry alpha values apply only to palettized color formats, and only when the device supports the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALPHA_PALETTE</b> capability. Otherwise, this factor equals 1.0. </div>
     * <div> </div>
     * The destination alpha value is computed according to the alpha fill mode. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputalphafillmode">ID3D11VideoContext::VideoProcessorSetOutputAlphaFillMode</a>.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies whether alpha blending is enabled.
     * @param {Float} Alpha The planar alpha value. The value can range from 0.0 (transparent) to 1.0 (opaque). 
     *  If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamalpha
     */
    VideoProcessorSetStreamAlpha(pVideoProcessor, StreamIndex, Enable, Alpha) {
        ComCall(32, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "float", Alpha)
    }

    /**
     * Sets the color-palette entries for an input stream on the video processor.
     * @remarks
     * 
     * This method applies only to  input streams that have a palettized color format. Palettized formats with 4 bits per pixel (bpp) use the first 16 entries in the list. Formats with 8 bpp use the first 256 entries.
     * 
     * If a pixel has a palette index greater than the number of entries, the device treats the pixel as white with opaque alpha. For full-range RGB, this value is (255, 255, 255, 255); for YCbCr the value is (255, 235, 128, 128).
     * 
     * If the driver does not report the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ALPHA_PALETTE</b> capability flag, every palette entry must have an alpha value of 0xFF (opaque). To query for this capability, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a>.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Integer} Count The number of elements in the <i>pEntries</i> array.
     * @param {Pointer<Integer>} pEntries A pointer to an array of palette entries. For RGB streams, the palette entries use the <b>DXGI_FORMAT_B8G8R8A8</b> representation. For YCbCr streams, the palette entries use the <b>DXGI_FORMAT_AYUV</b> representation. The caller allocates the array.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreampalette
     */
    VideoProcessorSetStreamPalette(pVideoProcessor, StreamIndex, Count, pEntries) {
        pEntriesMarshal := pEntries is VarRef ? "uint*" : "ptr"

        ComCall(33, this, "ptr", pVideoProcessor, "uint", StreamIndex, "uint", Count, pEntriesMarshal, pEntries)
    }

    /**
     * Sets the pixel aspect ratio for an input stream on the video processor.
     * @remarks
     * 
     * This function can only be called if the driver reports the     <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_feature_caps">D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_PIXEL_ASPECT_RATIO</a>  capability. If this capability is not set, this function will have no effect.
     * 
     * Pixel aspect ratios of the form 0/n and n/0 are not valid.
     * 
     * The default pixel aspect ratio is 1:1 (square pixels).
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies whether the <i>pSourceAspectRatio</i> and <i>pDestinationAspectRatio</i> parameters contain valid values. Otherwise, the pixel aspect ratios are unspecified.
     * @param {Pointer<DXGI_RATIONAL>} pSourceAspectRatio A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that contains the pixel aspect ratio of the source rectangle. If <i>Enable</i> is <b>FALSE</b>, this parameter can be <b>NULL</b>.
     * @param {Pointer<DXGI_RATIONAL>} pDestinationAspectRatio A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that contains the pixel aspect ratio of the destination rectangle. If <i>Enable</i> is <b>FALSE</b>, this parameter can be <b>NULL</b>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreampixelaspectratio
     */
    VideoProcessorSetStreamPixelAspectRatio(pVideoProcessor, StreamIndex, Enable, pSourceAspectRatio, pDestinationAspectRatio) {
        ComCall(34, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pSourceAspectRatio, "ptr", pDestinationAspectRatio)
    }

    /**
     * Sets the luma key for an input stream on the video processor.
     * @remarks
     * 
     * To use this feature, the driver must support luma keying, indicated by the <b>D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_LUMA_KEY</b> capability flag. To query for this capability, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a>. In addition, if the input format is RGB, the device must support the <b>D3D11_VIDEO_PROCESSOR_FORMAT_CAPS_RGB_LUMA_KEY</b> capability.
     * 
     * The values of <i>Lower</i> and <i>Upper</i> give the lower and upper bounds of the luma key, using a nominal range of [0...1]. Given a format with <i>n</i> bits per channel, these values are converted to luma values as follows:
     * 
     * <c>val = f * ((1 &lt;&lt; n)-1)</c>
     * 
     * Any pixel whose luma value falls within the upper and lower bounds (inclusive) is treated as transparent.
     * 
     * For example, if the pixel format uses 8-bit luma, the upper bound is calculated as follows:
     * 
     * <c>BYTE Y = BYTE(max(min(1.0, Upper), 0.0) * 255.0)</c>
     * 
     * Note that the value is clamped to the range [0...1] before multiplying by 255.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies whether luma keying is enabled.
     * @param {Float} Lower The lower bound for the luma key. The valid range is [0…1]. If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored.
     * @param {Float} Upper The upper bound for the luma key. The valid range is [0…1]. If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamlumakey
     */
    VideoProcessorSetStreamLumaKey(pVideoProcessor, StreamIndex, Enable, Lower, Upper) {
        ComCall(35, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "float", Lower, "float", Upper)
    }

    /**
     * Enables or disables stereo 3D video for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies whether stereo 3D is enabled for this stream. If the value is <b>FALSE</b>, the remaining parameters of this method are ignored.
     * @param {Integer} Format Specifies the layout of the two stereo views in memory, as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_format">D3D11_VIDEO_PROCESSOR_STEREO_FORMAT</a> value.
     * @param {BOOL} LeftViewFrame0 If <b>TRUE</b>, frame 0 contains the left view. Otherwise, frame 0 contains the right view. 
     * 
     * This parameter is ignored for the following stereo formats:
     * 
     * <ul>
     * <li><b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO </b></li>
     * <li><b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET</b></li>
     * </ul>
     * @param {BOOL} BaseViewFrame0 If <b>TRUE</b>, frame 0 contains the base view. Otherwise, frame 1 contains the base view.
     * 
     * This parameter is ignored for the following stereo formats:
     * 
     * <ul>
     * <li><b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO </b></li>
     * <li><b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET</b></li>
     * <li>When <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_SEPARATE</b> is used and the application wants to convert the stereo data to mono, it can either:<ul>
     * <li>Specify the base view as a mono input.</li>
     * <li>Specify both resources and allow the driver to do the conversion from the base view.  In this case, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_stream">D3D11_VIDEO_PROCESSOR_STREAM.hInputSurface</a> is considered frame 0 and <b>D3D11_VIDEO_PROCESSOR_STREAM.hInputSurfaceRight</b> is considered frame 1.</li>
     * </ul>
     * </li>
     * </ul>
     * @param {Integer} FlipMode A flag from the  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_flip_mode">D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE</a> enumeration, specifying whether one of the views is flipped.
     * @param {Integer} MonoOffset For <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET</b> format, this parameter specifies how to generate the left and right views:  
     * 
     * <ul>
     * <li>If <i>MonoOffset</i> is positive, the right view is shifted to the right by that many pixels, and the left view is shifted to the left by the same amount. </li>
     * <li>If <i>MonoOffset</i> is negative, the right view is shifted to the left by that many pixels, and the left view is shifted to right by the same amount.</li>
     * </ul>
     * If <i>Format</i> is not <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET</b>, this parameter must be zero.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat
     */
    VideoProcessorSetStreamStereoFormat(pVideoProcessor, StreamIndex, Enable, Format, LeftViewFrame0, BaseViewFrame0, FlipMode, MonoOffset) {
        ComCall(36, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", Format, "int", LeftViewFrame0, "int", BaseViewFrame0, "int", FlipMode, "int", MonoOffset)
    }

    /**
     * Enables or disables automatic processing features on the video processor.
     * @remarks
     * 
     * By default, the driver might perform certain processing tasks automatically during the video processor blit. This method enables the application to disable these extra video processing features. For example, if you provide your own pixel  shader for the video processor, you might want to disable the driver's automatic processing.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable If <b>TRUE</b>, automatic processing features are enabled. If <b>FALSE</b>, the driver disables any  extra video processing that it might be performing.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamautoprocessingmode
     */
    VideoProcessorSetStreamAutoProcessingMode(pVideoProcessor, StreamIndex, Enable) {
        ComCall(37, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable)
    }

    /**
     * Enables or disables an image filter for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Integer} Filter The filter, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_filter">D3D11_VIDEO_PROCESSOR_FILTER</a> value.
     * 
     * To query which filters the driver supports, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a>.
     * @param {BOOL} Enable Specifies whether to enable the filter.
     * @param {Integer} Level The filter level. If <i>Enable</i> is <b>FALSE</b>, this parameter is ignored. 
     * 
     * To find the valid range of levels for a specified filter, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorfilterrange">ID3D11VideoProcessorEnumerator::GetVideoProcessorFilterRange</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamfilter
     */
    VideoProcessorSetStreamFilter(pVideoProcessor, StreamIndex, Filter, Enable, Level) {
        ComCall(38, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Filter, "int", Enable, "int", Level)
    }

    /**
     * Sets a driver-specific state on a video processing stream.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<Guid>} pExtensionGuid A pointer to a GUID that identifies the operation. The meaning of this GUID is defined by the graphics driver.
     * @param {Integer} DataSize The size of the <i>pData</i> buffer, in bytes.
     * @param {Pointer<Void>} pData A pointer to a buffer that contains private state data. The method passes this buffer directly to the driver without validation. It is the responsibility of the driver to validate the data.
     * @returns {Integer} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamextension
     */
    VideoProcessorSetStreamExtension(pVideoProcessor, StreamIndex, pExtensionGuid, DataSize, pData) {
        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(39, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pExtensionGuid, "uint", DataSize, pDataMarshal, pData, "int")
        return result
    }

    /**
     * Gets the format of an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<Integer>} pFrameFormat Receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_frame_format">D3D11_VIDEO_FRAME_FORMAT</a> value that specifies whether the stream contains interlaced or progressive frames.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamframeformat
     */
    VideoProcessorGetStreamFrameFormat(pVideoProcessor, StreamIndex, pFrameFormat) {
        pFrameFormatMarshal := pFrameFormat is VarRef ? "int*" : "ptr"

        ComCall(40, this, "ptr", pVideoProcessor, "uint", StreamIndex, pFrameFormatMarshal, pFrameFormat)
    }

    /**
     * Gets the color space for an input stream of the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace Receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_color_space">D3D11_VIDEO_PROCESSOR_COLOR_SPACE</a> value that specifies the color space.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamcolorspace
     */
    VideoProcessorGetStreamColorSpace(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(41, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pColorSpace)
    }

    /**
     * Gets the rate at which the video processor produces output frames for an input stream.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<Integer>} pOutputRate Receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_output_rate">D3D11_VIDEO_PROCESSOR_OUTPUT_RATE</a> value that specifies the output rate.
     * @param {Pointer<BOOL>} pRepeatFrame Receives a Boolean value that specifies how the driver performs frame-rate conversion, if required.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Repeat frames.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Interpolate frames.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<DXGI_RATIONAL>} pCustomRate A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure. If the output rate is <b>D3D11_VIDEO_PROCESSOR_OUTPUT_RATE_CUSTOM</b>, the method fills in this structure with the exact output rate. Otherwise, this parameter is ignored.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamoutputrate
     */
    VideoProcessorGetStreamOutputRate(pVideoProcessor, StreamIndex, pOutputRate, pRepeatFrame, pCustomRate) {
        pOutputRateMarshal := pOutputRate is VarRef ? "int*" : "ptr"
        pRepeatFrameMarshal := pRepeatFrame is VarRef ? "int*" : "ptr"

        ComCall(42, this, "ptr", pVideoProcessor, "uint", StreamIndex, pOutputRateMarshal, pOutputRate, pRepeatFrameMarshal, pRepeatFrame, "ptr", pCustomRate)
    }

    /**
     * Gets the source rectangle for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if the source rectangle is enabled, or <b>FALSE</b> otherwise.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162897(v=vs.85)">RECT</a> structure that receives the source rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamsourcerect
     */
    VideoProcessorGetStreamSourceRect(pVideoProcessor, StreamIndex, pEnabled, pRect) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(43, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnabledMarshal, pEnabled, "ptr", pRect)
    }

    /**
     * Gets the destination rectangle for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if the destination rectangle is enabled, or <b>FALSE</b> otherwise.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162897(v=vs.85)">RECT</a> structure that receives the destination rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamdestrect
     */
    VideoProcessorGetStreamDestRect(pVideoProcessor, StreamIndex, pEnabled, pRect) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(44, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnabledMarshal, pEnabled, "ptr", pRect)
    }

    /**
     * Gets the planar alpha for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if planar alpha is enabled, or <b>FALSE</b> otherwise.
     * @param {Pointer<Float>} pAlpha Receives the planar alpha value. The value can range from 0.0 (transparent) to 1.0 (opaque).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamalpha
     */
    VideoProcessorGetStreamAlpha(pVideoProcessor, StreamIndex, pEnabled, pAlpha) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"
        pAlphaMarshal := pAlpha is VarRef ? "float*" : "ptr"

        ComCall(45, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnabledMarshal, pEnabled, pAlphaMarshal, pAlpha)
    }

    /**
     * Gets the color-palette entries for an input stream on the video processor.
     * @remarks
     * 
     * This method applies only to input streams that have a palettized color format. Palettized formats with 4 bits per pixel (bpp) use 16 palette entries. Formats with 8 bpp use 256 entries.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Integer} Count The number of entries in the <i>pEntries</i> array.
     * @param {Pointer<Integer>} pEntries A pointer to a <b>UINT</b> array allocated by the caller. The method fills the array with the palette entries. For RGB streams, the palette entries use the <b>DXGI_FORMAT_B8G8R8A8</b> representation. For YCbCr streams, the palette entries use the <b>DXGI_FORMAT_AYUV</b> representation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreampalette
     */
    VideoProcessorGetStreamPalette(pVideoProcessor, StreamIndex, Count, pEntries) {
        pEntriesMarshal := pEntries is VarRef ? "uint*" : "ptr"

        ComCall(46, this, "ptr", pVideoProcessor, "uint", StreamIndex, "uint", Count, pEntriesMarshal, pEntries)
    }

    /**
     * Gets the pixel aspect ratio for an input stream on the video processor.
     * @remarks
     * 
     * When the method returns, if <i>*pEnabled</i> is <b>TRUE</b>, the <i>pSourceAspectRatio</i> and <i>pDestinationAspectRatio</i> parameters contain the pixel aspect ratios. Otherwise, the default pixel aspect ratio is 1:1 (square pixels).
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if the pixel aspect ratio is specified. Otherwise, receives the value <b>FALSE</b>.
     * @param {Pointer<DXGI_RATIONAL>} pSourceAspectRatio A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure. If *<i>pEnabled</i> is <b>TRUE</b>, this parameter receives the pixel aspect ratio of the source rectangle.
     * @param {Pointer<DXGI_RATIONAL>} pDestinationAspectRatio A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure. If *<i>pEnabled</i> is <b>TRUE</b>, this parameter receives the pixel aspect ratio of the destination rectangle.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreampixelaspectratio
     */
    VideoProcessorGetStreamPixelAspectRatio(pVideoProcessor, StreamIndex, pEnabled, pSourceAspectRatio, pDestinationAspectRatio) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(47, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnabledMarshal, pEnabled, "ptr", pSourceAspectRatio, "ptr", pDestinationAspectRatio)
    }

    /**
     * Gets the luma key for an input stream of the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if luma keying is enabled, or <b>FALSE</b> otherwise.
     * @param {Pointer<Float>} pLower Receives the lower bound for the luma key. The valid range is [0…1].
     * @param {Pointer<Float>} pUpper Receives the upper bound for the luma key. The valid range is [0…1].
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamlumakey
     */
    VideoProcessorGetStreamLumaKey(pVideoProcessor, StreamIndex, pEnabled, pLower, pUpper) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"
        pLowerMarshal := pLower is VarRef ? "float*" : "ptr"
        pUpperMarshal := pUpper is VarRef ? "float*" : "ptr"

        ComCall(48, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnabledMarshal, pEnabled, pLowerMarshal, pLower, pUpperMarshal, pUpper)
    }

    /**
     * Gets the stereo 3D format for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnable Receives the value <b>TRUE</b> if stereo 3D is enabled for this stream, or <b>FALSE</b> otherwise. If the value is <b>FALSE</b>, ignore the remaining parameters.
     * @param {Pointer<Integer>} pFormat Receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_format">D3D11_VIDEO_PROCESSOR_STEREO_FORMAT</a> value that specifies the layout of the two stereo views in memory.
     * @param {Pointer<BOOL>} pLeftViewFrame0 Receives a Boolean value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Frame 0 contains the left view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Frame 0 contains the right view.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<BOOL>} pBaseViewFrame0 Receives a Boolean value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Frame 0 contains the base view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Frame 1 contains the base view.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlipMode Receives a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_flip_mode">D3D11_VIDEO_PROCESSOR_STEREO_FLIP_MODE</a> value. This value specifies whether one of the views is flipped.
     * @param {Pointer<Integer>} MonoOffset Receives the pixel offset used for <b>D3D11_VIDEO_PROCESSOR_STEREO_FORMAT_MONO_OFFSET</b> format. This parameter is ignored for other stereo formats.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamstereoformat
     */
    VideoProcessorGetStreamStereoFormat(pVideoProcessor, StreamIndex, pEnable, pFormat, pLeftViewFrame0, pBaseViewFrame0, pFlipMode, MonoOffset) {
        pEnableMarshal := pEnable is VarRef ? "int*" : "ptr"
        pFormatMarshal := pFormat is VarRef ? "int*" : "ptr"
        pLeftViewFrame0Marshal := pLeftViewFrame0 is VarRef ? "int*" : "ptr"
        pBaseViewFrame0Marshal := pBaseViewFrame0 is VarRef ? "int*" : "ptr"
        pFlipModeMarshal := pFlipMode is VarRef ? "int*" : "ptr"
        MonoOffsetMarshal := MonoOffset is VarRef ? "int*" : "ptr"

        ComCall(49, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnableMarshal, pEnable, pFormatMarshal, pFormat, pLeftViewFrame0Marshal, pLeftViewFrame0, pBaseViewFrame0Marshal, pBaseViewFrame0, pFlipModeMarshal, pFlipMode, MonoOffsetMarshal, MonoOffset)
    }

    /**
     * Queries whether automatic processing features of the video processor are enabled.
     * @remarks
     * 
     * Automatic processing  refers to additional image processing that drivers might have performed on the image data prior to the application receiving the data.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if automatic processing features are enabled, or <b>FALSE</b> otherwise.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamautoprocessingmode
     */
    VideoProcessorGetStreamAutoProcessingMode(pVideoProcessor, StreamIndex, pEnabled) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"

        ComCall(50, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnabledMarshal, pEnabled)
    }

    /**
     * Gets the image filter settings for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Integer} Filter The filter to query, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_filter">D3D11_VIDEO_PROCESSOR_FILTER</a> value.
     * @param {Pointer<BOOL>} pEnabled Receives the value <b>TRUE</b> if the image filter is enabled, or <b>FALSE</b> otherwise.
     * @param {Pointer<Integer>} pLevel Receives the filter level.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamfilter
     */
    VideoProcessorGetStreamFilter(pVideoProcessor, StreamIndex, Filter, pEnabled, pLevel) {
        pEnabledMarshal := pEnabled is VarRef ? "int*" : "ptr"
        pLevelMarshal := pLevel is VarRef ? "int*" : "ptr"

        ComCall(51, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Filter, pEnabledMarshal, pEnabled, pLevelMarshal, pLevel)
    }

    /**
     * Gets a driver-specific state for a video processing stream.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<Guid>} pExtensionGuid A pointer to a GUID that identifies the state. The meaning of this GUID is defined by the graphics driver.
     * @param {Integer} DataSize The size of the <i>pData</i> buffer, in bytes.
     * @param {Pointer} pData A pointer to a buffer that receives the private state data.
     * @returns {Integer} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamextension
     */
    VideoProcessorGetStreamExtension(pVideoProcessor, StreamIndex, pExtensionGuid, DataSize, pData) {
        result := ComCall(52, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * Performs a video processing operation on one or more input samples and writes the result to a Direct3D surface.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call the <a href="https://docs.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a> method.
     * @param {ID3D11VideoProcessorOutputView} pView A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessoroutputview">ID3D11VideoProcessorOutputView</a> interface for the output surface. The output of the video processing operation will be written to this surface.
     * @param {Integer} OutputFrame The frame number of the output video frame, indexed from zero.
     * @param {Integer} StreamCount The number of input streams to process.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_STREAM>} pStreams A pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_stream">D3D11_VIDEO_PROCESSOR_STREAM</a> structures that contain information about the input streams. The caller allocates the array and fills in each structure. The number of elements in the array is given in the *StreamCount* parameter.
     * @returns {HRESULT} If this method succeeds, it returns **S_OK**. Otherwise, it returns an **HRESULT** error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt
     */
    VideoProcessorBlt(pVideoProcessor, pView, OutputFrame, StreamCount, pStreams) {
        result := ComCall(53, this, "ptr", pVideoProcessor, "ptr", pView, "uint", OutputFrame, "uint", StreamCount, "ptr", pStreams, "HRESULT")
        return result
    }

    /**
     * Establishes the session key for a cryptographic session.
     * @param {ID3D11CryptoSession} pCryptoSession A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface of the cryptographic session.
     * @param {Integer} DataSize The size of the <i>pData</i> byte array, in bytes.
     * @param {Pointer} pData A pointer to a byte array that contains the encrypted session key.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-negotiatecryptosessionkeyexchange
     */
    NegotiateCryptoSessionKeyExchange(pCryptoSession, DataSize, pData) {
        result := ComCall(54, this, "ptr", pCryptoSession, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Reads encrypted data from a protected surface.
     * @param {ID3D11CryptoSession} pCryptoSession A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface of the cryptographic session.
     * @param {ID3D11Texture2D} pSrcSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a> interface of the protected surface.
     * @param {ID3D11Texture2D} pDstSurface A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a> interface of the surface that receives the encrypted data.
     * @param {Integer} IVSize The size of the <i>pIV</i> buffer, in bytes.
     * @param {Pointer} pIV A pointer to a buffer that receives the initialization vector (IV). The caller allocates this buffer, but the driver generates the IV. 
     * 
     * For 128-bit AES-CTR encryption, <i>pIV</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_aes_ctr_iv">D3D11_AES_CTR_IV</a> structure. When the driver generates the first IV, it initializes the structure to a random number. For each subsequent IV, the driver simply increments the <b>IV</b> member of the structure, ensuring that the value always increases. The application can validate that the same IV is never used more than once with the same key pair.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-encryptionblt
     */
    EncryptionBlt(pCryptoSession, pSrcSurface, pDstSurface, IVSize, pIV) {
        ComCall(55, this, "ptr", pCryptoSession, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", IVSize, "ptr", pIV)
    }

    /**
     * Writes encrypted data to a protected surface.
     * @param {ID3D11CryptoSession} pCryptoSession A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface.
     * @param {ID3D11Texture2D} pSrcSurface A pointer to the surface that contains the source data.
     * @param {ID3D11Texture2D} pDstSurface A pointer to the protected surface where the encrypted data is written.
     * @param {Pointer<D3D11_ENCRYPTED_BLOCK_INFO>} pEncryptedBlockInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_encrypted_block_info">D3D11_ENCRYPTED_BLOCK_INFO</a> structure, or <b>NULL</b>.
     * 
     * If the driver supports partially encrypted buffers,  <i>pEncryptedBlockInfo</i> indicates which portions of the buffer are encrypted.  If the entire surface is encrypted, set this parameter to <b>NULL</b>. 
     * 
     * To check whether the driver supports partially encrypted buffers, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getcontentprotectioncaps">ID3D11VideoDevice::GetContentProtectionCaps</a> and check for the <b>D3D11_CONTENT_PROTECTION_CAPS_PARTIAL_DECRYPTION 
     * </b> capabilities flag. If the driver does not support partially encrypted buffers, set this parameter to <b>NULL</b>.
     * @param {Integer} ContentKeySize The size of the encrypted content key, in bytes.
     * @param {Pointer} pContentKey A pointer to a buffer that contains a content encryption key, or <b>NULL</b>. To query whether the driver supports the use of content keys, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getcontentprotectioncaps">ID3D11VideoDevice::GetContentProtectionCaps</a> and check for the <b>D3D11_CONTENT_PROTECTION_CAPS_CONTENT_KEY</b> capabilities flag. 
     * 
     * If the driver supports content keys, use the content key to encrypt the surface. Encrypt the content key using the session key, and place the  resulting cipher text in <i>pContentKey</i>. If the driver does not support content keys, use the session key to encrypt the surface and set <i>pContentKey</i> to <b>NULL</b>.
     * @param {Integer} IVSize The size of the <i>pIV</i> buffer, in bytes.
     * @param {Pointer} pIV A pointer to a buffer that contains the initialization vector (IV). 
     * 
     * For 128-bit AES-CTR encryption, <i>pIV</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_aes_ctr_iv">D3D11_AES_CTR_IV</a> structure. The caller allocates the structure and generates the IV. When you generate the first IV, initialize the structure to a random number. For each subsequent IV, simply increment the <b>IV</b> member of the structure, ensuring that the value always increases.  This procedure enables the driver to validate that the same IV is never used more than once with the same key pair.
     * 
     * For other encryption types, a different structure might be used, or the encryption might not use an IV.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-decryptionblt
     */
    DecryptionBlt(pCryptoSession, pSrcSurface, pDstSurface, pEncryptedBlockInfo, ContentKeySize, pContentKey, IVSize, pIV) {
        ComCall(56, this, "ptr", pCryptoSession, "ptr", pSrcSurface, "ptr", pDstSurface, "ptr", pEncryptedBlockInfo, "uint", ContentKeySize, "ptr", pContentKey, "uint", IVSize, "ptr", pIV)
    }

    /**
     * Gets a random number that can be used to refresh the session key.
     * @param {ID3D11CryptoSession} pCryptoSession A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface.
     * @param {Integer} RandomNumberSize The size of the <i>pRandomNumber</i> array, in bytes. The size should match the size of the session key.
     * @param {Pointer} pRandomNumber A pointer to a byte array that receives a random number.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-startsessionkeyrefresh
     */
    StartSessionKeyRefresh(pCryptoSession, RandomNumberSize, pRandomNumber) {
        ComCall(57, this, "ptr", pCryptoSession, "uint", RandomNumberSize, "ptr", pRandomNumber)
    }

    /**
     * Switches to a new session key.
     * @param {ID3D11CryptoSession} pCryptoSession A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-finishsessionkeyrefresh
     */
    FinishSessionKeyRefresh(pCryptoSession) {
        ComCall(58, this, "ptr", pCryptoSession)
    }

    /**
     * Gets the cryptographic key to decrypt the data returned by the ID3D11VideoContext::EncryptionBlt method.
     * @param {ID3D11CryptoSession} pCryptoSession A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface.
     * @param {Integer} KeySize The size of the <i>pReadbackKey</i> array, in bytes. The size should match the size of the session key.
     * @param {Pointer} pReadbackKey A pointer to a byte array that receives the key. The key is encrypted using the session key.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-getencryptionbltkey
     */
    GetEncryptionBltKey(pCryptoSession, KeySize, pReadbackKey) {
        result := ComCall(59, this, "ptr", pCryptoSession, "uint", KeySize, "ptr", pReadbackKey, "HRESULT")
        return result
    }

    /**
     * Establishes a session key for an authenticated channel.
     * @param {ID3D11AuthenticatedChannel} pChannel A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11authenticatedchannel">ID3D11AuthenticatedChannel</a> interface.  This method will fail if the channel type is    <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_authenticated_channel_type">D3D11_AUTHENTICATED_CHANNEL_D3D11</a>, because the Direct3D11 channel does not support authentication.
     * @param {Integer} DataSize The size of the data in the <i>pData</i> array, in bytes.
     * @param {Pointer} pData A pointer to a byte array that contains the encrypted session key. The buffer must contain 256 bytes of data, encrypted using RSA Encryption Scheme - Optimal Asymmetric Encryption Padding (RSAES-OAEP).
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-negotiateauthenticatedchannelkeyexchange
     */
    NegotiateAuthenticatedChannelKeyExchange(pChannel, DataSize, pData) {
        result := ComCall(60, this, "ptr", pChannel, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Sends a query to an authenticated channel.
     * @param {ID3D11AuthenticatedChannel} pChannel A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11authenticatedchannel">ID3D11AuthenticatedChannel</a> interface.
     * @param {Integer} InputSize The size of the <i>pInput</i> array, in bytes.
     * @param {Pointer} pInput A pointer to a byte array that contains input data for the query. This array always starts with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_input">D3D11_AUTHENTICATED_QUERY_INPUT</a> structure. The <b>QueryType</b> member of the structure specifies the query and defines the meaning of the rest of the array.
     * @param {Integer} OutputSize The size of the <i>pOutput</i> array, in bytes.
     * @param {Pointer} pOutput A pointer to a byte array that receives the result of the query. This array always starts with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_query_output">D3D11_AUTHENTICATED_QUERY_OUTPUT</a> structure. The meaning of the rest of the array depends on the query.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-queryauthenticatedchannel
     */
    QueryAuthenticatedChannel(pChannel, InputSize, pInput, OutputSize, pOutput) {
        result := ComCall(61, this, "ptr", pChannel, "uint", InputSize, "ptr", pInput, "uint", OutputSize, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * Sends a configuration command to an authenticated channel.
     * @param {ID3D11AuthenticatedChannel} pChannel A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11authenticatedchannel">ID3D11AuthenticatedChannel</a> interface.
     * @param {Integer} InputSize The size of the <i>pInput</i> array, in bytes.
     * @param {Pointer} pInput A pointer to a byte array that contains input data for the command. This buffer always starts with a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input">D3D11_AUTHENTICATED_CONFIGURE_INPUT</a> structure. The <b>ConfigureType</b> member of the structure specifies the command and defines the meaning of the rest of the buffer.
     * @returns {D3D11_AUTHENTICATED_CONFIGURE_OUTPUT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_authenticated_configure_output">D3D11_AUTHENTICATED_CONFIGURE_OUTPUT</a> structure that receives the response to the command.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-configureauthenticatedchannel
     */
    ConfigureAuthenticatedChannel(pChannel, InputSize, pInput) {
        pOutput := D3D11_AUTHENTICATED_CONFIGURE_OUTPUT()
        result := ComCall(62, this, "ptr", pChannel, "uint", InputSize, "ptr", pInput, "ptr", pOutput, "HRESULT")
        return pOutput
    }

    /**
     * Sets the stream rotation for an input stream on the video processor.
     * @remarks
     * 
     * This is an optional state and the application should only use it if    <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_feature_caps">D3D11_VIDEO_PROCESSOR_FEATURE_CAPS_ROTATION</a> is reported in  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_caps">D3D11_VIDEO_PROCESSOR_CAPS.FeatureCaps</a>.
     * 
     * The stream source rectangle will be specified in the pre-rotation coordinates (typically landscape) and the stream destination rectangle will be specified in the post-rotation coordinates (typically portrait).   The application must update the stream destination rectangle correctly when using a rotation value other than 0° and 180°.
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {BOOL} Enable Specifies if the stream is to be rotated in a clockwise orientation.
     * @param {Integer} Rotation Specifies the rotation of the stream.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamrotation
     */
    VideoProcessorSetStreamRotation(pVideoProcessor, StreamIndex, Enable, Rotation) {
        ComCall(63, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", Rotation)
    }

    /**
     * Gets the stream rotation for an input stream on the video processor.
     * @param {ID3D11VideoProcessor} pVideoProcessor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface. To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
     * @param {Integer} StreamIndex The zero-based index of the input stream. To get the maximum number of streams, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videoprocessorenumerator-getvideoprocessorcaps">ID3D11VideoProcessorEnumerator::GetVideoProcessorCaps</a> and check the <b>MaxStreamStates</b> structure member.
     * @param {Pointer<BOOL>} pEnable Specifies if the stream is rotated.
     * @param {Pointer<Integer>} pRotation Specifies the rotation of the stream in a clockwise orientation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamrotation
     */
    VideoProcessorGetStreamRotation(pVideoProcessor, StreamIndex, pEnable, pRotation) {
        pEnableMarshal := pEnable is VarRef ? "int*" : "ptr"
        pRotationMarshal := pRotation is VarRef ? "int*" : "ptr"

        ComCall(64, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnableMarshal, pEnable, pRotationMarshal, pRotation)
    }
}
