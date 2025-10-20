#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/nn-dxvahd-idxvahd_videoprocessor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IDXVAHD_VideoProcessor extends IUnknown{
    /**
     * The interface identifier for IDXVAHD_VideoProcessor
     * @type {Guid}
     */
    static IID => Guid("{95f4edf4-6e03-4cd7-be1b-3075d665aa52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} State 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    SetVideoProcessBltState(State, DataSize, pData) {
        result := ComCall(3, this, "int", State, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    GetVideoProcessBltState(State, DataSize, pData) {
        result := ComCall(4, this, "int", State, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Integer} State 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    SetVideoProcessStreamState(StreamNumber, State, DataSize, pData) {
        result := ComCall(5, this, "uint", StreamNumber, "int", State, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} StreamNumber 
     * @param {Integer} State 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    GetVideoProcessStreamState(StreamNumber, State, DataSize, pData) {
        result := ComCall(6, this, "uint", StreamNumber, "int", State, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirect3DSurface9>} pOutputSurface 
     * @param {Integer} OutputFrame 
     * @param {Integer} StreamCount 
     * @param {Pointer<DXVAHD_STREAM_DATA>} pStreams 
     * @returns {HRESULT} 
     */
    VideoProcessBltHD(pOutputSurface, OutputFrame, StreamCount, pStreams) {
        result := ComCall(7, this, "ptr", pOutputSurface, "uint", OutputFrame, "uint", StreamCount, "ptr", pStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
