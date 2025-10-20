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
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Integer} Type 
     * @param {Pointer<UInt32>} pBufferSize 
     * @param {Pointer<Void>} ppBuffer 
     * @returns {HRESULT} 
     */
    GetDecoderBuffer(pDecoder, Type, pBufferSize, ppBuffer) {
        result := ComCall(7, this, "ptr", pDecoder, "int", Type, "uint*", pBufferSize, "ptr", ppBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    ReleaseDecoderBuffer(pDecoder, Type) {
        result := ComCall(8, this, "ptr", pDecoder, "int", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Pointer<ID3D11VideoDecoderOutputView>} pView 
     * @param {Integer} ContentKeySize 
     * @param {Pointer} pContentKey 
     * @returns {HRESULT} 
     */
    DecoderBeginFrame(pDecoder, pView, ContentKeySize, pContentKey) {
        result := ComCall(9, this, "ptr", pDecoder, "ptr", pView, "uint", ContentKeySize, "ptr", pContentKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @returns {HRESULT} 
     */
    DecoderEndFrame(pDecoder) {
        result := ComCall(10, this, "ptr", pDecoder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Integer} NumBuffers 
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC>} pBufferDesc 
     * @returns {HRESULT} 
     */
    SubmitDecoderBuffers(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(11, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Pointer<D3D11_VIDEO_DECODER_EXTENSION>} pExtensionData 
     * @returns {Integer} 
     */
    DecoderExtension(pDecoder, pExtensionData) {
        result := ComCall(12, this, "ptr", pDecoder, "ptr", pExtensionData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {BOOL} Enable 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputTargetRect(pVideoProcessor, Enable, pRect) {
        ComCall(13, this, "ptr", pVideoProcessor, "int", Enable, "ptr", pRect)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {BOOL} YCbCr 
     * @param {Pointer<D3D11_VIDEO_COLOR>} pColor 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputBackgroundColor(pVideoProcessor, YCbCr, pColor) {
        ComCall(14, this, "ptr", pVideoProcessor, "int", YCbCr, "ptr", pColor)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputColorSpace(pVideoProcessor, pColorSpace) {
        ComCall(15, this, "ptr", pVideoProcessor, "ptr", pColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} AlphaFillMode 
     * @param {Integer} StreamIndex 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputAlphaFillMode(pVideoProcessor, AlphaFillMode, StreamIndex) {
        ComCall(16, this, "ptr", pVideoProcessor, "int", AlphaFillMode, "uint", StreamIndex)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {BOOL} Enable 
     * @param {SIZE} Size 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputConstriction(pVideoProcessor, Enable, Size) {
        ComCall(17, this, "ptr", pVideoProcessor, "int", Enable, "ptr", Size)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputStereoMode(pVideoProcessor, Enable) {
        ComCall(18, this, "ptr", pVideoProcessor, "int", Enable)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {Integer} 
     */
    VideoProcessorSetOutputExtension(pVideoProcessor, pExtensionGuid, DataSize, pData) {
        result := ComCall(19, this, "ptr", pVideoProcessor, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<BOOL>} Enabled 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputTargetRect(pVideoProcessor, Enabled, pRect) {
        ComCall(20, this, "ptr", pVideoProcessor, "ptr", Enabled, "ptr", pRect)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<BOOL>} pYCbCr 
     * @param {Pointer<D3D11_VIDEO_COLOR>} pColor 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputBackgroundColor(pVideoProcessor, pYCbCr, pColor) {
        ComCall(21, this, "ptr", pVideoProcessor, "ptr", pYCbCr, "ptr", pColor)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputColorSpace(pVideoProcessor, pColorSpace) {
        ComCall(22, this, "ptr", pVideoProcessor, "ptr", pColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<Int32>} pAlphaFillMode 
     * @param {Pointer<UInt32>} pStreamIndex 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputAlphaFillMode(pVideoProcessor, pAlphaFillMode, pStreamIndex) {
        ComCall(23, this, "ptr", pVideoProcessor, "int*", pAlphaFillMode, "uint*", pStreamIndex)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<SIZE>} pSize 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputConstriction(pVideoProcessor, pEnabled, pSize) {
        ComCall(24, this, "ptr", pVideoProcessor, "ptr", pEnabled, "ptr", pSize)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputStereoMode(pVideoProcessor, pEnabled) {
        ComCall(25, this, "ptr", pVideoProcessor, "ptr", pEnabled)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {Integer} 
     */
    VideoProcessorGetOutputExtension(pVideoProcessor, pExtensionGuid, DataSize, pData) {
        result := ComCall(26, this, "ptr", pVideoProcessor, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} FrameFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamFrameFormat(pVideoProcessor, StreamIndex, FrameFormat) {
        ComCall(27, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", FrameFormat)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamColorSpace(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(28, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} OutputRate 
     * @param {BOOL} RepeatFrame 
     * @param {Pointer<DXGI_RATIONAL>} pCustomRate 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamOutputRate(pVideoProcessor, StreamIndex, OutputRate, RepeatFrame, pCustomRate) {
        ComCall(29, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", OutputRate, "int", RepeatFrame, "ptr", pCustomRate)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamSourceRect(pVideoProcessor, StreamIndex, Enable, pRect) {
        ComCall(30, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pRect)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamDestRect(pVideoProcessor, StreamIndex, Enable, pRect) {
        ComCall(31, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pRect)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Float} Alpha 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamAlpha(pVideoProcessor, StreamIndex, Enable, Alpha) {
        ComCall(32, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "float", Alpha)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} pEntries 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamPalette(pVideoProcessor, StreamIndex, Count, pEntries) {
        ComCall(33, this, "ptr", pVideoProcessor, "uint", StreamIndex, "uint", Count, "uint*", pEntries)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Pointer<DXGI_RATIONAL>} pSourceAspectRatio 
     * @param {Pointer<DXGI_RATIONAL>} pDestinationAspectRatio 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamPixelAspectRatio(pVideoProcessor, StreamIndex, Enable, pSourceAspectRatio, pDestinationAspectRatio) {
        ComCall(34, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "ptr", pSourceAspectRatio, "ptr", pDestinationAspectRatio)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Float} Lower 
     * @param {Float} Upper 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamLumaKey(pVideoProcessor, StreamIndex, Enable, Lower, Upper) {
        ComCall(35, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "float", Lower, "float", Upper)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Integer} Format 
     * @param {BOOL} LeftViewFrame0 
     * @param {BOOL} BaseViewFrame0 
     * @param {Integer} FlipMode 
     * @param {Integer} MonoOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamStereoFormat(pVideoProcessor, StreamIndex, Enable, Format, LeftViewFrame0, BaseViewFrame0, FlipMode, MonoOffset) {
        ComCall(36, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", Format, "int", LeftViewFrame0, "int", BaseViewFrame0, "int", FlipMode, "int", MonoOffset)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamAutoProcessingMode(pVideoProcessor, StreamIndex, Enable) {
        ComCall(37, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Filter 
     * @param {BOOL} Enable 
     * @param {Integer} Level 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamFilter(pVideoProcessor, StreamIndex, Filter, Enable, Level) {
        ComCall(38, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Filter, "int", Enable, "int", Level)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer<Void>} pData 
     * @returns {Integer} 
     */
    VideoProcessorSetStreamExtension(pVideoProcessor, StreamIndex, pExtensionGuid, DataSize, pData) {
        result := ComCall(39, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Int32>} pFrameFormat 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamFrameFormat(pVideoProcessor, StreamIndex, pFrameFormat) {
        ComCall(40, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int*", pFrameFormat)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_COLOR_SPACE>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamColorSpace(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(41, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Int32>} pOutputRate 
     * @param {Pointer<BOOL>} pRepeatFrame 
     * @param {Pointer<DXGI_RATIONAL>} pCustomRate 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamOutputRate(pVideoProcessor, StreamIndex, pOutputRate, pRepeatFrame, pCustomRate) {
        ComCall(42, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int*", pOutputRate, "ptr", pRepeatFrame, "ptr", pCustomRate)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamSourceRect(pVideoProcessor, StreamIndex, pEnabled, pRect) {
        ComCall(43, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "ptr", pRect)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<RECT>} pRect 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamDestRect(pVideoProcessor, StreamIndex, pEnabled, pRect) {
        ComCall(44, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "ptr", pRect)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<Single>} pAlpha 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamAlpha(pVideoProcessor, StreamIndex, pEnabled, pAlpha) {
        ComCall(45, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "float*", pAlpha)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} pEntries 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamPalette(pVideoProcessor, StreamIndex, Count, pEntries) {
        ComCall(46, this, "ptr", pVideoProcessor, "uint", StreamIndex, "uint", Count, "uint*", pEntries)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<DXGI_RATIONAL>} pSourceAspectRatio 
     * @param {Pointer<DXGI_RATIONAL>} pDestinationAspectRatio 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamPixelAspectRatio(pVideoProcessor, StreamIndex, pEnabled, pSourceAspectRatio, pDestinationAspectRatio) {
        ComCall(47, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "ptr", pSourceAspectRatio, "ptr", pDestinationAspectRatio)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<Single>} pLower 
     * @param {Pointer<Single>} pUpper 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamLumaKey(pVideoProcessor, StreamIndex, pEnabled, pLower, pUpper) {
        ComCall(48, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled, "float*", pLower, "float*", pUpper)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnable 
     * @param {Pointer<Int32>} pFormat 
     * @param {Pointer<BOOL>} pLeftViewFrame0 
     * @param {Pointer<BOOL>} pBaseViewFrame0 
     * @param {Pointer<Int32>} pFlipMode 
     * @param {Pointer<Int32>} MonoOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamStereoFormat(pVideoProcessor, StreamIndex, pEnable, pFormat, pLeftViewFrame0, pBaseViewFrame0, pFlipMode, MonoOffset) {
        ComCall(49, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnable, "int*", pFormat, "ptr", pLeftViewFrame0, "ptr", pBaseViewFrame0, "int*", pFlipMode, "int*", MonoOffset)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnabled 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamAutoProcessingMode(pVideoProcessor, StreamIndex, pEnabled) {
        ComCall(50, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnabled)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} Filter 
     * @param {Pointer<BOOL>} pEnabled 
     * @param {Pointer<Int32>} pLevel 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamFilter(pVideoProcessor, StreamIndex, Filter, pEnabled, pLevel) {
        ComCall(51, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Filter, "ptr", pEnabled, "int*", pLevel)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Guid>} pExtensionGuid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {Integer} 
     */
    VideoProcessorGetStreamExtension(pVideoProcessor, StreamIndex, pExtensionGuid, DataSize, pData) {
        result := ComCall(52, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pExtensionGuid, "uint", DataSize, "ptr", pData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<ID3D11VideoProcessorOutputView>} pView 
     * @param {Integer} OutputFrame 
     * @param {Integer} StreamCount 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_STREAM>} pStreams 
     * @returns {HRESULT} 
     */
    VideoProcessorBlt(pVideoProcessor, pView, OutputFrame, StreamCount, pStreams) {
        result := ComCall(53, this, "ptr", pVideoProcessor, "ptr", pView, "uint", OutputFrame, "uint", StreamCount, "ptr", pStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    NegotiateCryptoSessionKeyExchange(pCryptoSession, DataSize, pData) {
        result := ComCall(54, this, "ptr", pCryptoSession, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Pointer<ID3D11Texture2D>} pSrcSurface 
     * @param {Pointer<ID3D11Texture2D>} pDstSurface 
     * @param {Integer} IVSize 
     * @param {Pointer} pIV 
     * @returns {String} Nothing - always returns an empty string
     */
    EncryptionBlt(pCryptoSession, pSrcSurface, pDstSurface, IVSize, pIV) {
        ComCall(55, this, "ptr", pCryptoSession, "ptr", pSrcSurface, "ptr", pDstSurface, "uint", IVSize, "ptr", pIV)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Pointer<ID3D11Texture2D>} pSrcSurface 
     * @param {Pointer<ID3D11Texture2D>} pDstSurface 
     * @param {Pointer<D3D11_ENCRYPTED_BLOCK_INFO>} pEncryptedBlockInfo 
     * @param {Integer} ContentKeySize 
     * @param {Pointer} pContentKey 
     * @param {Integer} IVSize 
     * @param {Pointer} pIV 
     * @returns {String} Nothing - always returns an empty string
     */
    DecryptionBlt(pCryptoSession, pSrcSurface, pDstSurface, pEncryptedBlockInfo, ContentKeySize, pContentKey, IVSize, pIV) {
        ComCall(56, this, "ptr", pCryptoSession, "ptr", pSrcSurface, "ptr", pDstSurface, "ptr", pEncryptedBlockInfo, "uint", ContentKeySize, "ptr", pContentKey, "uint", IVSize, "ptr", pIV)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Integer} RandomNumberSize 
     * @param {Pointer} pRandomNumber 
     * @returns {String} Nothing - always returns an empty string
     */
    StartSessionKeyRefresh(pCryptoSession, RandomNumberSize, pRandomNumber) {
        ComCall(57, this, "ptr", pCryptoSession, "uint", RandomNumberSize, "ptr", pRandomNumber)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @returns {String} Nothing - always returns an empty string
     */
    FinishSessionKeyRefresh(pCryptoSession) {
        ComCall(58, this, "ptr", pCryptoSession)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Integer} KeySize 
     * @param {Pointer} pReadbackKey 
     * @returns {HRESULT} 
     */
    GetEncryptionBltKey(pCryptoSession, KeySize, pReadbackKey) {
        result := ComCall(59, this, "ptr", pCryptoSession, "uint", KeySize, "ptr", pReadbackKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11AuthenticatedChannel>} pChannel 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    NegotiateAuthenticatedChannelKeyExchange(pChannel, DataSize, pData) {
        result := ComCall(60, this, "ptr", pChannel, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11AuthenticatedChannel>} pChannel 
     * @param {Integer} InputSize 
     * @param {Pointer} pInput 
     * @param {Integer} OutputSize 
     * @param {Pointer} pOutput 
     * @returns {HRESULT} 
     */
    QueryAuthenticatedChannel(pChannel, InputSize, pInput, OutputSize, pOutput) {
        result := ComCall(61, this, "ptr", pChannel, "uint", InputSize, "ptr", pInput, "uint", OutputSize, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11AuthenticatedChannel>} pChannel 
     * @param {Integer} InputSize 
     * @param {Pointer} pInput 
     * @param {Pointer<D3D11_AUTHENTICATED_CONFIGURE_OUTPUT>} pOutput 
     * @returns {HRESULT} 
     */
    ConfigureAuthenticatedChannel(pChannel, InputSize, pInput, pOutput) {
        result := ComCall(62, this, "ptr", pChannel, "uint", InputSize, "ptr", pInput, "ptr", pOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {Integer} Rotation 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamRotation(pVideoProcessor, StreamIndex, Enable, Rotation) {
        ComCall(63, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", Rotation)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnable 
     * @param {Pointer<Int32>} pRotation 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamRotation(pVideoProcessor, StreamIndex, pEnable, pRotation) {
        ComCall(64, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnable, "int*", pRotation)
        return result
    }
}
