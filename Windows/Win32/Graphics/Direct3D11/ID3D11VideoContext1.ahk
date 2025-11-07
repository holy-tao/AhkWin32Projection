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
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} NumBuffers 
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC1>} pBufferDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-submitdecoderbuffers1
     */
    SubmitDecoderBuffers1(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(65, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @param {Integer} PrivateInputSize 
     * @param {Pointer<Void>} pPrivatInputData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-getdatafornewhardwarekey
     */
    GetDataForNewHardwareKey(pCryptoSession, PrivateInputSize, pPrivatInputData) {
        pPrivatInputDataMarshal := pPrivatInputData is VarRef ? "ptr" : "ptr"

        result := ComCall(66, this, "ptr", pCryptoSession, "uint", PrivateInputSize, pPrivatInputDataMarshal, pPrivatInputData, "uint*", &pPrivateOutputData := 0, "HRESULT")
        return pPrivateOutputData
    }

    /**
     * 
     * @param {ID3D11CryptoSession} pCryptoSession 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-checkcryptosessionstatus
     */
    CheckCryptoSessionStatus(pCryptoSession) {
        result := ComCall(67, this, "ptr", pCryptoSession, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} InputColorSpace 
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc 
     * @param {Integer} ReferenceFrameCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-decoderenabledownsampling
     */
    DecoderEnableDownsampling(pDecoder, InputColorSpace, pOutputDesc, ReferenceFrameCount) {
        result := ComCall(68, this, "ptr", pDecoder, "int", InputColorSpace, "ptr", pOutputDesc, "uint", ReferenceFrameCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-decoderupdatedownsampling
     */
    DecoderUpdateDownsampling(pDecoder, pOutputDesc) {
        result := ComCall(69, this, "ptr", pDecoder, "ptr", pOutputDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} ColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetoutputcolorspace1
     */
    VideoProcessorSetOutputColorSpace1(pVideoProcessor, ColorSpace) {
        ComCall(70, this, "ptr", pVideoProcessor, "int", ColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {BOOL} ShaderUsage 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetoutputshaderusage
     */
    VideoProcessorSetOutputShaderUsage(pVideoProcessor, ShaderUsage) {
        ComCall(71, this, "ptr", pVideoProcessor, "int", ShaderUsage)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<Integer>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetoutputcolorspace1
     */
    VideoProcessorGetOutputColorSpace1(pVideoProcessor, pColorSpace) {
        pColorSpaceMarshal := pColorSpace is VarRef ? "int*" : "ptr"

        ComCall(72, this, "ptr", pVideoProcessor, pColorSpaceMarshal, pColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Pointer<BOOL>} pShaderUsage 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetoutputshaderusage
     */
    VideoProcessorGetOutputShaderUsage(pVideoProcessor, pShaderUsage) {
        pShaderUsageMarshal := pShaderUsage is VarRef ? "int*" : "ptr"

        ComCall(73, this, "ptr", pVideoProcessor, pShaderUsageMarshal, pShaderUsage)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} ColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetstreamcolorspace1
     */
    VideoProcessorSetStreamColorSpace1(pVideoProcessor, StreamIndex, ColorSpace) {
        ComCall(74, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", ColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {BOOL} FlipHorizontal 
     * @param {BOOL} FlipVertical 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorsetstreammirror
     */
    VideoProcessorSetStreamMirror(pVideoProcessor, StreamIndex, Enable, FlipHorizontal, FlipVertical) {
        ComCall(75, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", FlipHorizontal, "int", FlipVertical)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Integer>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetstreamcolorspace1
     */
    VideoProcessorGetStreamColorSpace1(pVideoProcessor, StreamIndex, pColorSpace) {
        pColorSpaceMarshal := pColorSpace is VarRef ? "int*" : "ptr"

        ComCall(76, this, "ptr", pVideoProcessor, "uint", StreamIndex, pColorSpaceMarshal, pColorSpace)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnable 
     * @param {Pointer<BOOL>} pFlipHorizontal 
     * @param {Pointer<BOOL>} pFlipVertical 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetstreammirror
     */
    VideoProcessorGetStreamMirror(pVideoProcessor, StreamIndex, pEnable, pFlipHorizontal, pFlipVertical) {
        pEnableMarshal := pEnable is VarRef ? "int*" : "ptr"
        pFlipHorizontalMarshal := pFlipHorizontal is VarRef ? "int*" : "ptr"
        pFlipVerticalMarshal := pFlipVertical is VarRef ? "int*" : "ptr"

        ComCall(77, this, "ptr", pVideoProcessor, "uint", StreamIndex, pEnableMarshal, pEnable, pFlipHorizontalMarshal, pFlipHorizontal, pFlipVerticalMarshal, pFlipVertical)
    }

    /**
     * 
     * @param {ID3D11VideoProcessor} pVideoProcessor 
     * @param {Integer} OutputWidth 
     * @param {Integer} OutputHeight 
     * @param {Integer} OutputFormat 
     * @param {Integer} StreamCount 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT>} pStreams 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-videoprocessorgetbehaviorhints
     */
    VideoProcessorGetBehaviorHints(pVideoProcessor, OutputWidth, OutputHeight, OutputFormat, StreamCount, pStreams) {
        result := ComCall(78, this, "ptr", pVideoProcessor, "uint", OutputWidth, "uint", OutputHeight, "int", OutputFormat, "uint", StreamCount, "ptr", pStreams, "uint*", &pBehaviorHints := 0, "HRESULT")
        return pBehaviorHints
    }
}
