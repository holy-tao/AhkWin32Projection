#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_BAND_CLASS enumerated type defines the frequency band classes.
 * @remarks
 * These  values are used by the <b>gsmBandClass</b> and <b>cdmaBandClass</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a> structure.  The meanings are dependent upon which member is using them and are detailed in the structure documentation
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_band_class
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_BAND_CLASS extends Win32Enum {

    /**
     * Unknown band class.
     * Native name: MBN_BAND_CLASS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Band class 0.
     * Native name: MBN_BAND_CLASS_0
     * @type {Integer (Int32)}
     */
    static 0 => 1

    /**
     * Band class 1.
     * Native name: MBN_BAND_CLASS_I
     * @type {Integer (Int32)}
     */
    static I => 2

    /**
     * Band class 2.
     * Native name: MBN_BAND_CLASS_II
     * @type {Integer (Int32)}
     */
    static II => 4

    /**
     * Band class 3.
     * Native name: MBN_BAND_CLASS_III
     * @type {Integer (Int32)}
     */
    static III => 8

    /**
     * Band class 4.
     * Native name: MBN_BAND_CLASS_IV
     * @type {Integer (Int32)}
     */
    static IV => 16

    /**
     * Band class 5.
     * Native name: MBN_BAND_CLASS_V
     * @type {Integer (Int32)}
     */
    static V => 32

    /**
     * Band class 6.
     * Native name: MBN_BAND_CLASS_VI
     * @type {Integer (Int32)}
     */
    static VI => 64

    /**
     * Band class 7.
     * Native name: MBN_BAND_CLASS_VII
     * @type {Integer (Int32)}
     */
    static VII => 128

    /**
     * Band class 8.
     * Native name: MBN_BAND_CLASS_VIII
     * @type {Integer (Int32)}
     */
    static VIII => 256

    /**
     * Band class 9.
     * Native name: MBN_BAND_CLASS_IX
     * @type {Integer (Int32)}
     */
    static IX => 512

    /**
     * Band class 10.
     * Native name: MBN_BAND_CLASS_X
     * @type {Integer (Int32)}
     */
    static X => 1024

    /**
     * Band class 11.
     * Native name: MBN_BAND_CLASS_XI
     * @type {Integer (Int32)}
     */
    static XI => 2048

    /**
     * Band class 12.
     * Native name: MBN_BAND_CLASS_XII
     * @type {Integer (Int32)}
     */
    static XII => 4096

    /**
     * Band class 13.
     * Native name: MBN_BAND_CLASS_XIII
     * @type {Integer (Int32)}
     */
    static XIII => 8192

    /**
     * Band class 14.
     * Native name: MBN_BAND_CLASS_XIV
     * @type {Integer (Int32)}
     */
    static XIV => 16384

    /**
     * Band class 15.
     * Native name: MBN_BAND_CLASS_XV
     * @type {Integer (Int32)}
     */
    static XV => 32768

    /**
     * Band class 16.
     * Native name: MBN_BAND_CLASS_XVI
     * @type {Integer (Int32)}
     */
    static XVI => 65536

    /**
     * Band class 17.
     * Native name: MBN_BAND_CLASS_XVII
     * @type {Integer (Int32)}
     */
    static XVII => 131072

    /**
     * Custom band class.
     * Native name: MBN_BAND_CLASS_CUSTOM
     * @type {Integer (Int32)}
     */
    static CUSTOM => -2147483648
}
