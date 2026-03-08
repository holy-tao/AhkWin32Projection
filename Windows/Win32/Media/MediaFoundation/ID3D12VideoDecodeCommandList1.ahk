#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDecodeCommandList.ahk

/**
 * Encapsulates a list of graphics commands for video decoding. This interface inherits from ID3D12VideoDecodeCommandList and adds support for video decode histograms.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodecodecommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecodeCommandList1 extends ID3D12VideoDecodeCommandList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDecodeCommandList1
     * @type {Guid}
     */
    static IID => Guid("{d52f011b-b56e-453c-a05a-a7f311c8f472}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecodeFrame1"]

    /**
     * Records a decode frame operation to the command list.  Inputs, outputs, and parameters for the decode are specified as arguments to this method.
     * @param {ID3D12VideoDecoder} pDecoder A pointer to an [ID3D12VideoDecoder](nn-d3d12video-id3d12videodecoder.md) interface representing a decoder instance.
     * @param {Pointer<D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1>} pOutputArguments A [D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1](ns-d3d12video-d3d12_video_decode_output_stream_arguments1.md) structure specifying the output surface and output arguments.
     * @param {Pointer<D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS>} pInputArguments A [D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_decode_input_stream_arguments.md) structure specifying the input bitstream, reference frames, and other input parameters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecodecommandlist1-decodeframe1
     */
    DecodeFrame1(pDecoder, pOutputArguments, pInputArguments) {
        ComCall(23, this, "ptr", pDecoder, "ptr", pOutputArguments, "ptr", pInputArguments)
    }
}
