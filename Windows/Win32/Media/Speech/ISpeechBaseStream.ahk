#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechBaseStream extends IDispatch{
    /**
     * The interface identifier for ISpeechBaseStream
     * @type {Guid}
     */
    static IID => Guid("{6450336f-7d49-4ced-8097-49d6dee37294}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} AudioFormat 
     * @returns {HRESULT} 
     */
    get_Format(AudioFormat) {
        result := ComCall(7, this, "ptr", AudioFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISpeechAudioFormat>} AudioFormat 
     * @returns {HRESULT} 
     */
    putref_Format(AudioFormat) {
        result := ComCall(8, this, "ptr", AudioFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Buffer 
     * @param {Integer} NumberOfBytes 
     * @param {Pointer<Int32>} BytesRead 
     * @returns {HRESULT} 
     */
    Read(Buffer, NumberOfBytes, BytesRead) {
        result := ComCall(9, this, "ptr", Buffer, "int", NumberOfBytes, "int*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Buffer 
     * @param {Pointer<Int32>} BytesWritten 
     * @returns {HRESULT} 
     */
    Write(Buffer, BytesWritten) {
        result := ComCall(10, this, "ptr", Buffer, "int*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Position 
     * @param {Integer} Origin 
     * @param {Pointer<VARIANT>} NewPosition 
     * @returns {HRESULT} 
     */
    Seek(Position, Origin, NewPosition) {
        result := ComCall(11, this, "ptr", Position, "uint", Origin, "ptr", NewPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
