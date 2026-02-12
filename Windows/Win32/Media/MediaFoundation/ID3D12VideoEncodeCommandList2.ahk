#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoEncodeCommandList1.ahk

/**
 * This interface inherits from ID3D12VideoEncodeCommandList1 and adds methods for encoding video and resolving encode operation metadata.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videoencodecommandlist2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList2 extends ID3D12VideoEncodeCommandList1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList2
     * @type {Guid}
     */
    static IID => Guid("{895491e2-e701-46a9-9a1f-8d3480ed867a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EncodeFrame", "ResolveEncoderOutputMetadata"]

    /**
     * Encodes a bitstream.
     * @param {ID3D12VideoEncoder} pEncoder A [ID3D12VideoEncoder](nn-d3d12video-id3d12videoencoder.md) representing the video encoder to be used for the encode operation.
     * @param {ID3D12VideoEncoderHeap} pHeap A [ID3D12VideoEncoderHeap](nn-d3d12video-id3d12videoencoderheap.md) representing the video encoder heap to be used for this operation.
     * 
     * The encoder heap object allocation must not be released before any in-flight GPU commands that references it finish execution. 
     * 
     * Note that the reconfigurations in recorded commands input arguments done within allowed bounds (e.g. different target resolutions in allowed lists of resolutions) can co-exist in-flight with the same encoder heap instance, providing the target resolution is supported by the given encoder heap.
     * 
     * In the current release, we only support one execution flow at a time using the same encoder or encoder heap instances. All commands against these objects must be recorded and submitted in a serialized order, i.e. from a single CPU thread or synchronizing multiple threads in such way that the commands are recorded in a serialized order.
     * 
     * The video encoder and video encoder heap may be used to record commands from multiple command lists, but may only be associated with one command list at a time. The application is responsible for synchronizing single accesses to the video encoder and video encoder heap at a time. The application must also record video encoding commands against the video encoder and video encoder heaps in the order that they are executed on the GPU.
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS>} pInputArguments A [D3D12_VIDEO_ENCODER_ENCODEFRAME_INPUT_ARGUMENTS](ns-d3d12video-d3d12_video_encoder_encodeframe_input_arguments.md) representing input arguments for the encode operation.
     * @param {Pointer<D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS>} pOutputArguments A [D3D12_VIDEO_ENCODER_ENCODEFRAME_OUTPUT_ARGUMENTS](ns-d3d12video-d3d12_video_encoder_encodeframe_output_arguments.md) representing output arguments for the encode operation.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencodecommandlist2-encodeframe
     */
    EncodeFrame(pEncoder, pHeap, pInputArguments, pOutputArguments) {
        ComCall(27, this, "ptr", pEncoder, "ptr", pHeap, "ptr", pInputArguments, "ptr", pOutputArguments)
    }

    /**
     * Resolves the output metadata from a call to ID3D12VideoEncodeCommandList2::EncodeFrame to a readable format.
     * @remarks
     * The caller can interpret the contents of *pOutputArguments* as a memory blob that contains a [D3D12_VIDEO_ENCODER_OUTPUT_METADATA](ns-d3d12video-d3d12_video_encoder_output_metadata.md) structure and the metadata array contents. The array contents of the dynamic size metadata based on the subregion number are positioned in memory contiguously right after the struct allocation and the pointers in the struct point to the start addresses of the array contents.
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_INPUT_ARGUMENTS>} pInputArguments A pointer to a [D3D12_VIDEO_ENCODER_OUTPUT_METADATA](ns-d3d12video-d3d12_video_encoder_output_metadata.md) representing the opaque output metadata results from **EncodeFrame**.
     * @param {Pointer<D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS>} pOutputArguments A pointer to a [D3D12_VIDEO_ENCODER_OUTPUT_METADATA](ns-d3d12video-d3d12_video_encoder_output_metadata.md) output parameter that receivesthe resolved, readable metadata.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoencodecommandlist2-resolveencoderoutputmetadata
     */
    ResolveEncoderOutputMetadata(pInputArguments, pOutputArguments) {
        ComCall(28, this, "ptr", pInputArguments, "ptr", pOutputArguments)
    }
}
