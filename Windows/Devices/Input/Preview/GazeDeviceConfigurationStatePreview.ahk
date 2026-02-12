#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the possible configuration states of an eye-tracking device.
 * @remarks
 * Use these values to confirm that the eye-tracking device is calibrated and ready to send gaze input events and data.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.preview.gazedeviceconfigurationstatepreview
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GazeDeviceConfigurationStatePreview extends Win32Enum{

    /**
     * The eye-tracker device state is unknown. Calibration might resolve this state.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The eye-tracker device is ready to start eye and head tracking.
     * @type {Integer (Int32)}
     */
    static Ready => 1

    /**
     * The eye-tracker device is currently being configured.
     * @type {Integer (Int32)}
     */
    static Configuring => 2

    /**
     * The display device is not configured correctly. Calibration might resolve this state.
     * @type {Integer (Int32)}
     */
    static ScreenSetupNeeded => 3

    /**
     * The eye-tracker device needs to be calibrated.
     * @type {Integer (Int32)}
     */
    static UserCalibrationNeeded => 4
}
