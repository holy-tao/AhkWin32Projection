#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates a spoofed device scale factor, as a percent. Used by IApplicationDesignModeSettings::SetApplicationViewState and IApplicationDesignModeSettings::IsApplicationViewStateSupported.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-device_scale_factor
 * @namespace Windows.Win32.UI.Shell.Common
 */
class DEVICE_SCALE_FACTOR extends Win32Enum {

    /**
     * Native name: DEVICE_SCALE_FACTOR_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * 100%. The scale factor for the device is 1x.
     * Native name: SCALE_100_PERCENT
     * @type {Integer (Int32)}
     */
    static 100_PERCENT => 100

    /**
     * 120%. The scale factor for the device is 1.2x.
     * Native name: SCALE_120_PERCENT
     * @type {Integer (Int32)}
     */
    static 120_PERCENT => 120

    /**
     * Native name: SCALE_125_PERCENT
     * @type {Integer (Int32)}
     */
    static 125_PERCENT => 125

    /**
     * 140%. The scale factor for the device is 1.4x.
     * Native name: SCALE_140_PERCENT
     * @type {Integer (Int32)}
     */
    static 140_PERCENT => 140

    /**
     * 150%. The scale factor for the device is 1.5x.
     * Native name: SCALE_150_PERCENT
     * @type {Integer (Int32)}
     */
    static 150_PERCENT => 150

    /**
     * 160%. The scale factor for the device is 1.6x.
     * Native name: SCALE_160_PERCENT
     * @type {Integer (Int32)}
     */
    static 160_PERCENT => 160

    /**
     * Native name: SCALE_175_PERCENT
     * @type {Integer (Int32)}
     */
    static 175_PERCENT => 175

    /**
     * 180%. The scale factor for the device is 1.8x.
     * Native name: SCALE_180_PERCENT
     * @type {Integer (Int32)}
     */
    static 180_PERCENT => 180

    /**
     * Native name: SCALE_200_PERCENT
     * @type {Integer (Int32)}
     */
    static 200_PERCENT => 200

    /**
     * 225%. The scale factor for the device is 2.25x.
     * Native name: SCALE_225_PERCENT
     * @type {Integer (Int32)}
     */
    static 225_PERCENT => 225

    /**
     * Native name: SCALE_250_PERCENT
     * @type {Integer (Int32)}
     */
    static 250_PERCENT => 250

    /**
     * Native name: SCALE_300_PERCENT
     * @type {Integer (Int32)}
     */
    static 300_PERCENT => 300

    /**
     * Native name: SCALE_350_PERCENT
     * @type {Integer (Int32)}
     */
    static 350_PERCENT => 350

    /**
     * Native name: SCALE_400_PERCENT
     * @type {Integer (Int32)}
     */
    static 400_PERCENT => 400

    /**
     * Native name: SCALE_450_PERCENT
     * @type {Integer (Int32)}
     */
    static 450_PERCENT => 450

    /**
     * Native name: SCALE_500_PERCENT
     * @type {Integer (Int32)}
     */
    static 500_PERCENT => 500
}
