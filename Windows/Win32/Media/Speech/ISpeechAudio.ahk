#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudio extends ISpeechBaseStream{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_BufferInfo", "get_DefaultFormat", "get_Volume", "put_Volume", "get_BufferNotifySize", "put_BufferNotifySize", "get_EventHandle", "SetState"]

    /**
     * 
     * @param {Pointer<ISpeechAudioStatus>} Status 
     * @returns {HRESULT} 
     */
    get_Status(Status) {
        result := ComCall(12, this, "ptr*", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioBufferInfo>} BufferInfo 
     * @returns {HRESULT} 
     */
    get_BufferInfo(BufferInfo) {
        result := ComCall(13, this, "ptr*", BufferInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} StreamFormat 
     * @returns {HRESULT} 
     */
    get_DefaultFormat(StreamFormat) {
        result := ComCall(14, this, "ptr*", StreamFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Volume 
     * @returns {HRESULT} 
     */
    get_Volume(Volume) {
        result := ComCall(15, this, "int*", Volume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Volume 
     * @returns {HRESULT} 
     */
    put_Volume(Volume) {
        result := ComCall(16, this, "int", Volume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} BufferNotifySize 
     * @returns {HRESULT} 
     */
    get_BufferNotifySize(BufferNotifySize) {
        result := ComCall(17, this, "int*", BufferNotifySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BufferNotifySize 
     * @returns {HRESULT} 
     */
    put_BufferNotifySize(BufferNotifySize) {
        result := ComCall(18, this, "int", BufferNotifySize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} EventHandle 
     * @returns {HRESULT} 
     */
    get_EventHandle(EventHandle) {
        result := ComCall(19, this, "int*", EventHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} State 
     * @returns {HRESULT} 
     */
    SetState(State) {
        result := ComCall(20, this, "int", State, "HRESULT")
        return result
    }
}
