#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecognizerStatus extends IDispatch{
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
     * 
     * @param {Pointer<ISpeechAudioStatus>} AudioStatus 
     * @returns {HRESULT} 
     */
    get_AudioStatus(AudioStatus) {
        result := ComCall(7, this, "ptr", AudioStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pCurrentStreamPos 
     * @returns {HRESULT} 
     */
    get_CurrentStreamPosition(pCurrentStreamPos) {
        result := ComCall(8, this, "ptr", pCurrentStreamPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} StreamNumber 
     * @returns {HRESULT} 
     */
    get_CurrentStreamNumber(StreamNumber) {
        result := ComCall(9, this, "int*", StreamNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} NumberOfActiveRules 
     * @returns {HRESULT} 
     */
    get_NumberOfActiveRules(NumberOfActiveRules) {
        result := ComCall(10, this, "int*", NumberOfActiveRules, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ClsidEngine 
     * @returns {HRESULT} 
     */
    get_ClsidEngine(ClsidEngine) {
        result := ComCall(11, this, "ptr", ClsidEngine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} SupportedLanguages 
     * @returns {HRESULT} 
     */
    get_SupportedLanguages(SupportedLanguages) {
        result := ComCall(12, this, "ptr", SupportedLanguages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
