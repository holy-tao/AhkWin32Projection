#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} Type 
     * @param {Pointer<Integer>} pBufferSize 
     * @param {Pointer<Pointer<Void>>} ppBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-getdecoderbuffer
     */
    GetDecoderBuffer(pDecoder, Type, pBufferSize, ppBuffer) {
        result := ComCall(7, this, "ptr", pDecoder, "int", Type, "uint*", pBufferSize, "ptr*", ppBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-releasedecoderbuffer
     */
    ReleaseDecoderBuffer(pDecoder, Type) {
        result := ComCall(8, this, "ptr", pDecoder, "int", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {ID3D11VideoDecoderOutputView} pView 
     * @param {Integer} ContentKeySize 
     * @param {Pointer} pContentKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-decoderbeginframe
     */
    DecoderBeginFrame(pDecoder, pView, ContentKeySize, pContentKey) {
        result := ComCall(9, this, "ptr", pDecoder, "ptr", pView, "uint", ContentKeySize, "ptr", pContentKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-decoderendframe
     */
    DecoderEndFrame(pDecoder) {
        result := ComCall(10, this, "ptr", pDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} NumBuffers 
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC>} pBufferDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-submitdecoderbuffers
     */
    SubmitDecoderBuffers(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(11, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Pointer<D3D11_VIDEO_DECODER_EXTENSION>} pExtensionData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-decoderextension
     */
    DecoderExtension(pDecoder, pExtensionData) {
        result := ComCall(12, this, "ptr", pDecoder, "ptr", pExtensionData, "int")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {BOOL} Enable 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputtargetrect
     */
    VideoProcessorSetOutputTargetRect(pVideoProcessor, Enable, pRect) {
        ComCall(13, this, "ptr", pVideoProcessor, "int", Enable, "ptr", pRect)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {BOOL} YCbCr 
     * @param {Pointer<D3D11_VIDEO_COLOR>} pColor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputbackgroundcolor
     */
    VideoProcessorSetOutputBackgroundColor(pVideoProcessor, YCbCr, pColor) {
        ComCall(14, this, "ptr", pVideoProcessor, "int", YCbCr, "ptr", pColor)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputcolorspace
     */
    VideoProcessorSetOutputColorSpace(pVideoProcessor, pColorSpace) {
        ComCall(15, this, "ptr", pVideoProcessor, "ptr", pColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} AlphaFillMode 
     * @param {Integer} StreamIndex 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputalphafillmode
     */
    VideoProcessorSetOutputAlphaFillMode(pVideoProcessor, AlphaFillMode, StreamIndex) {
        ComCall(16, this, "ptr", pVideoProcessor, "int", AlphaFillMode, "uint", StreamIndex)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {BOOL} Enable 
     * @param {SIZE} Size 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputconstriction
     */
    VideoProcessorSetOutputConstriction(pVideoProcessor, Enable, Size) {
        ComCall(17, this, "ptr", pVideoProcessor, "int", Enable, "ptr", Size)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputstereomode
     */
    VideoProcessorSetOutputStereoMode(pVideoProcessor, Enable) {
        ComCall(18, this, "ptr", pVideoProcessor, "int", Enable)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetoutputextension
     */
    VideoProcessorSetOutputExtension(pVideoProcessor, pExtensionGuid, DataSize, pData) {
        result := ComCall(19, this, "ptr", pVideoProcessor, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<BOOL>} Enabled 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputtargetrect
     */
    VideoProcessorGetOutputTargetRect(pVideoProcessor, Enabled, pRect) {
        ComCall(20, this, "ptr", pVideoProcessor, "ptr", Enabled, "ptr", pRect)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<BOOL>} pYCbCr 
     * @param {Pointer<D3D11_VIDEO_COLOR>} pColor 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputbackgroundcolor
     */
    VideoProcessorGetOutputBackgroundColor(pVideoProcessor, pYCbCr, pColor) {
        ComCall(21, this, "ptr", pVideoProcessor, "ptr", pYCbCr, "ptr", pColor)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputcolorspace
     */
    VideoProcessorGetOutputColorSpace(pVideoProcessor, pColorSpace) {
        ComCall(22, this, "ptr", pVideoProcessor, "ptr", pColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<Integer>} pAlphaFillMode 
     * @param {Pointer<Integer>} pStreamIndex 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputalphafillmode
     */
    VideoProcessorGetOutputAlphaFillMode(pVideoProcessor, pAlphaFillMode, pStreamIndex) {
        ComCall(23, this, "ptr", pVideoProcessor, "int*", pAlphaFillMode, "uint*", pStreamIndex)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<SIZE>} pSize 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputconstriction
     */
    VideoProcessorGetOutputConstriction(pVideoProcessor, pEnabled, pSize) {
        ComCall(24, this, "ptr", pVideoProcessor, "ptr", pEnabled, "ptr", pSize)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputstereomode
     */
    VideoProcessorGetOutputStereoMode(pVideoProcessor, pEnabled) {
        ComCall(25, this, "ptr", pVideoProcessor, "ptr", pEnabled)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetoutputextension
     */
    VideoProcessorGetOutputExtension(pVideoProcessor, pExtensionGuid, DataSize, pData) {
        result := ComCall(26, this, "ptr", pVideoProcessor, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} FrameFormat 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamframeformat
     */
    VideoProcessorSetStreamFrameFormat(pVideoProcessor, StreamIndex, FrameFormat) {
        ComCall(27, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", FrameFormat)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamcolorspace
     */
    VideoProcessorSetStreamColorSpace(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(28, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} OutputRate 
     * @param {BOOL} RepeatFrame 
     * @param {Pointer<DXGI_RATIONAL>} pCustomRate 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamoutputrate
     */
    VideoProcessorSetStreamOutputRate(pVideoProcessor, StreamIndex, OutputRate, RepeatFrame, pCustomRate) {
        ComCall(29, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", OutputRate, "int", RepeatFrame, "ptr", pCustomRate)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamsourcerect
     */
    VideoProcessorSetStreamSourceRect(pVideoProcessor, StreamIndex, Enable, pRect) {
        ComCall(30, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pRect)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamdestrect
     */
    VideoProcessorSetStreamDestRect(pVideoProcessor, StreamIndex, Enable, pRect) {
        ComCall(31, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pRect)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Float} Alpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamalpha
     */
    VideoProcessorSetStreamAlpha(pVideoProcessor, StreamIndex, Enable, Alpha) {
        ComCall(32, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "float", Alpha)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} pEntries 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreampalette
     */
    VideoProcessorSetStreamPalette(pVideoProcessor, StreamIndex, Count, pEntries) {
        ComCall(33, this, "ptr", pVideoProcessor, "uint", StreamIndex, "uint", Count, "uint*", pEntries)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Pointer<DXGI_RATIONAL>} pSourceAspectRatio 
     * @param {Pointer<DXGI_RATIONAL>} pDestinationAspectRatio 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreampixelaspectratio
     */
    VideoProcessorSetStreamPixelAspectRatio(pVideoProcessor, StreamIndex, Enable, pSourceAspectRatio, pDestinationAspectRatio) {
        ComCall(34, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pSourceAspectRatio, "ptr", pDestinationAspectRatio)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Float} Lower 
     * @param {Float} Upper 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamlumakey
     */
    VideoProcessorSetStreamLumaKey(pVideoProcessor, StreamIndex, Enable, Lower, Upper) {
        ComCall(35, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "float", Lower, "float", Upper)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Integer} Format 
     * @param {BOOL} LeftViewFrame0 
     * @param {BOOL} BaseViewFrame0 
     * @param {Integer} FlipMode 
     * @param {Integer} MonoOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamstereoformat
     */
    VideoProcessorSetStreamStereoFormat(pVideoProcessor, StreamIndex, Enable, Format, LeftViewFrame0, BaseViewFrame0, FlipMode, MonoOffset) {
        ComCall(36, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", Format, "int", LeftViewFrame0, "int", BaseViewFrame0, "int", FlipMode, "int", MonoOffset)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamautoprocessingmode
     */
    VideoProcessorSetStreamAutoProcessingMode(pVideoProcessor, StreamIndex, Enable) {
        ComCall(37, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Filter 
     * @param {BOOL} Enable 
     * @param {Integer} Level 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamfilter
     */
    VideoProcessorSetStreamFilter(pVideoProcessor, StreamIndex, Filter, Enable, Level) {
        ComCall(38, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Filter, "int", Enable, "int", Level)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamextension
     */
    VideoProcessorSetStreamExtension(pVideoProcessor, StreamIndex, pExtensionGuid, DataSize, pData) {
        result := ComCall(39, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Integer>} pFrameFormat 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamframeformat
     */
    VideoProcessorGetStreamFrameFormat(pVideoProcessor, StreamIndex, pFrameFormat) {
        ComCall(40, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int*", pFrameFormat)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamcolorspace
     */
    VideoProcessorGetStreamColorSpace(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(41, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Integer>} pOutputRate 
     * @param {Pointer<BOOL>} pRepeatFrame 
     * @param {Pointer<DXGI_RATIONAL>} pCustomRate 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamoutputrate
     */
    VideoProcessorGetStreamOutputRate(pVideoProcessor, StreamIndex, pOutputRate, pRepeatFrame, pCustomRate) {
        ComCall(42, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int*", pOutputRate, "ptr", pRepeatFrame, "ptr", pCustomRate)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamsourcerect
     */
    VideoProcessorGetStreamSourceRect(pVideoProcessor, StreamIndex, pEnabled, pRect) {
        ComCall(43, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "ptr", pRect)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamdestrect
     */
    VideoProcessorGetStreamDestRect(pVideoProcessor, StreamIndex, pEnabled, pRect) {
        ComCall(44, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "ptr", pRect)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<Float>} pAlpha 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamalpha
     */
    VideoProcessorGetStreamAlpha(pVideoProcessor, StreamIndex, pEnabled, pAlpha) {
        ComCall(45, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "float*", pAlpha)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} pEntries 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreampalette
     */
    VideoProcessorGetStreamPalette(pVideoProcessor, StreamIndex, Count, pEntries) {
        ComCall(46, this, "ptr", pVideoProcessor, "uint", StreamIndex, "uint", Count, "uint*", pEntries)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<DXGI_RATIONAL>} pSourceAspectRatio 
     * @param {Pointer<DXGI_RATIONAL>} pDestinationAspectRatio 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreampixelaspectratio
     */
    VideoProcessorGetStreamPixelAspectRatio(pVideoProcessor, StreamIndex, pEnabled, pSourceAspectRatio, pDestinationAspectRatio) {
        ComCall(47, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "ptr", pSourceAspectRatio, "ptr", pDestinationAspectRatio)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<Float>} pLower 
     * @param {Pointer<Float>} pUpper 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamlumakey
     */
    VideoProcessorGetStreamLumaKey(pVideoProcessor, StreamIndex, pEnabled, pLower, pUpper) {
        ComCall(48, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "float*", pLower, "float*", pUpper)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnable 
     * @param {Pointer<Integer>} pFormat 
     * @param {Pointer<BOOL>} pLeftViewFrame0 
     * @param {Pointer<BOOL>} pBaseViewFrame0 
     * @param {Pointer<Integer>} pFlipMode 
     * @param {Pointer<Integer>} MonoOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamstereoformat
     */
    VideoProcessorGetStreamStereoFormat(pVideoProcessor, StreamIndex, pEnable, pFormat, pLeftViewFrame0, pBaseViewFrame0, pFlipMode, MonoOffset) {
        ComCall(49, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnable, "int*", pFormat, "ptr", pLeftViewFrame0, "ptr", pBaseViewFrame0, "int*", pFlipMode, "int*", MonoOffset)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamautoprocessingmode
     */
    VideoProcessorGetStreamAutoProcessingMode(pVideoProcessor, StreamIndex, pEnabled) {
        ComCall(50, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Filter 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<Integer>} pLevel 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamfilter
     */
    VideoProcessorGetStreamFilter(pVideoProcessor, StreamIndex, Filter, pEnabled, pLevel) {
        ComCall(51, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Filter, "ptr", pEnabled, "int*", pLevel)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamextension
     */
    VideoProcessorGetStreamExtension(pVideoProcessor, StreamIndex, pExtensionGuid, DataSize, pData) {
        result := ComCall(52, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {ID3D11VideoProcessorOutputView} pView 
     * @param {Integer} OutputFrame 
     * @param {Integer} StreamCount 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_STREAM>} pStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorblt
     */
    VideoProcessorBlt(pVideoProcessor, pView, OutputFrame, StreamCount, pStreams) {
        result := ComCall(53, this, "ptr", pVideoProcessor, "ptr", pView, "uint", OutputFrame, "uint", StreamCount, "ptr", pStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-negotiatecryptosessionkeyexchange
     */
    NegotiateCryptoSessionKeyExchange(pCryptoSession, DataSize, pData) {
        result := ComCall(54, this, "ptr", pCryptoSession, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {ID3D11Texture2D} pSrcSurface 
     * @param {ID3D11Texture2D} pDstSurface 
     * @param {Integer} IVSize 
     * @param {Pointer} pIV 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-encryptionblt
     */
    EncryptionBlt(pCryptoSession, pSrcSurface, pDstSurface, IVSize, pIV) {
        ComCall(55, this, "ptr", pCryptoSession, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", IVSize, "ptr", pIV)
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {ID3D11Texture2D} pSrcSurface 
     * @param {ID3D11Texture2D} pDstSurface 
     * @param {Pointer<D3D11_ENCRYPTED_BLOCK_INFO>} pEncryptedBlockInfo 
     * @param {Integer} ContentKeySize 
     * @param {Pointer} pContentKey 
     * @param {Integer} IVSize 
     * @param {Pointer} pIV 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-decryptionblt
     */
    DecryptionBlt(pCryptoSession, pSrcSurface, pDstSurface, pEncryptedBlockInfo, ContentKeySize, pContentKey, IVSize, pIV) {
        ComCall(56, this, "ptr", pCryptoSession, "ptr", pSrcSurface, "ptr", pDstSurface, "ptr", pEncryptedBlockInfo, "uint", ContentKeySize, "ptr", pContentKey, "uint", IVSize, "ptr", pIV)
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {Integer} RandomNumberSize 
     * @param {Pointer} pRandomNumber 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-startsessionkeyrefresh
     */
    StartSessionKeyRefresh(pCryptoSession, RandomNumberSize, pRandomNumber) {
        ComCall(57, this, "ptr", pCryptoSession, "uint", RandomNumberSize, "ptr", pRandomNumber)
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-finishsessionkeyrefresh
     */
    FinishSessionKeyRefresh(pCryptoSession) {
        ComCall(58, this, "ptr", pCryptoSession)
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {Integer} KeySize 
     * @param {Pointer} pReadbackKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-getencryptionbltkey
     */
    GetEncryptionBltKey(pCryptoSession, KeySize, pReadbackKey) {
        result := ComCall(59, this, "ptr", pCryptoSession, "uint", KeySize, "ptr", pReadbackKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11AuthenticatedChannel} pChannel 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-negotiateauthenticatedchannelkeyexchange
     */
    NegotiateAuthenticatedChannelKeyExchange(pChannel, DataSize, pData) {
        result := ComCall(60, this, "ptr", pChannel, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11AuthenticatedChannel} pChannel 
     * @param {Integer} InputSize 
     * @param {Pointer} pInput 
     * @param {Integer} OutputSize 
     * @param {Pointer} pOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-queryauthenticatedchannel
     */
    QueryAuthenticatedChannel(pChannel, InputSize, pInput, OutputSize, pOutput) {
        result := ComCall(61, this, "ptr", pChannel, "uint", InputSize, "ptr", pInput, "uint", OutputSize, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11AuthenticatedChannel} pChannel 
     * @param {Integer} InputSize 
     * @param {Pointer} pInput 
     * @param {Pointer<D3D11_AUTHENTICATED_CONFIGURE_OUTPUT>} pOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-configureauthenticatedchannel
     */
    ConfigureAuthenticatedChannel(pChannel, InputSize, pInput, pOutput) {
        result := ComCall(62, this, "ptr", pChannel, "uint", InputSize, "ptr", pInput, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Integer} Rotation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorsetstreamrotation
     */
    VideoProcessorSetStreamRotation(pVideoProcessor, StreamIndex, Enable, Rotation) {
        ComCall(63, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", Rotation)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnable 
     * @param {Pointer<Integer>} pRotation 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videocontext-videoprocessorgetstreamrotation
     */
    VideoProcessorGetStreamRotation(pVideoProcessor, StreamIndex, pEnable, pRotation) {
        ComCall(64, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnable, "int*", pRotation)
    }
}
