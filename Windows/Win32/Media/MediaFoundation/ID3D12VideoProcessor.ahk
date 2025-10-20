#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Provides methods for getting information about the parameters to the call to ID3D12VideoDevice::CreateVideoProcessor that created the video processor.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoProcessor extends ID3D12Pageable{
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
     * 
     * @returns {Integer} 
     */
    GetNodeMask() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumInputStreamDescs() {
        result := ComCall(9, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} NumInputStreamDescs 
     * @param {Pointer<D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC>} pInputStreamDescs 
     * @returns {HRESULT} 
     */
    GetInputStreamDescs(NumInputStreamDescs, pInputStreamDescs) {
        result := ComCall(10, this, "uint", NumInputStreamDescs, "ptr", pInputStreamDescs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC} 
     */
    GetOutputStreamDesc() {
        result := ComCall(11, this, "ptr")
        return result
    }
}
