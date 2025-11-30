#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_PROTECTION_STANDARD extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_OTHER => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_IEC61880_525I => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_IEC61880_2_525I => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_IEC62375_625P => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_EIA608B_525 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_EN300294_625I => 16

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_CEA805A_TYPEA_525P => 32

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_CEA805A_TYPEA_750P => 64

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_CEA805A_TYPEA_1125I => 128

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_CEA805A_TYPEB_525P => 256

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_CEA805A_TYPEB_750P => 512

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_CEA805A_TYPEB_1125I => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_ARIBTRB15_525I => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_ARIBTRB15_525P => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_ARIBTRB15_750P => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMDT_OPM_PROTECTION_STANDARD_ARIBTRB15_1125I => 16384
}
