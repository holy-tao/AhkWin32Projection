#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudioBufferInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechAudioBufferInfo
     * @type {Guid}
     */
    static IID => Guid("{11b103d8-1142-4edf-a093-82fb3915f8cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MinNotification", "put_MinNotification", "get_BufferSize", "put_BufferSize", "get_EventBias", "put_EventBias"]

    /**
     * 
     * @returns {Integer} 
     */
    get_MinNotification() {
        result := ComCall(7, this, "int*", &MinNotification := 0, "HRESULT")
        return MinNotification
    }

    /**
     * 
     * @param {Integer} MinNotification 
     * @returns {HRESULT} 
     */
    put_MinNotification(MinNotification) {
        result := ComCall(8, this, "int", MinNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferSize() {
        result := ComCall(9, this, "int*", &BufferSize := 0, "HRESULT")
        return BufferSize
    }

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    put_BufferSize(BufferSize) {
        result := ComCall(10, this, "int", BufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventBias() {
        result := ComCall(11, this, "int*", &EventBias := 0, "HRESULT")
        return EventBias
    }

    /**
     * 
     * @param {Integer} EventBias 
     * @returns {HRESULT} 
     */
    put_EventBias(EventBias) {
        result := ComCall(12, this, "int", EventBias, "HRESULT")
        return result
    }
}
