#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DRIVERVERSION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_1_0 => 1000

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_1_1_PRERELEASE => 1102

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_1_1 => 1105

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_1_2 => 1200

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_1_3 => 1300

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_0 => 2000

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_1 => 2100

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_2 => 2200

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_3 => 2300

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_4 => 2400

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_5 => 2500

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_6 => 2600

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_7 => 2700

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_8 => 2800

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_2_9 => 2900

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_3_0 => 3000

    /**
     * @type {Integer (Int32)}
     */
    static KMT_DRIVERVERSION_WDDM_3_1 => 3100
}
