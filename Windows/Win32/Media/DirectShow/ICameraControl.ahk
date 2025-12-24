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
     * The get_Exposure method returns the camera's exposure time.
     * @param {Pointer<Integer>} pValue Receives the exposure time, in log base 2 seconds. If the value is <i>n</i>, the exposure time is 2^n seconds.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_exposure
     */
    get_Exposure(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Exposure method sets the camera's exposure time.
     * @param {Integer} Value Exposure time, in log base 2 seconds. If the value is <i>n</i>, the exposure time is 2^n seconds.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_exposure
     */
    put_Exposure(Value, Flags) {
        result := ComCall(4, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Exposure method returns the range of exposure times supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum exposure time, in log base 2 seconds. If the value is <i>n</i>, the exposure time is 2^n seconds.
     * @param {Pointer<Integer>} pMax Receives the maximum exposure time, in log base 2 seconds.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default exposure time.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_exposure
     */
    getRange_Exposure(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Focus method returns the distance that is optimally in focus.
     * @param {Pointer<Integer>} pValue Receives the distance that is in focus, in millimeters.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_focus
     */
    get_Focus(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Focus method sets the distance that is optimally in focus.
     * @param {Integer} Value Specifies the focus distance, in millimeters.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_focus
     */
    put_Focus(Value, Flags) {
        result := ComCall(7, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Focus method returns the range of focal distances supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum focus distance, in millimeters.
     * @param {Pointer<Integer>} pMax Receives the maximum focus distance, in millimeters.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default focus distance.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_focus
     */
    getRange_Focus(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Iris method returns the camera's aperture setting.
     * @param {Pointer<Integer>} pValue Receives the aperture setting, in units of f-stop * 10.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_iris
     */
    get_Iris(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Iris method sets the camera's aperture setting.
     * @param {Integer} Value Specifies the aperture setting, in units of f-stop * 10.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_iris
     */
    put_Iris(Value, Flags) {
        result := ComCall(10, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Iris method returns the range of aperture settings supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum aperture setting, in units of f-stop * 100.
     * @param {Pointer<Integer>} pMax Receives the maximum aperture setting, in units of f-stop * 100.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default aperture setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_iris
     */
    getRange_Iris(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Zoom method returns the camera's optical zoom level.
     * @param {Pointer<Integer>} pValue Receives the zoom level. The units for this setting are not defined. For information about calculating magnification from zoom level, see <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_focallengths">ICameraControl::get_FocalLengths</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_zoom
     */
    get_Zoom(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Zoom method sets the camera's zoom level.
     * @param {Integer} Value Specifies the zoom level. The units for this setting are not defined. For information about calculating magnification from zoom level, see <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_focallengths">ICameraControl::get_FocalLengths</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_zoom
     */
    put_Zoom(Value, Flags) {
        result := ComCall(13, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Zoom method returns the range of zoom levels supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum zoom.
     * @param {Pointer<Integer>} pMax Receives the maximum zoom.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default zoom.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_zoom
     */
    getRange_Zoom(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_FocalLengths method returns the focal lengths of the camera lenses.
     * @param {Pointer<Integer>} plOcularFocalLength Receives the ocular focal length.
     * @param {Pointer<Integer>} plObjectiveFocalLengthMin Receives the minimum objective focal length.
     * @param {Pointer<Integer>} plObjectiveFocalLengthMax Receives the maximum objective focal length.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_focallengths
     */
    get_FocalLengths(plOcularFocalLength, plObjectiveFocalLengthMin, plObjectiveFocalLengthMax) {
        plOcularFocalLengthMarshal := plOcularFocalLength is VarRef ? "int*" : "ptr"
        plObjectiveFocalLengthMinMarshal := plObjectiveFocalLengthMin is VarRef ? "int*" : "ptr"
        plObjectiveFocalLengthMaxMarshal := plObjectiveFocalLengthMax is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plOcularFocalLengthMarshal, plOcularFocalLength, plObjectiveFocalLengthMinMarshal, plObjectiveFocalLengthMin, plObjectiveFocalLengthMaxMarshal, plObjectiveFocalLengthMax, "HRESULT")
        return result
    }

    /**
     * The get_Pan method returns the camera's panning angle.
     * @param {Pointer<Integer>} pValue Receives the panning angle, in degrees. Positive values are clockwise when viewing the camera from above, and negative values are counter clockwise. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_pan">ICameraControl::getRange_Pan</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_pan
     */
    get_Pan(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Pan method sets the camera's panning angle.
     * @param {Integer} Value Specifies the panning angle, in degrees. Positive values are clockwise when viewing the camera from above, and negative values are counter clockwise. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_pan">ICameraControl::getRange_Pan</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_pan
     */
    put_Pan(Value, Flags) {
        result := ComCall(17, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Pan method returns the range of panning angles supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum panning angle, in units of 1 arc second.
     * @param {Pointer<Integer>} pMax Receives the maximum panning angle, in units of 1 arc second.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default panning angle.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_pan
     */
    getRange_Pan(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_Tilt method returns the camera's tilt angle.
     * @param {Pointer<Integer>} pValue Receives the tilt angle, in degrees. Positive values point the camera up, and negative values point the camera down. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_tilt">ICameraControl::getRange_Tilt</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_tilt
     */
    get_Tilt(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Tilt method sets the camera's tilt angle.
     * @param {Integer} Value Specifies the tilt angle, in degrees. Positive values point the camera up, and negative values point the camera down. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_tilt">ICameraControl::getRange_Tilt</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_tilt
     */
    put_Tilt(Value, Flags) {
        result := ComCall(20, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Tilt method returns the range of tilt angles supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum tilt angle, in units of 1 arc second.
     * @param {Pointer<Integer>} pMax Receives the maximum tilt angle, in units of 1 arc second.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default tilt angle, in units of 1 arc second.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_tilt
     */
    getRange_Tilt(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_PanTilt method returns the camera's pan and tilt angles.
     * @param {Pointer<Integer>} pPanValue Receives the current panning angle, in arc seconds. An arc second is 1/3600th of a degree. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_pan">ICameraControl::get_Pan</a>.
     * @param {Pointer<Integer>} pTiltValue Receives the current tilt angle, in arc seconds. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_tilt">ICameraControl::get_Tilt</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_pantilt
     */
    get_PanTilt(pPanValue, pTiltValue, pFlags) {
        pPanValueMarshal := pPanValue is VarRef ? "int*" : "ptr"
        pTiltValueMarshal := pTiltValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pPanValueMarshal, pPanValue, pTiltValueMarshal, pTiltValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_PanTilt method sets the camera's pan and tilt angles.
     * @param {Integer} PanValue Specifies the panning angle, in arc seconds. An arc second is 1/3600th of a degree. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-put_pan">ICameraControl::put_Pan</a>.
     * @param {Integer} TiltValue Specifies the tilt angle, in arc seconds. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-put_tilt">ICameraControl::put_Tilt</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_pantilt
     */
    put_PanTilt(PanValue, TiltValue, Flags) {
        result := ComCall(23, this, "int", PanValue, "int", TiltValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * .
     * @param {Pointer<Integer>} pValue Receives the roll angle, in degrees. Positive values are clockwise along the image viewing axis, and negative values are counter clockwise. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_roll">ICameraControl::getRange_Roll</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_roll
     */
    get_Roll(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_Roll method sets the camera's roll angle.
     * @param {Integer} Value Specifies the roll angle, in degrees. Positive values are clockwise along the image viewing axis, and negative values are counter clockwise. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_roll">ICameraControl::getRange_Roll</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_roll
     */
    put_Roll(Value, Flags) {
        result := ComCall(25, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Roll method returns the range of roll angles supported by the camera.
     * @param {Pointer<Integer>} pMin Receives the minimum roll angle, in degrees.
     * @param {Pointer<Integer>} pMax Receives the maximum roll angle, in degrees.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default roll angle, in degrees.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_roll
     */
    getRange_Roll(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(26, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_ExposureRelative method returns the camera's relative exposure time. The relative exposure time is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pValue Receives the relative exposure. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_exposurerelative">ICameraControl::getRange_ExposureRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Default exposure time.</td>
     * </tr>
     * <tr>
     * <td>Postive value</td>
     * <td>Incremented by one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Decremented by one step.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_exposurerelative
     */
    get_ExposureRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_ExposureRelative method sets the camera's relative exposure time. The relative exposure time is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Integer} Value Specifies the relative exposure. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_exposurerelative">ICameraControl::getRange_ExposureRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Set the exposure to the default exposure time, which is implementation dependent.</td>
     * </tr>
     * <tr>
     * <td>Postive value</td>
     * <td>Increment the exposure time by one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Decrement the exposure time by one step.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_exposurerelative
     */
    put_ExposureRelative(Value, Flags) {
        result := ComCall(28, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_ExposureRelative method returns the range of relative exposure times supported by the camera. The relative exposure time is expressed as a number of steps, where the absolute value of each step depends on the camera model.
     * @param {Pointer<Integer>} pMin Receives the minimum relative exposure time.
     * @param {Pointer<Integer>} pMax Receives the maximum relative exposure time.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative exposure time.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_exposurerelative
     */
    getRange_ExposureRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_FocusRelative method returns the relative focus. The relative focus indicates the direction in which the lens group is moving.
     * @param {Pointer<Integer>} pValue Receives the relative focus. The size of the value represents the speed at which the focal point changes; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_focusrelative">ICameraControl::getRange_FocusRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stopped.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Focus is moving closer to the object.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Focus is moving farther away from the object.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_focusrelative
     */
    get_FocusRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_FocusRelative method sets the relative focus. The relative focus indicates the direction in which the lens group is moving.
     * @param {Integer} Value Specifies the relative focus. The size of the value represents the speed at which the focal point changes; a higher value represents a higher speed. To get the possible range of values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_focusrelative">ICameraControl::getRange_FocusRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stop focus motion.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Start moving the focus closer to the object.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Start moving the focus farther away from the object.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_focusrelative
     */
    put_FocusRelative(Value, Flags) {
        result := ComCall(31, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_FocusRelative method returns the range of relative focal distances supported by the camera. The relative focus indicates the direction in which the lens group is moving.
     * @param {Pointer<Integer>} pMin Receives the minimum relative focus.
     * @param {Pointer<Integer>} pMax Receives the minimum relative focus.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative focus.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_focusrelative
     */
    getRange_FocusRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_IrisRelative method returns the camera's relative aperture setting. The relative aperture is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pValue Receives the relative aperture setting. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_irisrelative">ICameraControl::getRange_IrisRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Default aperture setting.</td>
     * </tr>
     * <tr>
     * <td>Postive value</td>
     * <td>Open by one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Close by one step.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_irisrelative
     */
    get_IrisRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_IrisRelative method sets the camera's relative aperture setting. The relative aperture is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Integer} Value Specifies the relative aperture setting. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_irisrelative">ICameraControl::getRange_IrisRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Set the default aperture setting, which is implementation dependent.</td>
     * </tr>
     * <tr>
     * <td>Postive value</td>
     * <td>Open the iris one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Close the iris one step.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_irisrelative
     */
    put_IrisRelative(Value, Flags) {
        result := ComCall(34, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_IrisRelative method returns the range of relative aperture settings supported by the camera. The relative aperture is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pMin Receives the minimum relative aperture setting.
     * @param {Pointer<Integer>} pMax Receives the maximum relative aperture setting.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative aperture setting.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_irisrelative
     */
    getRange_IrisRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(35, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_ZoomRelative method returns the camera's relative zoom. The relative zoom indicates the direction in which the lens is moving.
     * @param {Pointer<Integer>} pValue Receives the relative zoom. The size of the value represents the desired zoom speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_zoomrelative">ICameraControl::getRange_ZoomRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stopped.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Zoom lens moving in the telephoto direction.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Zoom lens moving in the wide angle direction.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_zoomrelative
     */
    get_ZoomRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_ZoomRelative method sets the camera's relative zoom. The relative zoom indicates the direction in which the lens is moving.
     * @param {Integer} Value Specifies the relative zoom. The size of the value represents the desired zoom speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_zoomrelative">ICameraControl::getRange_ZoomRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stop zoom lens motion.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Start moving the zoom lens in the telephoto direction (initiate zoom-in).</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Start moving the zoom lens in the wide angle direction (initiate zoom-out).</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_zoomrelative
     */
    put_ZoomRelative(Value, Flags) {
        result := ComCall(37, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_ZoomRelative method returns the range of relative zoom levels supported by the camera. The relative zoom indicates the direction in which the lens is moving.
     * @param {Pointer<Integer>} pMin Receives the minimum relative zoom.
     * @param {Pointer<Integer>} pMax Receives the maximum relative zoom.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative zoom.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_zoomrelative
     */
    getRange_ZoomRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(38, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_PanRelative method returns the camera's relative pan. The relative pan is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pValue Receives the relative pan. The size of the value represents the desired pan speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_panrelative">ICameraControl::getRange_PanRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stopped.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Panning to the right.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Panning to the left.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_panrelative
     */
    get_PanRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(39, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_PanRelative method sets the camera's relative pan. The relative pan is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Integer} Value Specifies the relative pan. The size of the value represents the desired pan speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_panrelative">ICameraControl::getRange_PanRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stop panning.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Start panning to the right.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Start panning to the left.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_panrelative
     */
    put_PanRelative(Value, Flags) {
        result := ComCall(40, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * This topic applies only to Windows XP Service Pack 2 and later.
     * @param {Pointer<Integer>} pValue Receives the relative tilt. The size of the value represents the desired tilt speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_tiltrelative">ICameraControl::getRange_TiltRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stopped.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Tilting up.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Tilting down.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_tiltrelative
     */
    get_TiltRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(41, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_TiltRelative method sets the camera's relative tilt. The relative tilt is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Integer} Value Specifies the relative tilt. The size of the value represents the desired tilt speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_tiltrelative">ICameraControl::getRange_TiltRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stop tilting.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Start tilting up.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Start tilting down.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_tiltrelative
     */
    put_TiltRelative(Value, Flags) {
        result := ComCall(42, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_TiltRelative method returns the range of relative tilt angles supported by the camera. The relative tilt is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pMin Receives the minimum relative tilt angle.
     * @param {Pointer<Integer>} pMax Receives the maximum relative title angle.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative tilt angle.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_tiltrelative
     */
    getRange_TiltRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(43, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_PanTiltRelative method returns the camera's relative pan and tilt. The relative pan and tilt are expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pPanValue Receives the relative pan. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_panrelative">ICameraControl::get_PanRelative</a>.
     * @param {Pointer<Integer>} pTiltValue Receives the relative tilt. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_tiltrelative">ICameraControl::get_TiltRelative</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_pantiltrelative
     */
    get_PanTiltRelative(pPanValue, pTiltValue, pFlags) {
        pPanValueMarshal := pPanValue is VarRef ? "int*" : "ptr"
        pTiltValueMarshal := pTiltValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(44, this, pPanValueMarshal, pPanValue, pTiltValueMarshal, pTiltValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_PanTiltRelative method sets the camera's relative pan and tilt. The relative pan and tilt are expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Integer} PanValue Specifies the relative pan. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-put_panrelative">ICameraControl::put_PanRelative</a>.
     * @param {Integer} TiltValue Specifies the relative tilt. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-put_tiltrelative">ICameraControl::put_TiltRelative</a>.
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_pantiltrelative
     */
    put_PanTiltRelative(PanValue, TiltValue, Flags) {
        result := ComCall(45, this, "int", PanValue, "int", TiltValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_PanRelative method returns the range of relative panning angles supported by the camera. The relative pan is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pMin Receives the minimum relative panning angle.
     * @param {Pointer<Integer>} pMax Receives the maximum relative panning angle.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative panning angle.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_panrelative
     */
    getRange_PanRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(46, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_RollRelative method returns the camera's relative roll. The relative roll is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pValue Receives the relative roll. The size of the value represents the desired rotation speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_rollrelative">ICameraControl::getRange_RollRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stopped.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Rotating clockwise around the viewing axis.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Rotating counterclockwise around the viewing axis.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_rollrelative
     */
    get_RollRelative(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(47, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_RollRelative method sets the camera's relative roll. The relative roll is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Integer} Value Specifies the relative roll. The size of the value represents the desired rotation speed; a higher value represents a higher speed. To get the range of possible values, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_rollrelative">ICameraControl::getRange_RollRelative</a>.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Stop the roll.</td>
     * </tr>
     * <tr>
     * <td>Positive value</td>
     * <td>Start rotating clockwise around the viewing axis.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Start rotating counterclockwise around the viewing axis.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_rollrelative
     */
    put_RollRelative(Value, Flags) {
        result := ComCall(48, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_RollRelative method returns the range of relative roll angles supported by the camera. The relative roll is expressed as a number of steps, where the size of each step depends on the camera model.
     * @param {Pointer<Integer>} pMin Receives the minimum relative roll angle.
     * @param {Pointer<Integer>} pMax Receives the maximum relative roll angle.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default relative roll angle.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-getrange_rollrelative
     */
    getRange_RollRelative(pMin, pMax, pSteppingDelta, pDefault, pCapsFlag) {
        pMinMarshal := pMin is VarRef ? "int*" : "ptr"
        pMaxMarshal := pMax is VarRef ? "int*" : "ptr"
        pSteppingDeltaMarshal := pSteppingDelta is VarRef ? "int*" : "ptr"
        pDefaultMarshal := pDefault is VarRef ? "int*" : "ptr"
        pCapsFlagMarshal := pCapsFlag is VarRef ? "int*" : "ptr"

        result := ComCall(49, this, pMinMarshal, pMin, pMaxMarshal, pMax, pSteppingDeltaMarshal, pSteppingDelta, pDefaultMarshal, pDefault, pCapsFlagMarshal, pCapsFlag, "HRESULT")
        return result
    }

    /**
     * The get_ScanMode method returns the current scanning mode (interlaced or progressive).
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_scanmode
     */
    get_ScanMode(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(50, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_ScanMode method sets the camera's scanning mode (interlaced or progressive).
     * @param {Integer} Value 
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_scanmode
     */
    put_ScanMode(Value, Flags) {
        result := ComCall(51, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * .
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-get_privacymode
     */
    get_PrivacyMode(pValue, pFlags) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(52, this, pValueMarshal, pValue, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * The put_PrivacyMode method sets the camera's privacy setting. The privacy setting controls whether the camera sensor captures video.
     * @param {Integer} Value 
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vidcap/nf-vidcap-icameracontrol-put_privacymode
     */
    put_PrivacyMode(Value, Flags) {
        result := ComCall(53, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }
}
