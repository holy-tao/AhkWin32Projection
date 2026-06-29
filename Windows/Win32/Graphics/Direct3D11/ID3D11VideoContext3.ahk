#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11VideoContext2.ahk" { ID3D11VideoContext2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D11VideoDecoderOutputView.ahk" { ID3D11VideoDecoderOutputView }
#Import ".\ID3D11Buffer.ahk" { ID3D11Buffer }
#Import ".\ID3D11VideoDecoder.ahk" { ID3D11VideoDecoder }
#Import ".\D3D11_VIDEO_DECODER_BUFFER_DESC2.ahk" { D3D11_VIDEO_DECODER_BUFFER_DESC2 }

/**
 * Provides the video functionality of a Microsoft Direct3D 11 device. (ID3D11VideoContext3)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11videocontext3
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoContext3 extends ID3D11VideoContext2 {
    /**
     * The interface identifier for ID3D11VideoContext3
     * @type {Guid}
     */
    static IID := Guid("{a9e2faa0-cb39-418f-a0b7-d8aad4de672e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoContext3 interfaces
    */
    struct Vtbl extends ID3D11VideoContext2.Vtbl {
        DecoderBeginFrame1    : IntPtr
        SubmitDecoderBuffers2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoContext3.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {Integer} pContentKey An optional pointer to a content key that was used to encrypt the frame data. If no content key was used, set this parameter to NULL. If the caller provides a content key, the caller must use the session key to encrypt the content key.
     * @param {Integer} NumComponentHistograms The number of components to record a histograms for.  Use [D3D11_FEATURE_VIDEO_DECODE_HISTOGRAM](ne-d3d11_4-d3d11_feature_video.md) to check for support.  Use zero when not recording histograms or when the feature is not supported.  Specifying fewer components than are in the format implies that those components do not have histogram recording enabled. The maximum number of components is defined as **D3D11_4_VIDEO_DECODER_MAX_HISTOGRAM_COMPONENTS**.
     * @param {Pointer<Integer>} pHistogramOffsets An array of starting buffer offset locations within the *ppHistogramBuffers* parallel array.  Use [D3D11_VIDEO_DECODE_HISTOGRAM_COMPONENT](ne-d3d11_4-d3d11_video_decoder_histogram_component.md) to index the array.  If a component is not requested, specify an offset of zero.   The offsets must be 256-byte aligned.
     * @param {Pointer<ID3D11Buffer>} ppHistogramBuffers An array of target buffers for hardware to write the components histogram.  Use [D3D11_VIDEO_DECODE_HISTOGRAM_COMPONENT](ne-d3d11_4-d3d11_video_decoder_histogram_component.md) to index the array.  Set this parameter to **nullptr** when the component histogram is disabled or unsupported
     * @returns {HRESULT} Returns **S\_OK** if successful.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11_4/nf-d3d11_4-id3d11videocontext3-decoderbeginframe1
     */
    DecoderBeginFrame1(pDecoder, pView, ContentKeySize, pContentKey, NumComponentHistograms, pHistogramOffsets, ppHistogramBuffers) {
        pHistogramOffsetsMarshal := pHistogramOffsets is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "ptr", pDecoder, "ptr", pView, "uint", ContentKeySize, "ptr", pContentKey, "uint", NumComponentHistograms, pHistogramOffsetsMarshal, pHistogramOffsets, ID3D11Buffer.Ptr, ppHistogramBuffers, "HRESULT")
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
        result := ComCall(84, this, "ptr", pDecoder, "uint", NumBuffers, D3D11_VIDEO_DECODER_BUFFER_DESC2.Ptr, pBufferDesc, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D11VideoContext3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DecoderBeginFrame1 := CallbackCreate(GetMethod(implObj, "DecoderBeginFrame1"), flags, 8)
        this.vtbl.SubmitDecoderBuffers2 := CallbackCreate(GetMethod(implObj, "SubmitDecoderBuffers2"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DecoderBeginFrame1)
        CallbackFree(this.vtbl.SubmitDecoderBuffers2)
    }
}
