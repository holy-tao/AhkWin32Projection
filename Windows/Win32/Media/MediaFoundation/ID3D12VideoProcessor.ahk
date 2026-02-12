#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC.ahk
#Include .\D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Provides methods for getting information about the parameters to the call to ID3D12VideoDevice::CreateVideoProcessor that created the video processor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessor extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{304fdb32-bede-410a-8545-943ac6a46138}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNodeMask", "GetNumInputStreamDescs", "GetInputStreamDescs", "GetOutputStreamDesc"]

    /**
     * Gets the node mask provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @returns {Integer} This method returns a UINT.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocessor-getnodemask
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * Gets the number of input stream descriptions provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @returns {Integer} This method returns UINT. Use this value to determine the correct size of the array you pass in the *pInputStreamDescs* parameter to [ID3D12VideoProcessor::GetInputStreamDescs](nf-d3d12video-id3d12videoprocessor-getinputstreamdescs.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocessor-getnuminputstreamdescs
     */
    GetNumInputStreamDescs() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * Gets the input stream descriptions provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @param {Integer} NumInputStreamDescs The size of the array pointed to by *pInputStreamDescs*. Get the number of input stream descriptions associated with the video processor by calling [ID3DVideoProcessor::GetNumInputStreamDescs](nf-d3d12video-id3d12videoprocessor-getnuminputstreamdescs.md).
     * @returns {D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC} An array of [D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC](ns-d3d12video-d3d12_video_process_input_stream_desc.md) structures that is populated with the input stream descriptions associated with the video processor.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocessor-getinputstreamdescs
     */
    GetInputStreamDescs(NumInputStreamDescs) {
        pInputStreamDescs := D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC()
        result := ComCall(10, this, "uint", NumInputStreamDescs, "ptr", pInputStreamDescs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInputStreamDescs
    }

    /**
     * Gets the output stream description provided when the video processor was created with a call to ID3D12VideoDevice::CreateVideoProcessor.
     * @returns {D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC} This method returns [D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC](ns-d3d12video-d3d12_video_process_output_stream_desc.md).
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videoprocessor-getoutputstreamdesc
     */
    GetOutputStreamDesc() {
        result := ComCall(11, this, "ptr")
        return result
    }
}
