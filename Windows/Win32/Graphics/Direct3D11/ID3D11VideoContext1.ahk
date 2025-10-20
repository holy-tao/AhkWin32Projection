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
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Integer} NumBuffers 
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC1>} pBufferDesc 
     * @returns {HRESULT} 
     */
    SubmitDecoderBuffers1(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(65, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Integer} PrivateInputSize 
     * @param {Pointer<Void>} pPrivatInputData 
     * @param {Pointer<UInt64>} pPrivateOutputData 
     * @returns {HRESULT} 
     */
    GetDataForNewHardwareKey(pCryptoSession, PrivateInputSize, pPrivatInputData, pPrivateOutputData) {
        result := ComCall(66, this, "ptr", pCryptoSession, "uint", PrivateInputSize, "ptr", pPrivatInputData, "uint*", pPrivateOutputData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11CryptoSession>} pCryptoSession 
     * @param {Pointer<Int32>} pStatus 
     * @returns {HRESULT} 
     */
    CheckCryptoSessionStatus(pCryptoSession, pStatus) {
        result := ComCall(67, this, "ptr", pCryptoSession, "int*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Integer} InputColorSpace 
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc 
     * @param {Integer} ReferenceFrameCount 
     * @returns {HRESULT} 
     */
    DecoderEnableDownsampling(pDecoder, InputColorSpace, pOutputDesc, ReferenceFrameCount) {
        result := ComCall(68, this, "ptr", pDecoder, "int", InputColorSpace, "ptr", pOutputDesc, "uint", ReferenceFrameCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoDecoder>} pDecoder 
     * @param {Pointer<D3D11_VIDEO_SAMPLE_DESC>} pOutputDesc 
     * @returns {HRESULT} 
     */
    DecoderUpdateDownsampling(pDecoder, pOutputDesc) {
        result := ComCall(69, this, "ptr", pDecoder, "ptr", pOutputDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} ColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputColorSpace1(pVideoProcessor, ColorSpace) {
        ComCall(70, this, "ptr", pVideoProcessor, "int", ColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {BOOL} ShaderUsage 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetOutputShaderUsage(pVideoProcessor, ShaderUsage) {
        ComCall(71, this, "ptr", pVideoProcessor, "int", ShaderUsage)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<Int32>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputColorSpace1(pVideoProcessor, pColorSpace) {
        ComCall(72, this, "ptr", pVideoProcessor, "int*", pColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Pointer<BOOL>} pShaderUsage 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetOutputShaderUsage(pVideoProcessor, pShaderUsage) {
        ComCall(73, this, "ptr", pVideoProcessor, "ptr", pShaderUsage)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Integer} ColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamColorSpace1(pVideoProcessor, StreamIndex, ColorSpace) {
        ComCall(74, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", ColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {BOOL} Enable 
     * @param {BOOL} FlipHorizontal 
     * @param {BOOL} FlipVertical 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorSetStreamMirror(pVideoProcessor, StreamIndex, Enable, FlipHorizontal, FlipVertical) {
        ComCall(75, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int", Enable, "int", FlipHorizontal, "int", FlipVertical)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<Int32>} pColorSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamColorSpace1(pVideoProcessor, StreamIndex, pColorSpace) {
        ComCall(76, this, "ptr", pVideoProcessor, "uint", StreamIndex, "int*", pColorSpace)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} StreamIndex 
     * @param {Pointer<BOOL>} pEnable 
     * @param {Pointer<BOOL>} pFlipHorizontal 
     * @param {Pointer<BOOL>} pFlipVertical 
     * @returns {String} Nothing - always returns an empty string
     */
    VideoProcessorGetStreamMirror(pVideoProcessor, StreamIndex, pEnable, pFlipHorizontal, pFlipVertical) {
        ComCall(77, this, "ptr", pVideoProcessor, "uint", StreamIndex, "ptr", pEnable, "ptr", pFlipHorizontal, "ptr", pFlipVertical)
        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11VideoProcessor>} pVideoProcessor 
     * @param {Integer} OutputWidth 
     * @param {Integer} OutputHeight 
     * @param {Integer} OutputFormat 
     * @param {Integer} StreamCount 
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT>} pStreams 
     * @param {Pointer<UInt32>} pBehaviorHints 
     * @returns {HRESULT} 
     */
    VideoProcessorGetBehaviorHints(pVideoProcessor, OutputWidth, OutputHeight, OutputFormat, StreamCount, pStreams, pBehaviorHints) {
        result := ComCall(78, this, "ptr", pVideoProcessor, "uint", OutputWidth, "uint", OutputHeight, "int", OutputFormat, "uint", StreamCount, "ptr", pStreams, "uint*", pBehaviorHints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
