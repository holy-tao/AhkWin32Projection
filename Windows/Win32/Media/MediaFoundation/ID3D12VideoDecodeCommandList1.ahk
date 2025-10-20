#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDecodeCommandList.ahk

/**
 * 
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videodecodecommandlist1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecodeCommandList1 extends ID3D12VideoDecodeCommandList{
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
     * 
     * @param {Pointer<ID3D12VideoDecoder>} pDecoder 
     * @param {Pointer<D3D12_VIDEO_DECODE_OUTPUT_STREAM_ARGUMENTS1>} pOutputArguments 
     * @param {Pointer<D3D12_VIDEO_DECODE_INPUT_STREAM_ARGUMENTS>} pInputArguments 
     * @returns {String} Nothing - always returns an empty string
     */
    DecodeFrame1(pDecoder, pOutputArguments, pInputArguments) {
        ComCall(23, this, "ptr", pDecoder, "ptr", pOutputArguments, "ptr", pInputArguments)
        return result
    }
}
