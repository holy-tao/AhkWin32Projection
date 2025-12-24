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
     * The get_BacklightCompensation method returns the camera's backlight compensation setting.
     * @param {Pointer<Integer>} pValue Receives the backlight compensation setting. If the value is zero, backlight compensation is disabled. Otherwise, backlight compensation is enabled. The camera may support a Boolean setting (0/1) or a range of settings. If it supports a range of settings, higher numbers indicate a greater degree of backlight compensation.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_backlightcompensation
     */
    get_BacklightCompensation(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_BacklightCompensation method sets the camera's backlight compensation.
     * @param {Integer} Value Specifies the backlight compensation setting. If the value is zero, backlight compensation is disabled. Otherwise, backlight compensation is enabled. The camera may support a Boolean setting (0/1) or a range of settings. If it supports a range of settings, higher numbers indicate a greater degree of backlight compensation.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_backlightcompensation
     */
    put_BacklightCompensation(Value, Flags) {
        result := ComCall(4, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_BacklightCompensation method returns the range of backlight compensation settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum backlight compensation setting.
     * @param {Pointer<Integer>} pMax Receives the maximum backlight compensation setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default backlight compensation setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_backlightcompensation
     */
    getRange_BacklightCompensation(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Brightness method returns the camera's brightness setting.
     * @param {Pointer<Integer>} pValue Receives the brightness setting. Larger values indicate increased brightness.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_brightness
     */
    get_Brightness(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Brightness method sets the camera's brightness setting.
     * @param {Integer} Value Specifies the brightness setting. Larger values indicate increased brightness.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_brightness
     */
    put_Brightness(Value, Flags) {
        result := ComCall(7, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Brightness method returns the range of brightness settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum brightness setting.
     * @param {Pointer<Integer>} pMax Receives the maximum brightness setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default brightness setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_brightness
     */
    getRange_Brightness(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_ColorEnable method returns the camera's color-enable setting.
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_colorenable
     */
    get_ColorEnable(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_ColorEnable method sets the camera's color-enable setting.
     * @param {Integer} Value 
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_colorenable
     */
    put_ColorEnable(Value, Flags) {
        result := ComCall(10, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_ColorEnable method returns the range of color-enable settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum color-enable setting.
     * @param {Pointer<Integer>} pMax Receives the maximum color-enable setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default color-enable setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_colorenable
     */
    getRange_ColorEnable(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Contrast method returns the camera's contrast setting.
     * @param {Pointer<Integer>} pValue Receives the contrast setting. Larger values indicate increased contrast.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_contrast
     */
    get_Contrast(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Contrast method sets the camera's contrast setting.
     * @param {Integer} Value Specifies the contrast setting. Larger values indicate increased contrast.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_contrast
     */
    put_Contrast(Value, Flags) {
        result := ComCall(13, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Contrast method returns the range of contrast settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum contrast setting.
     * @param {Pointer<Integer>} pMax Receives the maximum contrast setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default contrast setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_contrast
     */
    getRange_Contrast(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Gamma method returns the camera's gamma setting.
     * @param {Pointer<Integer>} pValue Receives the gamma setting, in units of gamma * 100. Theoretical values range from 1 to 500, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ivideoprocamp-getrange_gamma">IVideoProcAmp::getRange_Gamma</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_gamma
     */
    get_Gamma(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Gamma method sets the camera's gamma setting.
     * @param {Integer} Value Specifies the gamma setting, in units of gamma * 100. Theoretical values range from 1 to 500, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ivideoprocamp-getrange_gamma">IVideoProcAmp::getRange_Gamma</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_gamma
     */
    put_Gamma(Value, Flags) {
        result := ComCall(16, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Gamma method returns the range of gamma settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum gamma setting.
     * @param {Pointer<Integer>} pMax Receives the maximum gamma setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default gamma setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_gamma
     */
    getRange_Gamma(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Saturation method returns the camera's saturation setting.
     * @param {Pointer<Integer>} pValue Receives the saturation setting. Larger values indicate greater saturation. The value zero indicates grayscale.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_saturation
     */
    get_Saturation(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Saturation method sets the camera's saturation setting.
     * @param {Integer} Value Specifies the saturation setting. Larger values indicate greater saturation. The value zero indicates grayscale.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_saturation
     */
    put_Saturation(Value, Flags) {
        result := ComCall(19, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Saturation method returns the range of saturation settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum saturation setting.
     * @param {Pointer<Integer>} pMax Receives the maximum saturation setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default saturation setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_saturation
     */
    getRange_Saturation(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Sharpness method returns the camera's sharpness setting.
     * @param {Pointer<Integer>} pValue Receives the sharpness setting. Larger values indicate increasing sharpness.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_sharpness
     */
    get_Sharpness(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Sharpness method sets the camera's sharpness setting.
     * @param {Integer} Value Specifies the sharpness setting. Larger values indicate increasing sharpness.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_sharpness
     */
    put_Sharpness(Value, Flags) {
        result := ComCall(22, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Sharpness method returns the range of sharpness settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum sharpness setting.
     * @param {Pointer<Integer>} pMax Receives the maximum sharpness setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default sharpness setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_sharpness
     */
    getRange_Sharpness(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_WhiteBalance method returns the camera's white balance, specified as a color temperature.
     * @param {Pointer<Integer>} pValue Receives the white balance, in degrees Kelvin.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_whitebalance
     */
    get_WhiteBalance(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_WhiteBalance method sets the camera's white balance, specified as a color temperature.
     * @param {Integer} Value Specifies the white balance, in degrees Kelvin.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_whitebalance
     */
    put_WhiteBalance(Value, Flags) {
        result := ComCall(25, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_WhiteBalance method returns the range of white balance settings supported by the camera, expressed as color temperature.
     * @param {Pointer<Integer>} pMin Receives the minimum white balance, in degrees Kelvin.
     * @param {Pointer<Integer>} pMax Receives the maximum white balance, in degrees Kelvin.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default white balance.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_whitebalance
     */
    getRange_WhiteBalance(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Gain method returns the camera's gain setting.
     * @param {Pointer<Integer>} pValue Receives the gain setting. Larger values indicate higher gain.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_gain
     */
    get_Gain(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Gain method sets the camera's gain setting.
     * @param {Integer} Value Specifies the gain setting. Larger values indicate higher gain.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_gain
     */
    put_Gain(Value, Flags) {
        result := ComCall(28, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Gain method returns the range of gain settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum gain setting.
     * @param {Pointer<Integer>} pMax Receives the maximum gain setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default gain setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_gain
     */
    getRange_Gain(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Hue method returns the camera's hue setting.
     * @param {Pointer<Integer>} pValue Receives the hue setting, in units of degrees * 100. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ivideoprocamp-getrange_hue">IVideoProcAmp::getRange_Hue</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_hue
     */
    get_Hue(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Hue method sets the camera's hue setting.
     * @param {Integer} Value Specifies the hue setting, in units of degrees * 100. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ivideoprocamp-getrange_hue">IVideoProcAmp::getRange_Hue</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_hue
     */
    put_Hue(Value, Flags) {
        result := ComCall(31, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Hue method returns the range of hue settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum hue setting.
     * @param {Pointer<Integer>} pMax Receives the maximum hue setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default hue setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_hue
     */
    getRange_Hue(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_DigitalMultiplier method returns the camera's digital zoom level.
     * @param {Pointer<Integer>} pValue Receives the digital zoom multiplier.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_digitalmultiplier
     */
    get_DigitalMultiplier(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_DigitalMultiplier method sets the camera's digital zoom level.
     * @param {Integer} Value Specifies the digital zoom multiplier.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_digitalmultiplier
     */
    put_DigitalMultiplier(Value, Flags) {
        result := ComCall(34, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_DigitalMultiplier method returns the range of digital zoom levels supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum digital zoom level.
     * @param {Pointer<Integer>} pMax Receives the maximum digital zoom level.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default digital zoom level.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_digitalmultiplier
     */
    getRange_DigitalMultiplier(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_PowerlineFrequency method returns the camera's power line frequency setting. This setting enables the camera to perform anti-flicker processing.
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_powerlinefrequency
     */
    get_PowerlineFrequency(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_PowerlineFrequency method sets the camera's power line frequency setting. This setting enables the camera to perform anti-flicker processing.
     * @param {Integer} Value 
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_powerlinefrequency
     */
    put_PowerlineFrequency(Value, Flags) {
        result := ComCall(37, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_PowerlineFrequency method returns the range of power line frequency settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum power line frequency setting.
     * @param {Pointer<Integer>} pMax Receives the maximum power line frequency setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default power line frequency setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_powerlinefrequency
     */
    getRange_PowerlineFrequency(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_WhiteBalanceComponent method returns the camera's white balance, specified as red and blue component values.
     * @param {Pointer<Integer>} pValue1 Receives the red component.
     * @param {Pointer<Integer>} pValue2 Receives the blue component.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-get_whitebalancecomponent
     */
    get_WhiteBalanceComponent(pValue1, pValue2, pFlags) {
        pValue1Marshal := pValue1 is VarRef ? "int*" : "ptr"
        pValue2Marshal := pValue2 is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, pValue1Marshal, pValue1, pValue2Marshal, pValue2, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_WhiteBalanceComponent method sets the camera's white balance, specified as red and blue component values.
     * @param {Integer} Value1 Specifies the red component.
     * @param {Integer} Value2 Specifies the blue component.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>. If the VideoProcAmp_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-put_whitebalancecomponent
     */
    put_WhiteBalanceComponent(Value1, Value2, Flags) {
        result := ComCall(40, this, "int", Value1, "int", Value2, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_WhiteBalanceComponent method returns the range of white balance settings supported by the camera, expressed as red and blue component values.
     * @param {Pointer<Integer>} pMin Receives the minimum white balance.
     * @param {Pointer<Integer>} pMax Receives the maximum white balance.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default white balance.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-videoprocampflags">VideoProcAmpFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-ivideoprocamp-getrange_whitebalancecomponent
     */
    getRange_WhiteBalanceComponent(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }
}
