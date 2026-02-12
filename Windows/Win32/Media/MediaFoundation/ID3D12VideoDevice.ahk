#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides video decoding and processing capabilities of a Microsoft Direct3D 12 device including the ability to query video capabilities and instantiating video decoders and processors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videodevice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice
     * @type {Guid}
     */
    static IID => Guid("{1f052807-0b46-4acc-8a89-364f793718a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckFeatureSupport", "CreateVideoDecoder", "CreateVideoDecoderHeap", "CreateVideoProcessor"]

    /**
     * Gets information about the features that are supported by the current video driver. (ID3D12VideoDevice::CheckFeatureSupport)
     * @param {Integer} FeatureVideo A member of the [D3D12\_FEATURE\_VIDEO](ne-d3d12video-d3d12_feature_video.md) enumeration that specifies the feature to query for support.
     * @param {Pointer} pFeatureSupportData A structure that contains data that describes the configuration details of the feature for which support is requested and, upon the completion of the call, is populated with details about the level of support available. For information on the structure that is associated with each type of feature support request, see the field descriptions for [D3D12\_FEATURE\_VIDEO](ne-d3d12video-d3d12_feature_video.md).
     * @param {Integer} FeatureSupportDataSize The size of the structure passed to the *pFeatureSupportData* parameter.
     * @returns {HRESULT} Returns **S\_OK** if successful; otherwise, returns **E\_INVALIDARG** if an unsupported data type is passed to the *pFeatureSupportData* parameter or a size mismatch is detected for the *FeatureSupportDataSize* parameter.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice-checkfeaturesupport
     */
    CheckFeatureSupport(FeatureVideo, pFeatureSupportData, FeatureSupportDataSize) {
        result := ComCall(3, this, "int", FeatureVideo, "ptr", pFeatureSupportData, "uint", FeatureSupportDataSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a video decoder instance.
     * @remarks
     * Decoding a new stream requires instantiating a new decoder object.
     * @param {Pointer<D3D12_VIDEO_DECODER_DESC>} pDesc A pointer to a [D3D12\_VIDEO\_DECODER\_DESC](ns-d3d12video-d3d12_video_decoder_desc.md) structure describing the decode profile and bitstream encryption for the decoder.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the decode video state interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the [ID3D12VideoDecoder](nn-d3d12video-id3d12videodecoder.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice-createvideodecoder
     */
    CreateVideoDecoder(pDesc, riid) {
        result := ComCall(4, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppVideoDecoder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoDecoder
    }

    /**
     * Allocates a video decoder heap.
     * @param {Pointer<D3D12_VIDEO_DECODER_HEAP_DESC>} pVideoDecoderHeapDesc A pointer to a [D3D12\_VIDEO\_DECODER\_HEAP\_DESC](ns-d3d12video-d3d12_video_decoder_heap_desc.md) describing the decoding configuration.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the decode video state interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the [ID3D12VideoDecoderHeap](nn-d3d12video-id3d12videodecoderheap.md) interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice-createvideodecoderheap
     */
    CreateVideoDecoderHeap(pVideoDecoderHeapDesc, riid) {
        result := ComCall(5, this, "ptr", pVideoDecoderHeapDesc, "ptr", riid, "ptr*", &ppVideoDecoderHeap := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the [ID3D12VideoProcessor](nn-d3d12video-id3d12videoprocessor.md) interface
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice-createvideoprocessor
     */
    CreateVideoProcessor(NodeMask, pOutputStreamDesc, NumInputStreamDescs, pInputStreamDescs, riid) {
        result := ComCall(6, this, "uint", NodeMask, "ptr", pOutputStreamDesc, "uint", NumInputStreamDescs, "ptr", pInputStreamDescs, "ptr", riid, "ptr*", &ppVideoProcessor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoProcessor
    }
}
