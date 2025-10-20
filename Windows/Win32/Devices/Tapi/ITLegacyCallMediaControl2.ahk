#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITLegacyCallMediaControl.ahk

/**
 * The ITLegacyCallMediaControl2 interface is an extension of the ITLegacyCallMediaControl interface. ITLegacyCallMediaControl2 provides additional methods, primarily for tone detection and generation.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacycallmediacontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyCallMediaControl2 extends ITLegacyCallMediaControl{
    /**
     * The interface identifier for ITLegacyCallMediaControl2
     * @type {Guid}
     */
    static IID => Guid("{57ca332d-7bc2-44f1-a60c-936fe8d7ce73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * 
     * @param {BSTR} pDigits 
     * @param {Integer} DigitMode 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    GenerateDigits2(pDigits, DigitMode, lDuration) {
        pDigits := pDigits is String ? BSTR.Alloc(pDigits).Value : pDigits

        result := ComCall(12, this, "ptr", pDigits, "int", DigitMode, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DigitMode 
     * @param {Integer} lNumDigits 
     * @param {BSTR} pTerminationDigits 
     * @param {Integer} lFirstDigitTimeout 
     * @param {Integer} lInterDigitTimeout 
     * @returns {HRESULT} 
     */
    GatherDigits(DigitMode, lNumDigits, pTerminationDigits, lFirstDigitTimeout, lInterDigitTimeout) {
        pTerminationDigits := pTerminationDigits is String ? BSTR.Alloc(pTerminationDigits).Value : pTerminationDigits

        result := ComCall(13, this, "int", DigitMode, "int", lNumDigits, "ptr", pTerminationDigits, "int", lFirstDigitTimeout, "int", lInterDigitTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TAPI_DETECTTONE>} pToneList 
     * @param {Integer} lNumTones 
     * @returns {HRESULT} 
     */
    DetectTones(pToneList, lNumTones) {
        result := ComCall(14, this, "ptr", pToneList, "int", lNumTones, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCollection2>} pDetectToneCollection 
     * @returns {HRESULT} 
     */
    DetectTonesByCollection(pDetectToneCollection) {
        result := ComCall(15, this, "ptr", pDetectToneCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ToneMode 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    GenerateTone(ToneMode, lDuration) {
        result := ComCall(16, this, "int", ToneMode, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TAPI_CUSTOMTONE>} pToneList 
     * @param {Integer} lNumTones 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    GenerateCustomTones(pToneList, lNumTones, lDuration) {
        result := ComCall(17, this, "ptr", pToneList, "int", lNumTones, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCollection2>} pCustomToneCollection 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    GenerateCustomTonesByCollection(pCustomToneCollection, lDuration) {
        result := ComCall(18, this, "ptr", pCustomToneCollection, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITDetectTone>} ppDetectTone 
     * @returns {HRESULT} 
     */
    CreateDetectToneObject(ppDetectTone) {
        result := ComCall(19, this, "ptr", ppDetectTone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCustomTone>} ppCustomTone 
     * @returns {HRESULT} 
     */
    CreateCustomToneObject(ppCustomTone) {
        result := ComCall(20, this, "ptr", ppCustomTone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDeviceClass 
     * @param {Pointer<VARIANT>} pVarDeviceID 
     * @returns {HRESULT} 
     */
    GetIDAsVariant(bstrDeviceClass, pVarDeviceID) {
        bstrDeviceClass := bstrDeviceClass is String ? BSTR.Alloc(bstrDeviceClass).Value : bstrDeviceClass

        result := ComCall(21, this, "ptr", bstrDeviceClass, "ptr", pVarDeviceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
