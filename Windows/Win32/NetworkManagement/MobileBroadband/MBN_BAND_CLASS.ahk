#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_BAND_CLASS enumerated type defines the frequency band classes.
 * @remarks
 * 
 * These  values are used by the <b>gsmBandClass</b> and <b>cdmaBandClass</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure.  The meanings are dependent upon which member is using them and are detailed in the structure documentation
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/ne-mbnapi-mbn_band_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_BAND_CLASS extends Win32Enum{

    /**
     * Unknown band class.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_NONE => 0

    /**
     * Band class 0.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_0 => 1

    /**
     * Band class 1.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_I => 2

    /**
     * Band class 2.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_II => 4

    /**
     * Band class 3.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_III => 8

    /**
     * Band class 4.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_IV => 16

    /**
     * Band class 5.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_V => 32

    /**
     * Band class 6.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_VI => 64

    /**
     * Band class 7.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_VII => 128

    /**
     * Band class 8.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_VIII => 256

    /**
     * Band class 9.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_IX => 512

    /**
     * Band class 10.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_X => 1024

    /**
     * Band class 11.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XI => 2048

    /**
     * Band class 12.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XII => 4096

    /**
     * Band class 13.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XIII => 8192

    /**
     * Band class 14.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XIV => 16384

    /**
     * Band class 15.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XV => 32768

    /**
     * Band class 16.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XVI => 65536

    /**
     * Band class 17.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_XVII => 131072

    /**
     * Custom band class.
     * @type {Integer (Int32)}
     */
    static MBN_BAND_CLASS_CUSTOM => -2147483648
}
