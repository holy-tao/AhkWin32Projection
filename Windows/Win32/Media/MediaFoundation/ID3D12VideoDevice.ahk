#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_FEATURE_VIDEO.ahk" { D3D12_FEATURE_VIDEO }
#Import ".\D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC }
#Import ".\D3D12_VIDEO_DECODER_DESC.ahk" { D3D12_VIDEO_DECODER_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_VIDEO_DECODER_HEAP_DESC.ahk" { D3D12_VIDEO_DECODER_HEAP_DESC }
#Import ".\D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.ahk" { D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides video decoding and processing capabilities of a Microsoft Direct3D 12 device including the ability to query video capabilities and instantiating video decoders and processors.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodevice
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDevice extends IUnknown {
    /**
     * The interface identifier for ID3D12VideoDevice
     * @type {Guid}
     */
    static IID := Guid("{1f052807-0b46-4acc-8a89-364f793718a4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CheckFeatureSupport    : IntPtr
        CreateVideoDecoder     : IntPtr
        CreateVideoDecoderHeap : IntPtr
        CreateVideoProcessor   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets information about the features that are supported by the current video driver. (ID3D12VideoDevice::CheckFeatureSupport)
     * @param {D3D12_FEATURE_VIDEO} FeatureVideo A member of the [D3D12\_FEATURE\_VIDEO](ne-d3d12video-d3d12_feature_video.md) enumeration that specifies the feature to query for support.
     * @param {Integer} pFeatureSupportData A structure that contains data that describes the configuration details of the feature for which support is requested and, upon the completion of the call, is populated with details about the level of support available. For information on the structure that is associated with each type of feature support request, see the field descriptions for [D3D12\_FEATURE\_VIDEO](ne-d3d12video-d3d12_feature_video.md).
     * @param {Integer} FeatureSupportDataSize The size of the structure passed to the *pFeatureSupportData* parameter.
     * @returns {HRESULT} Returns **S\_OK** if successful; otherwise, returns **E\_INVALIDARG** if an unsupported data type is passed to the *pFeatureSupportData* parameter or a size mismatch is detected for the *FeatureSupportDataSize* parameter.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-checkfeaturesupport
     */
    CheckFeatureSupport(FeatureVideo, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(3, this, D3D12_FEATURE_VIDEO, FeatureVideo, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "HRESULT")
        return result
    }

    /**
     * Creates a video decoder instance.
     * @remarks
     * Decoding a new stream requires instantiating a new decoder object.
     * @param {Pointer<D3D12_VIDEO_DECODER_DESC>} pDesc A pointer to a [D3D12\_VIDEO\_DECODER\_DESC](ns-d3d12video-d3d12_video_decoder_desc.md) structure describing the decode profile and bitstream encryption for the decoder.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the decode video state interface.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the [ID3D12VideoDecoder](nn-d3d12video-id3d12videodecoder.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideodecoder
     */
    CreateVideoDecoder(pDesc, riid) {
        result := ComCall(4, this, D3D12_VIDEO_DECODER_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppVideoDecoder := 0, "HRESULT")
        return ppVideoDecoder
    }

    /**
     * Allocates a video decoder heap.
     * @param {Pointer<D3D12_VIDEO_DECODER_HEAP_DESC>} pVideoDecoderHeapDesc A pointer to a [D3D12\_VIDEO\_DECODER\_HEAP\_DESC](ns-d3d12video-d3d12_video_decoder_heap_desc.md) describing the decoding configuration.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the decode video state interface.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideodecoderheap
     */
    CreateVideoDecoderHeap(pVideoDecoderHeapDesc, riid) {
        result := ComCall(5, this, D3D12_VIDEO_DECODER_HEAP_DESC.Ptr, pVideoDecoderHeapDesc, Guid.Ptr, riid, "ptr*", &ppVideoDecoderHeap := 0, "HRESULT")
        return ppVideoDecoderHeap
    }

    /**
     * Creates a video processor instance.
     * @remarks
     * To change the parameters set during creation, you must recreate the video processor object.
     * @param {Integer} NodeMask The node mask specifying the physical adapter on which the video processor will be used. For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node, i.e. the device's physical adapter, to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC>} pOutputStreamDesc A pointer to a D3D12\_VIDEO\_PROCESS\_OUTPUT\_STREAM\_DESC(ns-d3d12video-d3d12_video_process_output_stream_desc) structure describing the output stream.
     * @param {Integer} NumInputStreamDescs The number of input streams provided in the *pInputStreamDescs* parameter.
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC>} pInputStreamDescs A pointer to a list of D3D12\_VIDEO\_PROCESS\_INPUT\_STREAM\_DESC(ns-d3d12video-d3d12_video_process_input_stream_desc) structures the input streams. The number of structures provided should match the value specified in the *NumInputStreamDescs* parameter.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the video processor interface.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the [ID3D12VideoProcessor](nn-d3d12video-id3d12videoprocessor.md) interface
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideoprocessor
     */
    CreateVideoProcessor(NodeMask, pOutputStreamDesc, NumInputStreamDescs, pInputStreamDescs, riid) {
        result := ComCall(6, this, "uint", NodeMask, D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.Ptr, pOutputStreamDesc, "uint", NumInputStreamDescs, D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.Ptr, pInputStreamDescs, Guid.Ptr, riid, "ptr*", &ppVideoProcessor := 0, "HRESULT")
        return ppVideoProcessor
    }

    Query(iid) {
        if (ID3D12VideoDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CheckFeatureSupport := CallbackCreate(GetMethod(implObj, "CheckFeatureSupport"), flags, 4)
        this.vtbl.CreateVideoDecoder := CallbackCreate(GetMethod(implObj, "CreateVideoDecoder"), flags, 4)
        this.vtbl.CreateVideoDecoderHeap := CallbackCreate(GetMethod(implObj, "CreateVideoDecoderHeap"), flags, 4)
        this.vtbl.CreateVideoProcessor := CallbackCreate(GetMethod(implObj, "CreateVideoProcessor"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CheckFeatureSupport)
        CallbackFree(this.vtbl.CreateVideoDecoder)
        CallbackFree(this.vtbl.CreateVideoDecoderHeap)
        CallbackFree(this.vtbl.CreateVideoProcessor)
    }
}
