#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudio extends ISpeechBaseStream{
    /**
     * The interface identifier for ISpeechAudio
     * @type {Guid}
     */
    static IID => Guid("{cff8e175-019e-11d3-a08e-00c04f8ef9b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {Pointer<ISpeechAudioStatus>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(12, this, "ptr", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioBufferInfo>} BufferInfo 
     * @returns {HRESULT} 
     */
    get_BufferInfo(BufferInfo) {
        result := ComCall(13, this, "ptr", BufferInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} StreamFormat 
     * @returns {HRESULT} 
     */
    get_DefaultFormat(StreamFormat) {
        result := ComCall(14, this, "ptr", StreamFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Volume 
     * @returns {HRESULT} 
     */
    get_Volume(Volume) {
        result := ComCall(15, this, "int*", Volume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Volume 
     * @returns {HRESULT} 
     */
    put_Volume(Volume) {
        result := ComCall(16, this, "int", Volume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} BufferNotifySize 
     * @returns {HRESULT} 
     */
    get_BufferNotifySize(BufferNotifySize) {
        result := ComCall(17, this, "int*", BufferNotifySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BufferNotifySize 
     * @returns {HRESULT} 
     */
    put_BufferNotifySize(BufferNotifySize) {
        result := ComCall(18, this, "int", BufferNotifySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EventHandle 
     * @returns {HRESULT} 
     */
    get_EventHandle(EventHandle) {
        result := ComCall(19, this, "int*", EventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    SetState(State) {
        result := ComCall(20, this, "int", State, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
