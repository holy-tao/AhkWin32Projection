#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ICameraControl interface controls the camera settings on a capture device.This interface may be exposed by one or more nodes in a capture filter.
 * @see https://learn.microsoft.com/windows/win32/api/vidcap/nn-vidcap-icameracontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ICameraControl extends IUnknown {
    /**
     * The interface identifier for ICameraControl
     * @type {Guid}
     */
    static IID := Guid("{2ba1785d-4d1b-44ef-85e8-c7f1d3f20184}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICameraControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Exposure              : IntPtr
        put_Exposure              : IntPtr
        getRange_Exposure         : IntPtr
        get_Focus                 : IntPtr
        put_Focus                 : IntPtr
        getRange_Focus            : IntPtr
        get_Iris                  : IntPtr
        put_Iris                  : IntPtr
        getRange_Iris             : IntPtr
        get_Zoom                  : IntPtr
        put_Zoom                  : IntPtr
        getRange_Zoom             : IntPtr
        get_FocalLengths          : IntPtr
        get_Pan                   : IntPtr
        put_Pan                   : IntPtr
        getRange_Pan              : IntPtr
        get_Tilt                  : IntPtr
        put_Tilt                  : IntPtr
        getRange_Tilt             : IntPtr
        get_PanTilt               : IntPtr
        put_PanTilt               : IntPtr
        get_Roll                  : IntPtr
        put_Roll                  : IntPtr
        getRange_Roll             : IntPtr
        get_ExposureRelative      : IntPtr
        put_ExposureRelative      : IntPtr
        getRange_ExposureRelative : IntPtr
        get_FocusRelative         : IntPtr
        put_FocusRelative         : IntPtr
        getRange_FocusRelative    : IntPtr
        get_IrisRelative          : IntPtr
        put_IrisRelative          : IntPtr
        getRange_IrisRelative     : IntPtr
        get_ZoomRelative          : IntPtr
        put_ZoomRelative          : IntPtr
        getRange_ZoomRelative     : IntPtr
        get_PanRelative           : IntPtr
        put_PanRelative           : IntPtr
        get_TiltRelative          : IntPtr
        put_TiltRelative          : IntPtr
        getRange_TiltRelative     : IntPtr
        get_PanTiltRelative       : IntPtr
        put_PanTiltRelative       : IntPtr
        getRange_PanRelative      : IntPtr
        get_RollRelative          : IntPtr
        put_RollRelative          : IntPtr
        getRange_RollRelative     : IntPtr
        get_ScanMode              : IntPtr
        put_ScanMode              : IntPtr
        get_PrivacyMode           : IntPtr
        put_PrivacyMode           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICameraControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_Exposure method returns the camera's exposure time.
     * @param {Pointer<Integer>} pValue Receives the exposure time, in log base 2 seconds. If the value is <i>n</i>, the exposure time is 2^n seconds.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_exposure
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_exposure
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_exposure
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_focus
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_focus
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_focus
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_iris
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_iris
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_iris
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
     * @remarks
     * This method returns the optical zoom level only. To get the digital zoom level, call <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-ivideoprocamp-get_digitalmultiplier">IVideoProcAmp::get_DigitalMultiplier</a>.
     * @param {Pointer<Integer>} pValue Receives the zoom level. The units for this setting are not defined. For information about calculating magnification from zoom level, see <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_focallengths">ICameraControl::get_FocalLengths</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_zoom
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_zoom
     */
    put_Zoom(Value, Flags) {
        result := ComCall(13, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * The getRange_Zoom method returns the range of zoom levels supported by the camera.
     * @remarks
     * For information about calculating magnification from zoom level, see <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_focallengths">ICameraControl::get_FocalLengths</a>.
     * @param {Pointer<Integer>} pMin Receives the minimum zoom.
     * @param {Pointer<Integer>} pMax Receives the maximum zoom.
     * @param {Pointer<Integer>} pSteppingDelta Receives the smallest step between settings.
     * @param {Pointer<Integer>} pDefault Receives the default zoom.
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_zoom
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
     * @remarks
     * In a two-lens camera, the objective lens is closer to the subject, and the ocular lens is closer to the camera. The ocular focal length is fixed. If the camera has an optical zoom, the objective focal length can vary within a fixed range. Magnification is calculated as the ratio of objective/ocular focal length. Because the magnification is expressed as a ratio, it has no units. Therefore, the units for the focal length are not defined by this interface.
     * 
     * If the camera supports optical zooming, the current zoom level is expressed as integer values between a range <i>Zmin</i> and <i>Zmax</i>. The objective focal length can then be calculated as follows:
     * 
     * 
     * ```cpp
     * 
     * Lcur = ( ( (Zcur - Zmin) * (Lmax - Lmin) ) / (Zmax - Zmin) ) + Lmin
     * 
     * ```
     * 
     * 
     * where:
     * 
     * <ul>
     * <li>
     *             Lcur = Current objective focal length.</li>
     * <li>
     *             Lmin, Lmax = Minimum and maximum objective focal length.</li>
     * <li>
     *             Zcur = Current zoom setting. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-get_zoom">ICameraControl::get_Zoom</a>.</li>
     * <li>
     *             Zmin, Zmax = Minimum and maximum zoom setting. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_zoom">ICameraControl::getRange_Zoom</a>.</li>
     * </ul>
     * From 
     * 
     * 
     * ```
     * Lcur
     * ```
     * 
     * , you can calculate the magnification.
     * @param {Pointer<Integer>} plOcularFocalLength Receives the ocular focal length.
     * @param {Pointer<Integer>} plObjectiveFocalLengthMin Receives the minimum objective focal length.
     * @param {Pointer<Integer>} plObjectiveFocalLengthMax Receives the maximum objective focal length.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_focallengths
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_pan
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_pan
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_pan
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_tilt
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_tilt
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_tilt
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_pantilt
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_pantilt
     */
    put_PanTilt(PanValue, TiltValue, Flags) {
        result := ComCall(23, this, "int", PanValue, "int", TiltValue, "int", Flags, "HRESULT")
        return result
    }

    /**
     * .
     * @param {Pointer<Integer>} pValue Receives the roll angle, in degrees. Positive values are clockwise along the image viewing axis, and negative values are counter clockwise. Theoretical values range from –180 degrees to +180 degrees, but the actual range depends on the camera. See <a href="https://docs.microsoft.com/windows/desktop/api/vidcap/nf-vidcap-icameracontrol-getrange_roll">ICameraControl::getRange_Roll</a>.
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_roll
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_roll
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_roll
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
     * <td>Positive value</td>
     * <td>Incremented by one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Decremented by one step.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_exposurerelative
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
     * <td>Positive value</td>
     * <td>Increment the exposure time by one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Decrement the exposure time by one step.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_exposurerelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_exposurerelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_focusrelative
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_focusrelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_focusrelative
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
     * <td>Positive value</td>
     * <td>Open by one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Close by one step.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_irisrelative
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
     * <td>Positive value</td>
     * <td>Open the iris one step.</td>
     * </tr>
     * <tr>
     * <td>Negative value</td>
     * <td>Close the iris one step.</td>
     * </tr>
     * </table>
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_irisrelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_irisrelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_zoomrelative
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_zoomrelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_zoomrelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_panrelative
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_panrelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_tiltrelative
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_tiltrelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_tiltrelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_pantiltrelative
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_pantiltrelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_panrelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_rollrelative
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_rollrelative
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
     * @param {Pointer<Integer>} pCapsFlag Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-getrange_rollrelative
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
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_scanmode
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_scanmode
     */
    put_ScanMode(Value, Flags) {
        result := ComCall(51, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    /**
     * .
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pFlags Receives one or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-get_privacymode
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
     * @param {Integer} Flags Zero or more flags. See <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-cameracontrolflags">CameraControlFlags</a>. If the CameraControl_Flags_Auto flag is used, the <i>Value</i> parameter is ignored and the camera sets the default value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vidcap/nf-vidcap-icameracontrol-put_privacymode
     */
    put_PrivacyMode(Value, Flags) {
        result := ComCall(53, this, "int", Value, "int", Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICameraControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Exposure := CallbackCreate(GetMethod(implObj, "get_Exposure"), flags, 3)
        this.vtbl.put_Exposure := CallbackCreate(GetMethod(implObj, "put_Exposure"), flags, 3)
        this.vtbl.getRange_Exposure := CallbackCreate(GetMethod(implObj, "getRange_Exposure"), flags, 6)
        this.vtbl.get_Focus := CallbackCreate(GetMethod(implObj, "get_Focus"), flags, 3)
        this.vtbl.put_Focus := CallbackCreate(GetMethod(implObj, "put_Focus"), flags, 3)
        this.vtbl.getRange_Focus := CallbackCreate(GetMethod(implObj, "getRange_Focus"), flags, 6)
        this.vtbl.get_Iris := CallbackCreate(GetMethod(implObj, "get_Iris"), flags, 3)
        this.vtbl.put_Iris := CallbackCreate(GetMethod(implObj, "put_Iris"), flags, 3)
        this.vtbl.getRange_Iris := CallbackCreate(GetMethod(implObj, "getRange_Iris"), flags, 6)
        this.vtbl.get_Zoom := CallbackCreate(GetMethod(implObj, "get_Zoom"), flags, 3)
        this.vtbl.put_Zoom := CallbackCreate(GetMethod(implObj, "put_Zoom"), flags, 3)
        this.vtbl.getRange_Zoom := CallbackCreate(GetMethod(implObj, "getRange_Zoom"), flags, 6)
        this.vtbl.get_FocalLengths := CallbackCreate(GetMethod(implObj, "get_FocalLengths"), flags, 4)
        this.vtbl.get_Pan := CallbackCreate(GetMethod(implObj, "get_Pan"), flags, 3)
        this.vtbl.put_Pan := CallbackCreate(GetMethod(implObj, "put_Pan"), flags, 3)
        this.vtbl.getRange_Pan := CallbackCreate(GetMethod(implObj, "getRange_Pan"), flags, 6)
        this.vtbl.get_Tilt := CallbackCreate(GetMethod(implObj, "get_Tilt"), flags, 3)
        this.vtbl.put_Tilt := CallbackCreate(GetMethod(implObj, "put_Tilt"), flags, 3)
        this.vtbl.getRange_Tilt := CallbackCreate(GetMethod(implObj, "getRange_Tilt"), flags, 6)
        this.vtbl.get_PanTilt := CallbackCreate(GetMethod(implObj, "get_PanTilt"), flags, 4)
        this.vtbl.put_PanTilt := CallbackCreate(GetMethod(implObj, "put_PanTilt"), flags, 4)
        this.vtbl.get_Roll := CallbackCreate(GetMethod(implObj, "get_Roll"), flags, 3)
        this.vtbl.put_Roll := CallbackCreate(GetMethod(implObj, "put_Roll"), flags, 3)
        this.vtbl.getRange_Roll := CallbackCreate(GetMethod(implObj, "getRange_Roll"), flags, 6)
        this.vtbl.get_ExposureRelative := CallbackCreate(GetMethod(implObj, "get_ExposureRelative"), flags, 3)
        this.vtbl.put_ExposureRelative := CallbackCreate(GetMethod(implObj, "put_ExposureRelative"), flags, 3)
        this.vtbl.getRange_ExposureRelative := CallbackCreate(GetMethod(implObj, "getRange_ExposureRelative"), flags, 6)
        this.vtbl.get_FocusRelative := CallbackCreate(GetMethod(implObj, "get_FocusRelative"), flags, 3)
        this.vtbl.put_FocusRelative := CallbackCreate(GetMethod(implObj, "put_FocusRelative"), flags, 3)
        this.vtbl.getRange_FocusRelative := CallbackCreate(GetMethod(implObj, "getRange_FocusRelative"), flags, 6)
        this.vtbl.get_IrisRelative := CallbackCreate(GetMethod(implObj, "get_IrisRelative"), flags, 3)
        this.vtbl.put_IrisRelative := CallbackCreate(GetMethod(implObj, "put_IrisRelative"), flags, 3)
        this.vtbl.getRange_IrisRelative := CallbackCreate(GetMethod(implObj, "getRange_IrisRelative"), flags, 6)
        this.vtbl.get_ZoomRelative := CallbackCreate(GetMethod(implObj, "get_ZoomRelative"), flags, 3)
        this.vtbl.put_ZoomRelative := CallbackCreate(GetMethod(implObj, "put_ZoomRelative"), flags, 3)
        this.vtbl.getRange_ZoomRelative := CallbackCreate(GetMethod(implObj, "getRange_ZoomRelative"), flags, 6)
        this.vtbl.get_PanRelative := CallbackCreate(GetMethod(implObj, "get_PanRelative"), flags, 3)
        this.vtbl.put_PanRelative := CallbackCreate(GetMethod(implObj, "put_PanRelative"), flags, 3)
        this.vtbl.get_TiltRelative := CallbackCreate(GetMethod(implObj, "get_TiltRelative"), flags, 3)
        this.vtbl.put_TiltRelative := CallbackCreate(GetMethod(implObj, "put_TiltRelative"), flags, 3)
        this.vtbl.getRange_TiltRelative := CallbackCreate(GetMethod(implObj, "getRange_TiltRelative"), flags, 6)
        this.vtbl.get_PanTiltRelative := CallbackCreate(GetMethod(implObj, "get_PanTiltRelative"), flags, 4)
        this.vtbl.put_PanTiltRelative := CallbackCreate(GetMethod(implObj, "put_PanTiltRelative"), flags, 4)
        this.vtbl.getRange_PanRelative := CallbackCreate(GetMethod(implObj, "getRange_PanRelative"), flags, 6)
        this.vtbl.get_RollRelative := CallbackCreate(GetMethod(implObj, "get_RollRelative"), flags, 3)
        this.vtbl.put_RollRelative := CallbackCreate(GetMethod(implObj, "put_RollRelative"), flags, 3)
        this.vtbl.getRange_RollRelative := CallbackCreate(GetMethod(implObj, "getRange_RollRelative"), flags, 6)
        this.vtbl.get_ScanMode := CallbackCreate(GetMethod(implObj, "get_ScanMode"), flags, 3)
        this.vtbl.put_ScanMode := CallbackCreate(GetMethod(implObj, "put_ScanMode"), flags, 3)
        this.vtbl.get_PrivacyMode := CallbackCreate(GetMethod(implObj, "get_PrivacyMode"), flags, 3)
        this.vtbl.put_PrivacyMode := CallbackCreate(GetMethod(implObj, "put_PrivacyMode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Exposure)
        CallbackFree(this.vtbl.put_Exposure)
        CallbackFree(this.vtbl.getRange_Exposure)
        CallbackFree(this.vtbl.get_Focus)
        CallbackFree(this.vtbl.put_Focus)
        CallbackFree(this.vtbl.getRange_Focus)
        CallbackFree(this.vtbl.get_Iris)
        CallbackFree(this.vtbl.put_Iris)
        CallbackFree(this.vtbl.getRange_Iris)
        CallbackFree(this.vtbl.get_Zoom)
        CallbackFree(this.vtbl.put_Zoom)
        CallbackFree(this.vtbl.getRange_Zoom)
        CallbackFree(this.vtbl.get_FocalLengths)
        CallbackFree(this.vtbl.get_Pan)
        CallbackFree(this.vtbl.put_Pan)
        CallbackFree(this.vtbl.getRange_Pan)
        CallbackFree(this.vtbl.get_Tilt)
        CallbackFree(this.vtbl.put_Tilt)
        CallbackFree(this.vtbl.getRange_Tilt)
        CallbackFree(this.vtbl.get_PanTilt)
        CallbackFree(this.vtbl.put_PanTilt)
        CallbackFree(this.vtbl.get_Roll)
        CallbackFree(this.vtbl.put_Roll)
        CallbackFree(this.vtbl.getRange_Roll)
        CallbackFree(this.vtbl.get_ExposureRelative)
        CallbackFree(this.vtbl.put_ExposureRelative)
        CallbackFree(this.vtbl.getRange_ExposureRelative)
        CallbackFree(this.vtbl.get_FocusRelative)
        CallbackFree(this.vtbl.put_FocusRelative)
        CallbackFree(this.vtbl.getRange_FocusRelative)
        CallbackFree(this.vtbl.get_IrisRelative)
        CallbackFree(this.vtbl.put_IrisRelative)
        CallbackFree(this.vtbl.getRange_IrisRelative)
        CallbackFree(this.vtbl.get_ZoomRelative)
        CallbackFree(this.vtbl.put_ZoomRelative)
        CallbackFree(this.vtbl.getRange_ZoomRelative)
        CallbackFree(this.vtbl.get_PanRelative)
        CallbackFree(this.vtbl.put_PanRelative)
        CallbackFree(this.vtbl.get_TiltRelative)
        CallbackFree(this.vtbl.put_TiltRelative)
        CallbackFree(this.vtbl.getRange_TiltRelative)
        CallbackFree(this.vtbl.get_PanTiltRelative)
        CallbackFree(this.vtbl.put_PanTiltRelative)
        CallbackFree(this.vtbl.getRange_PanRelative)
        CallbackFree(this.vtbl.get_RollRelative)
        CallbackFree(this.vtbl.put_RollRelative)
        CallbackFree(this.vtbl.getRange_RollRelative)
        CallbackFree(this.vtbl.get_ScanMode)
        CallbackFree(this.vtbl.put_ScanMode)
        CallbackFree(this.vtbl.get_PrivacyMode)
        CallbackFree(this.vtbl.put_PrivacyMode)
    }
}
