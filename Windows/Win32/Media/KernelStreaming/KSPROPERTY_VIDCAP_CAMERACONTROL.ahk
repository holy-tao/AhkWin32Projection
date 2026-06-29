#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_VIDCAP_CAMERACONTROL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PAN => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_TILT => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_ROLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_ZOOM => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_EXPOSURE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_IRIS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FOCUS => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_SCANMODE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PRIVACY => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PANTILT => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PAN_RELATIVE => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_TILT_RELATIVE => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_ROLL_RELATIVE => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_ZOOM_RELATIVE => 13

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_EXPOSURE_RELATIVE => 14

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_IRIS_RELATIVE => 15

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FOCUS_RELATIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_PANTILT_RELATIVE => 17

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_FOCAL_LENGTH => 18

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_CAMERACONTROL_AUTO_EXPOSURE_PRIORITY => 19
}
