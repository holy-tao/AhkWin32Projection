#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_PROTECTION_STANDARD_TYPE extends Win32Enum {

    /**
     * Native name: OPM_PROTECTION_STANDARD_OTHER
     * @type {Integer (UInt32)}
     */
    static OTHER => 2147483648

    /**
     * Native name: OPM_PROTECTION_STANDARD_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * Native name: OPM_PROTECTION_STANDARD_IEC61880_525I
     * @type {Integer (UInt32)}
     */
    static IEC61880_525I => 1

    /**
     * Native name: OPM_PROTECTION_STANDARD_IEC61880_2_525I
     * @type {Integer (UInt32)}
     */
    static IEC61880_2_525I => 2

    /**
     * Native name: OPM_PROTECTION_STANDARD_IEC62375_625P
     * @type {Integer (UInt32)}
     */
    static IEC62375_625P => 4

    /**
     * Native name: OPM_PROTECTION_STANDARD_EIA608B_525
     * @type {Integer (UInt32)}
     */
    static EIA608B_525 => 8

    /**
     * Native name: OPM_PROTECTION_STANDARD_EN300294_625I
     * @type {Integer (UInt32)}
     */
    static EN300294_625I => 16

    /**
     * Native name: OPM_PROTECTION_STANDARD_CEA805A_TYPEA_525P
     * @type {Integer (UInt32)}
     */
    static CEA805A_TYPEA_525P => 32

    /**
     * Native name: OPM_PROTECTION_STANDARD_CEA805A_TYPEA_750P
     * @type {Integer (UInt32)}
     */
    static CEA805A_TYPEA_750P => 64

    /**
     * Native name: OPM_PROTECTION_STANDARD_CEA805A_TYPEA_1125I
     * @type {Integer (UInt32)}
     */
    static CEA805A_TYPEA_1125I => 128

    /**
     * Native name: OPM_PROTECTION_STANDARD_CEA805A_TYPEB_525P
     * @type {Integer (UInt32)}
     */
    static CEA805A_TYPEB_525P => 256

    /**
     * Native name: OPM_PROTECTION_STANDARD_CEA805A_TYPEB_750P
     * @type {Integer (UInt32)}
     */
    static CEA805A_TYPEB_750P => 512

    /**
     * Native name: OPM_PROTECTION_STANDARD_CEA805A_TYPEB_1125I
     * @type {Integer (UInt32)}
     */
    static CEA805A_TYPEB_1125I => 1024

    /**
     * Native name: OPM_PROTECTION_STANDARD_ARIBTRB15_525I
     * @type {Integer (UInt32)}
     */
    static ARIBTRB15_525I => 2048

    /**
     * Native name: OPM_PROTECTION_STANDARD_ARIBTRB15_525P
     * @type {Integer (UInt32)}
     */
    static ARIBTRB15_525P => 4096

    /**
     * Native name: OPM_PROTECTION_STANDARD_ARIBTRB15_750P
     * @type {Integer (UInt32)}
     */
    static ARIBTRB15_750P => 8192

    /**
     * Native name: OPM_PROTECTION_STANDARD_ARIBTRB15_1125I
     * @type {Integer (UInt32)}
     */
    static ARIBTRB15_1125I => 16384
}
