#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MF_CAMERA_CONTROL_RANGE_INFO structure represents the accepted range, step value, and default value for a camera control.
 * @remarks
 * The legacy [PROPSETID_VIDCAP_VIDEOPROCAMP](/windows-hardware/drivers/stream/propsetid-vidcap-videoprocamp) and [PROPSETID_VIDCAP_CAMERACONTROL](/windows-hardware/drivers/stream/propsetid-vidcap-cameracontrol) control sets provide an allowed range and step value of with which a control can be configured, as well as a default value. For other controls, the caller is responsible for knowing whether the underlying control supports the basic range information.  
 * 
 * Retrieve the range information for a control by calling [IMFCameraControlDefaults::GetRangeInfo](ns-mfidl-mf_camera_control_range_info.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-mf_camera_control_range_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAMERA_CONTROL_RANGE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The minimum value supported by the control.
     * @type {Integer}
     */
    minValue {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The maximum value supported by the control.
     * @type {Integer}
     */
    maxValue {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The incremental step value supported by the control.
     * @type {Integer}
     */
    stepValue {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The default value for the control.
     * @type {Integer}
     */
    defaultValue {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
