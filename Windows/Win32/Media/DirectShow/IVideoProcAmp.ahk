#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVideoProcAmp interface controls the image adjustment (ProcAmp) settings on a capture device.This interface may be exposed by one or more nodes in a capture filter.
 * @see https://docs.microsoft.com/windows/win32/api//vidcap/nn-vidcap-ivideoprocamp
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVideoProcAmp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoProcAmp
     * @type {Guid}
     */
    static IID => Guid("{4050560e-42a7-413a-85c2-09269a2d0f44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BacklightCompensation", "put_BacklightCompensation", "getRange_BacklightCompensation", "get_Brightness", "put_Brightness", "getRange_Brightness", "get_ColorEnable", "put_ColorEnable", "getRange_ColorEnable", "get_Contrast", "put_Contrast", "getRange_Contrast", "get_Gamma", "put_Gamma", "getRange_Gamma", "get_Saturation", "put_Saturation", "getRange_Saturation", "get_Sharpness", "put_Sharpness", "getRange_Sharpness", "get_WhiteBalance", "put_WhiteBalance", "getRange_WhiteBalance", "get_Gain", "put_Gain", "getRange_Gain", "get_Hue", "put_Hue", "getRange_Hue", "get_DigitalMultiplier", "put_DigitalMultiplier", "getRange_DigitalMultiplier", "get_PowerlineFrequency", "put_PowerlineFrequency", "getRange_PowerlineFrequency", "get_WhiteBalanceComponent", "put_WhiteBalanceComponent", "getRange_WhiteBalanceComponent"]

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_backlightcompensation
     */
    get_BacklightCompensation(pValue, pFlags) {
        result := ComCall(3, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_backlightcompensation
     */
    put_BacklightCompensation(Value, Flags) {
        result := ComCall(4, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_backlightcompensation
     */
    getRange_BacklightCompensation(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(5, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_brightness
     */
    get_Brightness(pValue, pFlags) {
        result := ComCall(6, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_brightness
     */
    put_Brightness(Value, Flags) {
        result := ComCall(7, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_brightness
     */
    getRange_Brightness(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(8, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_colorenable
     */
    get_ColorEnable(pValue, pFlags) {
        result := ComCall(9, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_colorenable
     */
    put_ColorEnable(Value, Flags) {
        result := ComCall(10, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_colorenable
     */
    getRange_ColorEnable(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(11, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_contrast
     */
    get_Contrast(pValue, pFlags) {
        result := ComCall(12, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_contrast
     */
    put_Contrast(Value, Flags) {
        result := ComCall(13, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_contrast
     */
    getRange_Contrast(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(14, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_gamma
     */
    get_Gamma(pValue, pFlags) {
        result := ComCall(15, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_gamma
     */
    put_Gamma(Value, Flags) {
        result := ComCall(16, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_gamma
     */
    getRange_Gamma(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(17, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_saturation
     */
    get_Saturation(pValue, pFlags) {
        result := ComCall(18, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_saturation
     */
    put_Saturation(Value, Flags) {
        result := ComCall(19, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_saturation
     */
    getRange_Saturation(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(20, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_sharpness
     */
    get_Sharpness(pValue, pFlags) {
        result := ComCall(21, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_sharpness
     */
    put_Sharpness(Value, Flags) {
        result := ComCall(22, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_sharpness
     */
    getRange_Sharpness(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(23, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_whitebalance
     */
    get_WhiteBalance(pValue, pFlags) {
        result := ComCall(24, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_whitebalance
     */
    put_WhiteBalance(Value, Flags) {
        result := ComCall(25, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_whitebalance
     */
    getRange_WhiteBalance(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(26, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_gain
     */
    get_Gain(pValue, pFlags) {
        result := ComCall(27, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_gain
     */
    put_Gain(Value, Flags) {
        result := ComCall(28, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_gain
     */
    getRange_Gain(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(29, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_hue
     */
    get_Hue(pValue, pFlags) {
        result := ComCall(30, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_hue
     */
    put_Hue(Value, Flags) {
        result := ComCall(31, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_hue
     */
    getRange_Hue(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(32, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_digitalmultiplier
     */
    get_DigitalMultiplier(pValue, pFlags) {
        result := ComCall(33, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_digitalmultiplier
     */
    put_DigitalMultiplier(Value, Flags) {
        result := ComCall(34, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_digitalmultiplier
     */
    getRange_DigitalMultiplier(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(35, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_powerlinefrequency
     */
    get_PowerlineFrequency(pValue, pFlags) {
        result := ComCall(36, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_powerlinefrequency
     */
    put_PowerlineFrequency(Value, Flags) {
        result := ComCall(37, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_powerlinefrequency
     */
    getRange_PowerlineFrequency(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(38, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue1 
     * @param {Pointer<Integer>} pValue2 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-get_whitebalancecomponent
     */
    get_WhiteBalanceComponent(pValue1, pValue2, pFlags) {
        result := ComCall(39, this, "int*", pValue1, "int*", pValue2, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value1 
     * @param {Integer} Value2 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-put_whitebalancecomponent
     */
    put_WhiteBalanceComponent(Value1, Value2, Flags) {
        result := ComCall(40, this, "int", Value1, "int", Value2, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMin 
     * @param {Pointer<Integer>} pMax 
     * @param {Pointer<Integer>} pSteppingDelta 
     * @param {Pointer<Integer>} pDefault 
     * @param {Pointer<Integer>} pCapsFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-ivideoprocamp-getrange_whitebalancecomponent
     */
    getRange_WhiteBalanceComponent(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(41, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }
}
