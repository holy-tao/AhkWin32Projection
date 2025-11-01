#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecognizerStatus extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognizerStatus
     * @type {Guid}
     */
    static IID => Guid("{bff9e781-53ec-484e-bb8a-0e1b5551e35c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioStatus", "get_CurrentStreamPosition", "get_CurrentStreamNumber", "get_NumberOfActiveRules", "get_ClsidEngine", "get_SupportedLanguages"]

    /**
     * 
     * @param {Pointer<ISpeechAudioStatus>} AudioStatus 
     * @returns {HRESULT} 
     */
    get_AudioStatus(AudioStatus) {
        result := ComCall(7, this, "ptr*", AudioStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pCurrentStreamPos 
     * @returns {HRESULT} 
     */
    get_CurrentStreamPosition(pCurrentStreamPos) {
        result := ComCall(8, this, "ptr", pCurrentStreamPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} StreamNumber 
     * @returns {HRESULT} 
     */
    get_CurrentStreamNumber(StreamNumber) {
        StreamNumberMarshal := StreamNumber is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, StreamNumberMarshal, StreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumberOfActiveRules 
     * @returns {HRESULT} 
     */
    get_NumberOfActiveRules(NumberOfActiveRules) {
        NumberOfActiveRulesMarshal := NumberOfActiveRules is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, NumberOfActiveRulesMarshal, NumberOfActiveRules, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ClsidEngine 
     * @returns {HRESULT} 
     */
    get_ClsidEngine(ClsidEngine) {
        result := ComCall(11, this, "ptr", ClsidEngine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} SupportedLanguages 
     * @returns {HRESULT} 
     */
    get_SupportedLanguages(SupportedLanguages) {
        result := ComCall(12, this, "ptr", SupportedLanguages, "HRESULT")
        return result
    }
}
