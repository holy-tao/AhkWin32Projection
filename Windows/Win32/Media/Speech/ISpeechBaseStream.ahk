#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechAudioFormat.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechBaseStream extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "putref_Format", "Read", "Write", "Seek"]

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &AudioFormat := 0, "HRESULT")
        return ISpeechAudioFormat(AudioFormat)
    }

    /**
     * 
     * @param {ISpeechAudioFormat} AudioFormat 
     * @returns {HRESULT} 
     */
    putref_Format(AudioFormat) {
        result := ComCall(8, this, "ptr", AudioFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Buffer 
     * @param {Integer} NumberOfBytes 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    Read(Buffer, NumberOfBytes, BytesRead) {
        BytesReadMarshal := BytesRead is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", Buffer, "int", NumberOfBytes, BytesReadMarshal, BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Buffer 
     * @returns {Integer} 
     */
    Write(Buffer) {
        result := ComCall(10, this, "ptr", Buffer, "int*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {VARIANT} Position 
     * @param {Integer} Origin 
     * @returns {VARIANT} 
     */
    Seek(Position, Origin) {
        NewPosition := VARIANT()
        result := ComCall(11, this, "ptr", Position, "uint", Origin, "ptr", NewPosition, "HRESULT")
        return NewPosition
    }
}
