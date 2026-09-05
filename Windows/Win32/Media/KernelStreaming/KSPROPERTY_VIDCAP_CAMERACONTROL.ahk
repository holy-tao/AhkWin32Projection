#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_CAMERACONTROL extends Win32Enum {

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PAN
     * @type {Integer (Int32)}
     */
    static PAN => 0

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_TILT
     * @type {Integer (Int32)}
     */
    static TILT => 1

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_ROLL
     * @type {Integer (Int32)}
     */
    static ROLL => 2

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_ZOOM
     * @type {Integer (Int32)}
     */
    static ZOOM => 3

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXPOSURE
     * @type {Integer (Int32)}
     */
    static EXPOSURE => 4

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_IRIS
     * @type {Integer (Int32)}
     */
    static IRIS => 5

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_FOCUS
     * @type {Integer (Int32)}
     */
    static FOCUS => 6

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_SCANMODE
     * @type {Integer (Int32)}
     */
    static SCANMODE => 7

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PRIVACY
     * @type {Integer (Int32)}
     */
    static PRIVACY => 8

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PANTILT
     * @type {Integer (Int32)}
     */
    static PANTILT => 9

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PAN_RELATIVE
     * @type {Integer (Int32)}
     */
    static PAN_RELATIVE => 10

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_TILT_RELATIVE
     * @type {Integer (Int32)}
     */
    static TILT_RELATIVE => 11

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_ROLL_RELATIVE
     * @type {Integer (Int32)}
     */
    static ROLL_RELATIVE => 12

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_ZOOM_RELATIVE
     * @type {Integer (Int32)}
     */
    static ZOOM_RELATIVE => 13

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_EXPOSURE_RELATIVE
     * @type {Integer (Int32)}
     */
    static EXPOSURE_RELATIVE => 14

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_IRIS_RELATIVE
     * @type {Integer (Int32)}
     */
    static IRIS_RELATIVE => 15

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_FOCUS_RELATIVE
     * @type {Integer (Int32)}
     */
    static FOCUS_RELATIVE => 16

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_PANTILT_RELATIVE
     * @type {Integer (Int32)}
     */
    static PANTILT_RELATIVE => 17

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_FOCAL_LENGTH
     * @type {Integer (Int32)}
     */
    static FOCAL_LENGTH => 18

    /**
     * Native name: KSPROPERTY_CAMERACONTROL_AUTO_EXPOSURE_PRIORITY
     * @type {Integer (Int32)}
     */
    static AUTO_EXPOSURE_PRIORITY => 19
}
