#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11VideoContext2.ahk

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device. (ID3D11VideoContext3)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_4/nn-d3d11_4-id3d11videocontext3
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11VideoContext3 extends ID3D11VideoContext2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11VideoContext3
     * @type {Guid}
     */
    static IID => Guid("{a9e2faa0-cb39-418f-a0b7-d8aad4de672e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 83

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecoderBeginFrame1", "SubmitDecoderBuffers2"]

    /**
     * Starts a decoding operation to decode a video frame. (ID3D11VideoContext3::DecoderBeginFrame1)
     * @remarks
     * The following [D3D11_RESOURCE_MISC](../d3d11/ne-d3d11-d3d11_resource_misc_flag.md) flags are allowed when allocating resources for video decode histograms.
     * 
     * - D3D11_RESOURCE_MISC_SHARED
     * - D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS
     * - D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS
     * - D3D11_RESOURCE_MISC_BUFFER_STRUCTURED
     * - D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX
     * - D3D11_RESOURCE_MISC_SHARED_NTHANDLE
     * - D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE
     * - D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER
     * 
     * All other D3D11_RESOURCE_MISC flags are disallowed.
     * @param {ID3D11VideoDecoder} pDecoder A pointer to the [ID3D11VideoDecoder](../d3d11/nn-d3d11-id3d11videodecoder.md) interface. To get this pointer, call [ID3D11VideoDevice::CreateVideoDecoder](../d3d11/nf-d3d11-id3d11videodevice-createvideodecoder.md)
     * @param {ID3D11VideoDecoderOutputView} pView A pointer to a [ID3D11VideoDecoderOutputView](../d3d11/nn-d3d11-id3d11videodecoderoutputview.md) interface. This interface describes the resource that will receive the decoded frame. To get this pointer, call [ID3D11VideoDevice::CreateVideoDecoderOutputView](../d3d11/nf-d3d11-id3d11videodevice-createvideodecoderoutputview.md
     * ).
     * @param {Integer} ContentKeySize The size of the content key that is specified in *pContentKey*. If *pContentKey* is NULL, set *ContentKeySize* to zero.
     * @param {Pointer} pContentKey An optional pointer to a content key that was used to encrypt the frame data. If no content key was used, set this parameter to NULL. If the caller provides a content key, the caller must use the session key to encrypt the content key.
     * @param {Integer} NumComponentHistograms The number of components to record a histograms for.  Use [D3D11_FEATURE_VIDEO_DECODE_HISTOGRAM](ne-d3d11_4-d3d11_feature_video.md) to check for support.  Use zero when not recording histograms or when the feature is not supported.  Specifying fewer components than are in the format implies that those components do not have histogram recording enabled. The maximum number of components is defined as **D3D11_4_VIDEO_DECODER_MAX_HISTOGRAM_COMPONENTS**.
     * @param {Pointer<Integer>} pHistogramOffsets An array of starting buffer offset locations within the *ppHistogramBuffers* parallel array.  Use [D3D11_VIDEO_DECODE_HISTOGRAM_COMPONENT](ne-d3d11_4-d3d11_video_decoder_histogram_component.md) to index the array.  If a component is not requested, specify an offset of zero.   The offsets must be 256-byte aligned.
     * @param {Pointer<ID3D11Buffer>} ppHistogramBuffers An array of target buffers for hardware to write the components histogram.  Use [D3D11_VIDEO_DECODE_HISTOGRAM_COMPONENT](ne-d3d11_4-d3d11_video_decoder_histogram_component.md) to index the array.  Set this parameter to **nullptr** when the component histogram is disabled or unsupported
     * @returns {HRESULT} Returns **S\_OK** if successful.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d11_4/nf-d3d11_4-id3d11videocontext3-decoderbeginframe1
     */
    DecoderBeginFrame1(pDecoder, pView, ContentKeySize, pContentKey, NumComponentHistograms, pHistogramOffsets, ppHistogramBuffers) {
        pHistogramOffsetsMarshal := pHistogramOffsets is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "ptr", pDecoder, "ptr", pView, "uint", ContentKeySize, "ptr", pContentKey, "uint", NumComponentHistograms, pHistogramOffsetsMarshal, pHistogramOffsets, "ptr*", ppHistogramBuffers, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ID3D11VideoDecoder} pDecoder 
     * @param {Integer} NumBuffers 
     * @param {Pointer<D3D11_VIDEO_DECODER_BUFFER_DESC2>} pBufferDesc 
     * @returns {HRESULT} 
     */
    SubmitDecoderBuffers2(pDecoder, NumBuffers, pBufferDesc) {
        result := ComCall(84, this, "ptr", pDecoder, "uint", NumBuffers, "ptr", pBufferDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
