#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudioBufferInfo extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} MinNotification 
     * @returns {HRESULT} 
     */
    get_MinNotification(MinNotification) {
        result := ComCall(7, this, "int*", MinNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MinNotification 
     * @returns {HRESULT} 
     */
    put_MinNotification(MinNotification) {
        result := ComCall(8, this, "int", MinNotification, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} BufferSize 
     * @returns {HRESULT} 
     */
    get_BufferSize(BufferSize) {
        result := ComCall(9, this, "int*", BufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    put_BufferSize(BufferSize) {
        result := ComCall(10, this, "int", BufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} EventBias 
     * @returns {HRESULT} 
     */
    get_EventBias(EventBias) {
        result := ComCall(11, this, "int*", EventBias, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EventBias 
     * @returns {HRESULT} 
     */
    put_EventBias(EventBias) {
        result := ComCall(12, this, "int", EventBias, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
