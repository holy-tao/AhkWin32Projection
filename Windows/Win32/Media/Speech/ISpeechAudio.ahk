#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechAudioStatus.ahk
#Include .\ISpeechAudioBufferInfo.ahk
#Include .\ISpeechAudioFormat.ahk
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
     * @returns {ISpeechAudioStatus} 
     */
    get_Status() {
        result := ComCall(12, this, "ptr*", &Status := 0, "HRESULT")
        return ISpeechAudioStatus(Status)
    }

    /**
     * 
     * @returns {ISpeechAudioBufferInfo} 
     */
    get_BufferInfo() {
        result := ComCall(13, this, "ptr*", &BufferInfo := 0, "HRESULT")
        return ISpeechAudioBufferInfo(BufferInfo)
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_DefaultFormat() {
        result := ComCall(14, this, "ptr*", &StreamFormat := 0, "HRESULT")
        return ISpeechAudioFormat(StreamFormat)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Volume() {
        result := ComCall(15, this, "int*", &Volume := 0, "HRESULT")
        return Volume
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
     * @returns {Integer} 
     */
    get_BufferNotifySize() {
        result := ComCall(17, this, "int*", &BufferNotifySize := 0, "HRESULT")
        return BufferNotifySize
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
     * @returns {Integer} 
     */
    get_EventHandle() {
        result := ComCall(19, this, "int*", &EventHandle := 0, "HRESULT")
        return EventHandle
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
