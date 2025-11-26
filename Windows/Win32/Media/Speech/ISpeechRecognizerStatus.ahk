#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechAudioStatus.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {ISpeechAudioStatus} 
     */
    AudioStatus {
        get => this.get_AudioStatus()
    }

    /**
     * @type {VARIANT} 
     */
    CurrentStreamPosition {
        get => this.get_CurrentStreamPosition()
    }

    /**
     * @type {Integer} 
     */
    CurrentStreamNumber {
        get => this.get_CurrentStreamNumber()
    }

    /**
     * @type {Integer} 
     */
    NumberOfActiveRules {
        get => this.get_NumberOfActiveRules()
    }

    /**
     * @type {BSTR} 
     */
    ClsidEngine {
        get => this.get_ClsidEngine()
    }

    /**
     * @type {VARIANT} 
     */
    SupportedLanguages {
        get => this.get_SupportedLanguages()
    }

    /**
     * 
     * @returns {ISpeechAudioStatus} 
     */
    get_AudioStatus() {
        result := ComCall(7, this, "ptr*", &AudioStatus := 0, "HRESULT")
        return ISpeechAudioStatus(AudioStatus)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CurrentStreamPosition() {
        pCurrentStreamPos := VARIANT()
        result := ComCall(8, this, "ptr", pCurrentStreamPos, "HRESULT")
        return pCurrentStreamPos
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentStreamNumber() {
        result := ComCall(9, this, "int*", &StreamNumber := 0, "HRESULT")
        return StreamNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfActiveRules() {
        result := ComCall(10, this, "int*", &NumberOfActiveRules := 0, "HRESULT")
        return NumberOfActiveRules
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ClsidEngine() {
        ClsidEngine := BSTR()
        result := ComCall(11, this, "ptr", ClsidEngine, "HRESULT")
        return ClsidEngine
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SupportedLanguages() {
        SupportedLanguages := VARIANT()
        result := ComCall(12, this, "ptr", SupportedLanguages, "HRESULT")
        return SupportedLanguages
    }
}
