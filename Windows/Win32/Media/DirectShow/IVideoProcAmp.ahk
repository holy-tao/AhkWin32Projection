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
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_BacklightCompensation(pValue, pFlags) {
        result := ComCall(3, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_BacklightCompensation(Value, Flags) {
        result := ComCall(4, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_BacklightCompensation(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(5, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Brightness(pValue, pFlags) {
        result := ComCall(6, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Brightness(Value, Flags) {
        result := ComCall(7, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Brightness(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(8, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_ColorEnable(pValue, pFlags) {
        result := ComCall(9, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_ColorEnable(Value, Flags) {
        result := ComCall(10, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_ColorEnable(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(11, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Contrast(pValue, pFlags) {
        result := ComCall(12, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Contrast(Value, Flags) {
        result := ComCall(13, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Contrast(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(14, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Gamma(pValue, pFlags) {
        result := ComCall(15, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Gamma(Value, Flags) {
        result := ComCall(16, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Gamma(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(17, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Saturation(pValue, pFlags) {
        result := ComCall(18, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Saturation(Value, Flags) {
        result := ComCall(19, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Saturation(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(20, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Sharpness(pValue, pFlags) {
        result := ComCall(21, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Sharpness(Value, Flags) {
        result := ComCall(22, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Sharpness(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(23, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_WhiteBalance(pValue, pFlags) {
        result := ComCall(24, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_WhiteBalance(Value, Flags) {
        result := ComCall(25, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_WhiteBalance(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(26, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Gain(pValue, pFlags) {
        result := ComCall(27, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Gain(Value, Flags) {
        result := ComCall(28, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Gain(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(29, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_Hue(pValue, pFlags) {
        result := ComCall(30, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_Hue(Value, Flags) {
        result := ComCall(31, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_Hue(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(32, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_DigitalMultiplier(pValue, pFlags) {
        result := ComCall(33, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_DigitalMultiplier(Value, Flags) {
        result := ComCall(34, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_DigitalMultiplier(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(35, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_PowerlineFrequency(pValue, pFlags) {
        result := ComCall(36, this, "int*", pValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_PowerlineFrequency(Value, Flags) {
        result := ComCall(37, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_PowerlineFrequency(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(38, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue1 
     * @param {Pointer<Int32>} pValue2 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_WhiteBalanceComponent(pValue1, pValue2, pFlags) {
        result := ComCall(39, this, "int*", pValue1, "int*", pValue2, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value1 
     * @param {Integer} Value2 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_WhiteBalanceComponent(Value1, Value2, Flags) {
        result := ComCall(40, this, "int", Value1, "int", Value2, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMin 
     * @param {Pointer<Int32>} pMax 
     * @param {Pointer<Int32>} pSteppingDelta 
     * @param {Pointer<Int32>} pDefault 
     * @param {Pointer<Int32>} pCapsFlag 
     * @returns {HRESULT} 
     */
    getRange_WhiteBalanceComponent(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(41, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
