#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoContext.ahk

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device.
 * @remarks
 * 
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> with an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1">ID3D11DeviceContext1</a>  interface pointer.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nn-d3d11_1-id3d11videocontext1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoContext1 extends ID3D11VideoContext{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoContext1
     * @type {Guid}
     */
    static IID => Guid("{a7f026da-a5f8-4487-a564-15e34357651e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 65

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SubmitDecoderBuffers1", "GetDataForNewHardwareKey", "CheckCryptoSessionStatus", "DecoderEnableDownsampling", "DecoderUpdateDownsampling", "VideoProcessorSetOutputColorSpace1", "VideoProcessorSetOutputShaderUsage", "VideoProcessorGetOutputColorSpace1", "VideoProcessorGetOutputShaderUsage", "VideoProcessorSetStreamColorSpace1", "VideoProcessorSetStreamMirror", "VideoProcessorGetStreamColorSpace1", "VideoProcessorGetStreamMirror", "VideoProcessorGetBehaviorHints"]

    /**
     * Submits one or more buffers for decoding.
     * @param {ID3D11VideoDecoder} pDecoder Type: <b>ID3D11VideoDecoder*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface. To get this pointer, call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideodecoder">ID3D11VideoDevice::CreateVideoDecoder</a> method.
     * @param {Integer} NumBuffers Type: <b>UINT</b>
     * 
     * The number of buffers submitted for decoding.
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC1>} pBufferDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_buffer_desc1">D3D11_VIDEO_DECODER_BUFFER_DESC1</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_buffer_desc1">D3D11_VIDEO_DECODER_BUFFER_DESC1</a> structures. The <i>NumBuffers</i> parameter specifies the number of elements in the array. Each element in the array describes a compressed buffer for decoding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise, it returns an HRESULT error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-submitdecoderbuffers1
     */
    SubmitDecoderBuffers1(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(65, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "HRESULT")
        return result
    }

    /**
     * Allows the driver to return IHV specific information used when initializing the new hardware key.
     * @param {ID3D11CryptoSession} pCryptoSession Type: <b>ID3D11CryptoSession*</b>
     * 
     * A pointer to the ID3D11CryptoSession interface.  To get this pointer, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9video-createcryptosession">ID3D11VideoDevice1::CreateCryptoSession</a>.
     * @param {Integer} PrivateInputSize Type: <b>UINT</b>
     * 
     * The size of the memory referenced by the <i>pPrivateInputData</i> parameter.
     * @param {Pointer<Void>} pPrivatInputData Type: <b>const void*</b>
     * 
     * The private input data. The contents of this parameter is defined by the implementation of the secure execution environment. It may contain data about the license or about the stream properties.
     * @returns {Integer} Type: <b>UINT64*</b>
     * 
     * A pointer to the private output data. The return data is defined by the implementation of the secure execution environment. It may contain graphics-specific data to be associated with the underlying hardware key.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-getdatafornewhardwarekey
     */
    GetDataForNewHardwareKey(pCryptoSession, PrivateInputSize, pPrivatInputData) {
        pPrivatInputDataMarshal := pPrivatInputData is VarRef ? "ptr" : "ptr"

        result := ComCall(66, this, "ptr", pCryptoSession, "uint", PrivateInputSize, pPrivatInputDataMarshal, pPrivatInputData, "uint*", &pPrivateOutputData := 0, "HRESULT")
        return pPrivateOutputData
    }

    /**
     * Checks the status of a crypto session.
     * @param {ID3D11CryptoSession} pCryptoSession Type: <b>ID3D11CryptoSession*</b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> for which status is checked.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_crypto_session_status">D3D11_CRYPTO_SESSION_STATUS</a>*</b>
     * 
     * A D3D11_CRYPTO_SESSION_STATUS that is populated with the crypto session status upon completion.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-checkcryptosessionstatus
     */
    CheckCryptoSessionStatus(pCryptoSession) {
        result := ComCall(67, this, "ptr", pCryptoSession, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Indicates that decoder downsampling will be used and that the driver should allocate the appropriate reference frames.
     * @param {ID3D11VideoDecoder} pDecoder Type: <b>ID3D11VideoDecoder*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface.
     * @param {Integer} InputColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * The color space information of the reference frame data.
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc">D3D11_VIDEO_SAMPLE_DESC</a>*</b>
     * 
     * The resolution, format, and colorspace of the output/display frames.  This is the destination resolution and format of the downsample operation.
     * @param {Integer} ReferenceFrameCount Type: <b>UINT</b>
     * 
     * The number of reference frames to be used in the operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <td>S_OK</td>
     * <td>The operation completed successfully.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed or this function was called using an invalid calling pattern.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>There is insufficient memory to complete the operation.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-decoderenabledownsampling
     */
    DecoderEnableDownsampling(pDecoder, InputColorSpace, pOutputDesc, ReferenceFrameCount) {
        result := ComCall(68, this, "ptr", pDecoder, "int", InputColorSpace, "ptr", pOutputDesc, "uint", ReferenceFrameCount, "HRESULT")
        return result
    }

    /**
     * Updates the decoder downsampling parameters.
     * @param {ID3D11VideoDecoder} pDecoder Type: <b>ID3D11VideoDecoder*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videodecoder">ID3D11VideoDecoder</a> interface.
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc">D3D11_VIDEO_SAMPLE_DESC</a>*</b>
     * 
     * The resolution, format, and colorspace of the output/display frames.  This is the destination resolution and format of the downsample operation.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the following error codes.
     * 
     * <table>
     * <tr>
     * <td>S_OK</td>
     * <td>The operation completed successfully.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed or this function was called using an invalid calling pattern.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>There is insufficient memory to complete the operation.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-decoderupdatedownsampling
     */
    DecoderUpdateDownsampling(pDecoder, pOutputDesc) {
        result := ComCall(69, this, "ptr", pDecoder, "ptr", pOutputDesc, "HRESULT")
        return result
    }

    /**
     * Sets the color space information for the video processor output surface.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} ColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a> value that specifies the colorspace for the video processor output surface.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetoutputcolorspace1
     */
    VideoProcessorSetOutputColorSpace1(pVideoProcessor, ColorSpace) {
        ComCall(70, this, "ptr", pVideoProcessor, "int", ColorSpace)
    }

    /**
     * Sets a value indicating whether the output surface from a call to ID3D11VideoContext::VideoProcessorBlt will be read by Direct3D shaders.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {BOOL} ShaderUsage Type: <b>BOOL</b>
     * 
     * True if the surface rendered using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">ID3D11VideoContext::VideoProcessorBlt</a> will be read by Direct3D shaders; otherwise, false. This may be set to false when multi-plane overlay hardware is supported.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetoutputshaderusage
     */
    VideoProcessorSetOutputShaderUsage(pVideoProcessor, ShaderUsage) {
        ComCall(71, this, "ptr", pVideoProcessor, "int", ShaderUsage)
    }

    /**
     * Gets the color space information for the video processor output surface.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Pointer<Integer>} pColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a> value that indicates the colorspace for the video processor output surface.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetoutputcolorspace1
     */
    VideoProcessorGetOutputColorSpace1(pVideoProcessor, pColorSpace) {
        pColorSpaceMarshal := pColorSpace is VarRef ? "int*" : "ptr"

        ComCall(72, this, "ptr", pVideoProcessor, pColorSpaceMarshal, pColorSpace)
    }

    /**
     * Gets a value indicating whether the output surface from a call to ID3D11VideoContext::VideoProcessorBlt can be read by Direct3D shaders.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Pointer<BOOL>} pShaderUsage Type: <b>BOOL*</b>
     * 
     * A pointer to a boolean value indicating if the output surface can be read by Direct3D shaders. True if the surface rendered using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">ID3D11VideoContext::VideoProcessorBlt</a> can be read by Direct3D shaders; otherwise, false.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetoutputshaderusage
     */
    VideoProcessorGetOutputShaderUsage(pVideoProcessor, pShaderUsage) {
        pShaderUsageMarshal := pShaderUsage is VarRef ? "int*" : "ptr"

        ComCall(73, this, "ptr", pVideoProcessor, pShaderUsageMarshal, pShaderUsage)
    }

    /**
     * Sets the color space information for the video processor input stream.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Type: <b>UINT</b>
     * 
     * An index identifying the input stream.
     * @param {Integer} ColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE</b>
     * 
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a> value that specifies the colorspace for the video processor input stream.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetstreamcolorspace1
     */
    VideoProcessorSetStreamColorSpace1(pVideoProcessor, StreamIndex, ColorSpace) {
        ComCall(74, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", ColorSpace)
    }

    /**
     * Specifies whether the video processor input stream should be flipped vertically or horizontally.
     * @remarks
     * 
     * When used in combination, transformations on the processor input stream should be applied in the following order:
     * 
     * <ul>
     * <li>Rotation</li>
     * <li>Mirroring</li>
     * <li>Source clipping</li>
     * </ul>
     * 
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Type: <b>UINT</b>
     * 
     * An index identifying the input stream.
     * @param {BOOL} Enable Type: <b>BOOL</b>
     * 
     * True if mirroring should be enabled; otherwise, false.
     * @param {BOOL} FlipHorizontal Type: <b>BOOL</b>
     * 
     * True if the stream should be flipped horizontally; otherwise, false.
     * @param {BOOL} FlipVertical Type: <b>BOOL</b>
     * 
     * True if the stream should be flipped vertically; otherwise, false.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetstreammirror
     */
    VideoProcessorSetStreamMirror(pVideoProcessor, StreamIndex, Enable, FlipHorizontal, FlipVertical) {
        ComCall(75, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", FlipHorizontal, "int", FlipVertical)
    }

    /**
     * Gets the color space information for the video processor input stream.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Type: <b>UINT</b>
     * 
     * An index identifying the input stream.
     * @param {Pointer<Integer>} pColorSpace Type: <b>DXGI_COLOR_SPACE_TYPE*</b>
     * 
     * A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type">DXGI_COLOR_SPACE_TYPE</a> value that specifies the colorspace for the video processor input stream.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetstreamcolorspace1
     */
    VideoProcessorGetStreamColorSpace1(pVideoProcessor, StreamIndex, pColorSpace) {
        pColorSpaceMarshal := pColorSpace is VarRef ? "int*" : "ptr"

        ComCall(76, this, "ptr", pVideoProcessor, "uint", StreamIndex, pColorSpaceMarshal, pColorSpace)
    }

    /**
     * Gets values that indicate whether the video processor input stream is being flipped vertically or horizontally.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} StreamIndex Type: <b>UINT</b>
     * 
     * An index identifying the input stream.
     * @param {Pointer<BOOL>} pEnable Type: <b>BOOL*</b>
     * 
     * A pointer to a boolean value indicating whether mirroring is enabled. True if mirroring is enabled; otherwise, false.
     * @param {Pointer<BOOL>} pFlipHorizontal Type: <b>BOOL*</b>
     * 
     * A pointer to a boolean value indicating whether the stream is being flipped horizontally. True if the stream is being flipped horizontally; otherwise, false.
     * @param {Pointer<BOOL>} pFlipVertical Type: <b>BOOL*</b>
     * 
     * A pointer to a boolean value indicating whether the stream is being flipped vertically. True if the stream is being flipped vertically; otherwise, false.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetstreammirror
     */
    VideoProcessorGetStreamMirror(pVideoProcessor, StreamIndex, pEnable, pFlipHorizontal, pFlipVertical) {
        pEnableMarshal := pEnable is VarRef ? "int*" : "ptr"
        pFlipHorizontalMarshal := pFlipHorizontal is VarRef ? "int*" : "ptr"
        pFlipVerticalMarshal := pFlipVertical is VarRef ? "int*" : "ptr"

        ComCall(77, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnableMarshal, pEnable, pFlipHorizontalMarshal, pFlipHorizontal, pFlipVerticalMarshal, pFlipVertical)
    }

    /**
     * Returns driver hints that indicate which of the video processor operations are best performed using multi-plane overlay hardware rather than ID3D11VideoContext::VideoProcessorBlt method.
     * @param {ID3D11VideoProcessor} pVideoProcessor Type: <b>ID3D11VideoProcessor*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11videoprocessor">ID3D11VideoProcessor</a> interface.
     * @param {Integer} OutputWidth Type: <b>UINT</b>
     * 
     * The width of the output stream.
     * @param {Integer} OutputHeight Type: <b>UINT</b>
     * 
     * The height of the output stream.
     * @param {Integer} OutputFormat Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The format of the output stream.
     * @param {Integer} StreamCount Type: <b>UINT</b>
     * 
     * The number of input streams to process.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT>} pStreams Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_video_processor_stream_behavior_hint">D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT</a>*</b>
     * 
     * An array of structures that specifies the format of each input stream and whether each stream should be used when computing behavior hints.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer to a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ne-d3d11_1-d3d11_video_processor_behavior_hints">D3D11_VIDEO_PROCESSOR_BEHAVIOR_HINTS</a> values indicating which video processor operations would best be performed using multi-plane overlay hardware rather than the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt">ID3D11VideoContext::VideoProcessorBlt</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetbehaviorhints
     */
    VideoProcessorGetBehaviorHints(pVideoProcessor, OutputWidth, OutputHeight, OutputFormat, StreamCount, pStreams) {
        result := ComCall(78, this, "ptr", pVideoProcessor, "uint", OutputWidth, "uint", OutputHeight, "int", OutputFormat, "uint", StreamCount, "ptr", pStreams, "uint*", &pBehaviorHints := 0, "HRESULT")
        return pBehaviorHints
    }
}
