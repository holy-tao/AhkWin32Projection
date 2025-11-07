#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITDetectTone.ahk
#Include .\ITCustomTone.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ITLegacyCallMediaControl.ahk

/**
 * The ITLegacyCallMediaControl2 interface is an extension of the ITLegacyCallMediaControl interface. ITLegacyCallMediaControl2 provides additional methods, primarily for tone detection and generation.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacycallmediacontrol2
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyCallMediaControl2 extends ITLegacyCallMediaControl{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GenerateDigits2", "GatherDigits", "DetectTones", "DetectTonesByCollection", "GenerateTone", "GenerateCustomTones", "GenerateCustomTonesByCollection", "CreateDetectToneObject", "CreateCustomToneObject", "GetIDAsVariant"]

    /**
     * 
     * @param {BSTR} pDigits 
     * @param {Integer} DigitMode 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatedigits2
     */
    GenerateDigits2(pDigits, DigitMode, lDuration) {
        pDigits := pDigits is String ? BSTR.Alloc(pDigits).Value : pDigits

        result := ComCall(12, this, "ptr", pDigits, "int", DigitMode, "int", lDuration, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-gatherdigits
     */
    GatherDigits(DigitMode, lNumDigits, pTerminationDigits, lFirstDigitTimeout, lInterDigitTimeout) {
        pTerminationDigits := pTerminationDigits is String ? BSTR.Alloc(pTerminationDigits).Value : pTerminationDigits

        result := ComCall(13, this, "int", DigitMode, "int", lNumDigits, "ptr", pTerminationDigits, "int", lFirstDigitTimeout, "int", lInterDigitTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TAPI_DETECTTONE>} pToneList 
     * @param {Integer} lNumTones 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-detecttones
     */
    DetectTones(pToneList, lNumTones) {
        result := ComCall(14, this, "ptr", pToneList, "int", lNumTones, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITCollection2} pDetectToneCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-detecttonesbycollection
     */
    DetectTonesByCollection(pDetectToneCollection) {
        result := ComCall(15, this, "ptr", pDetectToneCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ToneMode 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatetone
     */
    GenerateTone(ToneMode, lDuration) {
        result := ComCall(16, this, "int", ToneMode, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TAPI_CUSTOMTONE>} pToneList 
     * @param {Integer} lNumTones 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatecustomtones
     */
    GenerateCustomTones(pToneList, lNumTones, lDuration) {
        result := ComCall(17, this, "ptr", pToneList, "int", lNumTones, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITCollection2} pCustomToneCollection 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-generatecustomtonesbycollection
     */
    GenerateCustomTonesByCollection(pCustomToneCollection, lDuration) {
        result := ComCall(18, this, "ptr", pCustomToneCollection, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITDetectTone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-createdetecttoneobject
     */
    CreateDetectToneObject() {
        result := ComCall(19, this, "ptr*", &ppDetectTone := 0, "HRESULT")
        return ITDetectTone(ppDetectTone)
    }

    /**
     * 
     * @returns {ITCustomTone} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-createcustomtoneobject
     */
    CreateCustomToneObject() {
        result := ComCall(20, this, "ptr*", &ppCustomTone := 0, "HRESULT")
        return ITCustomTone(ppCustomTone)
    }

    /**
     * 
     * @param {BSTR} bstrDeviceClass 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol2-getidasvariant
     */
    GetIDAsVariant(bstrDeviceClass) {
        bstrDeviceClass := bstrDeviceClass is String ? BSTR.Alloc(bstrDeviceClass).Value : bstrDeviceClass

        pVarDeviceID := VARIANT()
        result := ComCall(21, this, "ptr", bstrDeviceClass, "ptr", pVarDeviceID, "HRESULT")
        return pVarDeviceID
    }
}
