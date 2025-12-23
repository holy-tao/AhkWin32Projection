#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates a spoofed device scale factor, as a percent. Used by IApplicationDesignModeSettings::SetApplicationViewState and IApplicationDesignModeSettings::IsApplicationViewStateSupported.
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-device_scale_factor
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class DEVICE_SCALE_FACTOR extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DEVICE_SCALE_FACTOR_INVALID => 0

    /**
     * 100%. The scale factor for the device is 1x.
     * @type {Integer (Int32)}
     */
    static SCALE_100_PERCENT => 100

    /**
     * 120%. The scale factor for the device is 1.2x.
     * @type {Integer (Int32)}
     */
    static SCALE_120_PERCENT => 120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_125_PERCENT => 125

    /**
     * 140%. The scale factor for the device is 1.4x.
     * @type {Integer (Int32)}
     */
    static SCALE_140_PERCENT => 140

    /**
     * 150%. The scale factor for the device is 1.5x.
     * @type {Integer (Int32)}
     */
    static SCALE_150_PERCENT => 150

    /**
     * 160%. The scale factor for the device is 1.6x.
     * @type {Integer (Int32)}
     */
    static SCALE_160_PERCENT => 160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_175_PERCENT => 175

    /**
     * 180%. The scale factor for the device is 1.8x.
     * @type {Integer (Int32)}
     */
    static SCALE_180_PERCENT => 180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_200_PERCENT => 200

    /**
     * 225%. The scale factor for the device is 2.25x.
     * @type {Integer (Int32)}
     */
    static SCALE_225_PERCENT => 225

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_250_PERCENT => 250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_300_PERCENT => 300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_350_PERCENT => 350

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_400_PERCENT => 400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_450_PERCENT => 450

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SCALE_500_PERCENT => 500
}
