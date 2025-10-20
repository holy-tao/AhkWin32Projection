#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICameraControl interface controls the camera settings on a capture device.This interface may be exposed by one or more nodes in a capture filter.
 * @see https://docs.microsoft.com/windows/win32/api//vidcap/nn-vidcap-icameracontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICameraControl extends IUnknown{
    /**
     * The interface identifier for ICameraControl
     * @type {Guid}
     */
    static IID => Guid("{2ba1785d-4d1b-44ef-85e8-c7f1d3f20184}")

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
    get_Exposure(pValue, pFlags) {
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
    put_Exposure(Value, Flags) {
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
    getRange_Exposure(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_Focus(pValue, pFlags) {
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
    put_Focus(Value, Flags) {
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
    getRange_Focus(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_Iris(pValue, pFlags) {
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
    put_Iris(Value, Flags) {
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
    getRange_Iris(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_Zoom(pValue, pFlags) {
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
    put_Zoom(Value, Flags) {
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
    getRange_Zoom(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(14, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plOcularFocalLength 
     * @param {Pointer<Int32>} plObjectiveFocalLengthMin 
     * @param {Pointer<Int32>} plObjectiveFocalLengthMax 
     * @returns {HRESULT} 
     */
    get_FocalLengths(plOcularFocalLength, plObjectiveFocalLengthMin, plObjectiveFocalLengthMax) {
        result := ComCall(15, this, "int*", plOcularFocalLength, "int*", plObjectiveFocalLengthMin, "int*", plObjectiveFocalLengthMax, "int")
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
    get_Pan(pValue, pFlags) {
        result := ComCall(16, this, "int*", pValue, "int*", pFlags, "int")
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
    put_Pan(Value, Flags) {
        result := ComCall(17, this, "int", Value, "int", Flags, "int")
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
    getRange_Pan(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(18, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
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
    get_Tilt(pValue, pFlags) {
        result := ComCall(19, this, "int*", pValue, "int*", pFlags, "int")
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
    put_Tilt(Value, Flags) {
        result := ComCall(20, this, "int", Value, "int", Flags, "int")
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
    getRange_Tilt(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(21, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPanValue 
     * @param {Pointer<Int32>} pTiltValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_PanTilt(pPanValue, pTiltValue, pFlags) {
        result := ComCall(22, this, "int*", pPanValue, "int*", pTiltValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PanValue 
     * @param {Integer} TiltValue 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_PanTilt(PanValue, TiltValue, Flags) {
        result := ComCall(23, this, "int", PanValue, "int", TiltValue, "int", Flags, "int")
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
    get_Roll(pValue, pFlags) {
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
    put_Roll(Value, Flags) {
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
    getRange_Roll(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_ExposureRelative(pValue, pFlags) {
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
    put_ExposureRelative(Value, Flags) {
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
    getRange_ExposureRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_FocusRelative(pValue, pFlags) {
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
    put_FocusRelative(Value, Flags) {
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
    getRange_FocusRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_IrisRelative(pValue, pFlags) {
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
    put_IrisRelative(Value, Flags) {
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
    getRange_IrisRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
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
    get_ZoomRelative(pValue, pFlags) {
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
    put_ZoomRelative(Value, Flags) {
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
    getRange_ZoomRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(38, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
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
    get_PanRelative(pValue, pFlags) {
        result := ComCall(39, this, "int*", pValue, "int*", pFlags, "int")
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
    put_PanRelative(Value, Flags) {
        result := ComCall(40, this, "int", Value, "int", Flags, "int")
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
    get_TiltRelative(pValue, pFlags) {
        result := ComCall(41, this, "int*", pValue, "int*", pFlags, "int")
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
    put_TiltRelative(Value, Flags) {
        result := ComCall(42, this, "int", Value, "int", Flags, "int")
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
    getRange_TiltRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(43, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPanValue 
     * @param {Pointer<Int32>} pTiltValue 
     * @param {Pointer<Int32>} pFlags 
     * @returns {HRESULT} 
     */
    get_PanTiltRelative(pPanValue, pTiltValue, pFlags) {
        result := ComCall(44, this, "int*", pPanValue, "int*", pTiltValue, "int*", pFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PanValue 
     * @param {Integer} TiltValue 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    put_PanTiltRelative(PanValue, TiltValue, Flags) {
        result := ComCall(45, this, "int", PanValue, "int", TiltValue, "int", Flags, "int")
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
    getRange_PanRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(46, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
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
    get_RollRelative(pValue, pFlags) {
        result := ComCall(47, this, "int*", pValue, "int*", pFlags, "int")
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
    put_RollRelative(Value, Flags) {
        result := ComCall(48, this, "int", Value, "int", Flags, "int")
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
    getRange_RollRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(49, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "int")
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
    get_ScanMode(pValue, pFlags) {
        result := ComCall(50, this, "int*", pValue, "int*", pFlags, "int")
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
    put_ScanMode(Value, Flags) {
        result := ComCall(51, this, "int", Value, "int", Flags, "int")
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
    get_PrivacyMode(pValue, pFlags) {
        result := ComCall(52, this, "int*", pValue, "int*", pFlags, "int")
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
    put_PrivacyMode(Value, Flags) {
        result := ComCall(53, this, "int", Value, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
