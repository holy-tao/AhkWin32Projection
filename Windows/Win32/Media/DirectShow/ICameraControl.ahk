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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Exposure", "put_Exposure", "getRange_Exposure", "get_Focus", "put_Focus", "getRange_Focus", "get_Iris", "put_Iris", "getRange_Iris", "get_Zoom", "put_Zoom", "getRange_Zoom", "get_FocalLengths", "get_Pan", "put_Pan", "getRange_Pan", "get_Tilt", "put_Tilt", "getRange_Tilt", "get_PanTilt", "put_PanTilt", "get_Roll", "put_Roll", "getRange_Roll", "get_ExposureRelative", "put_ExposureRelative", "getRange_ExposureRelative", "get_FocusRelative", "put_FocusRelative", "getRange_FocusRelative", "get_IrisRelative", "put_IrisRelative", "getRange_IrisRelative", "get_ZoomRelative", "put_ZoomRelative", "getRange_ZoomRelative", "get_PanRelative", "put_PanRelative", "get_TiltRelative", "put_TiltRelative", "getRange_TiltRelative", "get_PanTiltRelative", "put_PanTiltRelative", "getRange_PanRelative", "get_RollRelative", "put_RollRelative", "getRange_RollRelative", "get_ScanMode", "put_ScanMode", "get_PrivacyMode", "put_PrivacyMode"]

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_exposure
     */
    get_Exposure(pValue, pFlags) {
        result := ComCall(3, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_exposure
     */
    put_Exposure(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_exposure
     */
    getRange_Exposure(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(5, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_focus
     */
    get_Focus(pValue, pFlags) {
        result := ComCall(6, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_focus
     */
    put_Focus(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_focus
     */
    getRange_Focus(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(8, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_iris
     */
    get_Iris(pValue, pFlags) {
        result := ComCall(9, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_iris
     */
    put_Iris(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_iris
     */
    getRange_Iris(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(11, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_zoom
     */
    get_Zoom(pValue, pFlags) {
        result := ComCall(12, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_zoom
     */
    put_Zoom(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_zoom
     */
    getRange_Zoom(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(14, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plOcularFocalLength 
     * @param {Pointer<Integer>} plObjectiveFocalLengthMin 
     * @param {Pointer<Integer>} plObjectiveFocalLengthMax 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_focallengths
     */
    get_FocalLengths(plOcularFocalLength, plObjectiveFocalLengthMin, plObjectiveFocalLengthMax) {
        result := ComCall(15, this, "int*", plOcularFocalLength, "int*", plObjectiveFocalLengthMin, "int*", plObjectiveFocalLengthMax, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_pan
     */
    get_Pan(pValue, pFlags) {
        result := ComCall(16, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_pan
     */
    put_Pan(Value, Flags) {
        result := ComCall(17, this, "int", Value, "int", Flags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_pan
     */
    getRange_Pan(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(18, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_tilt
     */
    get_Tilt(pValue, pFlags) {
        result := ComCall(19, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_tilt
     */
    put_Tilt(Value, Flags) {
        result := ComCall(20, this, "int", Value, "int", Flags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_tilt
     */
    getRange_Tilt(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(21, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPanValue 
     * @param {Pointer<Integer>} pTiltValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_pantilt
     */
    get_PanTilt(pPanValue, pTiltValue, pFlags) {
        result := ComCall(22, this, "int*", pPanValue, "int*", pTiltValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PanValue 
     * @param {Integer} TiltValue 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_pantilt
     */
    put_PanTilt(PanValue, TiltValue, Flags) {
        result := ComCall(23, this, "int", PanValue, "int", TiltValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_roll
     */
    get_Roll(pValue, pFlags) {
        result := ComCall(24, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_roll
     */
    put_Roll(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_roll
     */
    getRange_Roll(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(26, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_exposurerelative
     */
    get_ExposureRelative(pValue, pFlags) {
        result := ComCall(27, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_exposurerelative
     */
    put_ExposureRelative(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_exposurerelative
     */
    getRange_ExposureRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(29, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_focusrelative
     */
    get_FocusRelative(pValue, pFlags) {
        result := ComCall(30, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_focusrelative
     */
    put_FocusRelative(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_focusrelative
     */
    getRange_FocusRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(32, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_irisrelative
     */
    get_IrisRelative(pValue, pFlags) {
        result := ComCall(33, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_irisrelative
     */
    put_IrisRelative(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_irisrelative
     */
    getRange_IrisRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(35, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_zoomrelative
     */
    get_ZoomRelative(pValue, pFlags) {
        result := ComCall(36, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_zoomrelative
     */
    put_ZoomRelative(Value, Flags) {
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_zoomrelative
     */
    getRange_ZoomRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(38, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_panrelative
     */
    get_PanRelative(pValue, pFlags) {
        result := ComCall(39, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_panrelative
     */
    put_PanRelative(Value, Flags) {
        result := ComCall(40, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_tiltrelative
     */
    get_TiltRelative(pValue, pFlags) {
        result := ComCall(41, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_tiltrelative
     */
    put_TiltRelative(Value, Flags) {
        result := ComCall(42, this, "int", Value, "int", Flags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_tiltrelative
     */
    getRange_TiltRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(43, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPanValue 
     * @param {Pointer<Integer>} pTiltValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_pantiltrelative
     */
    get_PanTiltRelative(pPanValue, pTiltValue, pFlags) {
        result := ComCall(44, this, "int*", pPanValue, "int*", pTiltValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PanValue 
     * @param {Integer} TiltValue 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_pantiltrelative
     */
    put_PanTiltRelative(PanValue, TiltValue, Flags) {
        result := ComCall(45, this, "int", PanValue, "int", TiltValue, "int", Flags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_panrelative
     */
    getRange_PanRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(46, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_rollrelative
     */
    get_RollRelative(pValue, pFlags) {
        result := ComCall(47, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_rollrelative
     */
    put_RollRelative(Value, Flags) {
        result := ComCall(48, this, "int", Value, "int", Flags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_rollrelative
     */
    getRange_RollRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        result := ComCall(49, this, "int*", pMin, "int*", pMax, "int*", pSteppingDelta, "int*", pDefault, "int*", pCapsFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_scanmode
     */
    get_ScanMode(pValue, pFlags) {
        result := ComCall(50, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_scanmode
     */
    put_ScanMode(Value, Flags) {
        result := ComCall(51, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_privacymode
     */
    get_PrivacyMode(pValue, pFlags) {
        result := ComCall(52, this, "int*", pValue, "int*", pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_privacymode
     */
    put_PrivacyMode(Value, Flags) {
        result := ComCall(53, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }
}
