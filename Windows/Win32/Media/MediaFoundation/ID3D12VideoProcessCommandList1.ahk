#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoProcessCommandList.ahk

/**
 * Encapsulates a list of graphics commands for video processing.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videoprocesscommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessCommandList1 extends ID3D12VideoProcessCommandList{
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
     * 
     * @param {Pointer<ID3D12VideoProcessor>} pVideoProcessor 
     * @param {Pointer<D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS>} pOutputArguments 
     * @param {Integer} NumInputStreams 
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS1>} pInputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    ProcessFrames1(pVideoProcessor, pOutputArguments, NumInputStreams, pInputArguments) {
        ComCall(23, this, "ptr", pVideoProcessor, "ptr", pOutputArguments, "uint", NumInputStreams, "ptr", pInputArguments)
        return result
    }
}
