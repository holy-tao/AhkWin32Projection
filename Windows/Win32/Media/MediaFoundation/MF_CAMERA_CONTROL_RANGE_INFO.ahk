#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MF_CAMERA_CONTROL_RANGE_INFO structure represents the accepted range, step value, and default value for a camera control.
 * @remarks
 * The legacy [PROPSETID_VIDCAP_VIDEOPROCAMP](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp) and [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) control sets provide an allowed range and step value of with which a control can be configured, as well as a default value. For other controls, the caller is responsible for knowing whether the underlying control supports the basic range information.  
 * 
 * Retrieve the range information for a control by calling [IMFCameraControlDefaults::GetRangeInfo](ns-mfidl-mf_camera_control_range_info.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_camera_control_range_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CAMERA_CONTROL_RANGE_INFO {
    #StructPack 4

    /**
     * The minimum value supported by the control.
     */
    minValue : Int32

    /**
     * The maximum value supported by the control.
     */
    maxValue : Int32

    /**
     * The incremental step value supported by the control.
     */
    stepValue : Int32

    /**
     * The default value for the control.
     */
    defaultValue : Int32

}
