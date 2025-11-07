#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechWaveFormatEx.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechAudioFormat extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechAudioFormat
     * @type {Guid}
     */
    static IID => Guid("{e6e9c590-3e18-40e3-8299-061f98bde7c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Type", "put_Type", "get_Guid", "put_Guid", "GetWaveFormatEx", "SetWaveFormatEx"]

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &AudioFormat := 0, "HRESULT")
        return AudioFormat
    }

    /**
     * 
     * @param {Integer} AudioFormat 
     * @returns {HRESULT} 
     */
    put_Type(AudioFormat) {
        result := ComCall(8, this, "int", AudioFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Guid() {
        Guid := BSTR()
        result := ComCall(9, this, "ptr", Guid, "HRESULT")
        return Guid
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @returns {HRESULT} 
     */
    put_Guid(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(10, this, "ptr", Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechWaveFormatEx} 
     */
    GetWaveFormatEx() {
        result := ComCall(11, this, "ptr*", &SpeechWaveFormatEx := 0, "HRESULT")
        return ISpeechWaveFormatEx(SpeechWaveFormatEx)
    }

    /**
     * 
     * @param {ISpeechWaveFormatEx} SpeechWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetWaveFormatEx(SpeechWaveFormatEx) {
        result := ComCall(12, this, "ptr", SpeechWaveFormatEx, "HRESULT")
        return result
    }
}
