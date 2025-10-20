#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudioStatus extends IDispatch{
    /**
     * The interface identifier for ISpeechAudioStatus
     * @type {Guid}
     */
    static IID => Guid("{c62d9c91-7458-47f6-862d-1ef86fb0b278}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} FreeBufferSpace 
     * @returns {HRESULT} 
     */
    get_FreeBufferSpace(FreeBufferSpace) {
        result := ComCall(7, this, "int*", FreeBufferSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} NonBlockingIO 
     * @returns {HRESULT} 
     */
    get_NonBlockingIO(NonBlockingIO) {
        result := ComCall(8, this, "int*", NonBlockingIO, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} State 
     * @returns {HRESULT} 
     */
    get_State(State) {
        result := ComCall(9, this, "int*", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} CurrentSeekPosition 
     * @returns {HRESULT} 
     */
    get_CurrentSeekPosition(CurrentSeekPosition) {
        result := ComCall(10, this, "ptr", CurrentSeekPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} CurrentDevicePosition 
     * @returns {HRESULT} 
     */
    get_CurrentDevicePosition(CurrentDevicePosition) {
        result := ComCall(11, this, "ptr", CurrentDevicePosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
