#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoProcessCommandList.ahk

/**
 * Encapsulates a list of graphics commands for video processing. (ID3D12VideoProcessCommandList1)
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videoprocesscommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessCommandList1 extends ID3D12VideoProcessCommandList{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoProcessCommandList1
     * @type {Guid}
     */
    static IID => Guid("{542c5c4d-7596-434f-8c93-4efa6766f267}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessFrames1"]

    /**
     * Records a video processing operation to the command list, operating on one or more input samples and writing the result to an output surface. (ID3D12VideoProcessCommandList1::ProcessFrames1)
     * @param {ID3D12VideoProcessor} pVideoProcessor A pointer to an [ID3D12VideoProcessor](nn-d3d12video-id3d12videoprocessor.md) interface representing a video processor instance.
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS>} pOutputArguments A [D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS](ns-d3d12video-d3d12_video_process_output_stream_arguments.md) structure specifying the output surface and output arguments.
     * @param {Integer} NumInputStreams The count of input streams.
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1>} pInputArguments A pointer to an array of [D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1](ns-d3d12video-d3d12_video_process_input_stream_arguments1.md) structures specifying the input parameters.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist1-processframes1
     */
    ProcessFrames1(pVideoProcessor, pOutputArguments, NumInputStreams, pInputArguments) {
        ComCall(23, this, "ptr", pVideoProcessor, "ptr", pOutputArguments, "uint", NumInputStreams, "ptr", pInputArguments)
    }
}
