#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the configuration type of a camera control.
 * @remarks
 * Some sensor-level controls can only be set after the sensor has started (such as focus/brightness/whitebalance) since the controls require frame data for the parameters to converge. Other types of controls, such as HDR support, can only be configured when the sensor is not in a running state because it requires a re-programming of the sensor mode. Whether a well known control is pre or post start is specified in the DDI specification of the control. If the DDI specification does not explicitly indicate the a control is a pre-start control, the caller should assume the control is post-start.  
 * 
 * Retrieve the configuration type of a control by calling [IMFCameraControlDefaults::GetType](ne-mfidl-mf_camera_control_configuration_type.md).
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_camera_control_configuration_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_CAMERA_CONTROL_CONFIGURATION_TYPE extends Win32Enum{

    /**
     * The camera control must be configured before streaming begins.
     * @type {Integer (Int32)}
     */
    static MF_CAMERA_CONTROL_CONFIGURATION_TYPE_PRESTART => 0

    /**
     * The camera control must be  configured after streaming has started.
     * @type {Integer (Int32)}
     */
    static MF_CAMERA_CONTROL_CONFIGURATION_TYPE_POSTSTART => 1
}
