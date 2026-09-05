#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a list of TV protection standards for Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_TVProtectionStandard extends Win32Enum {

    /**
     * None.
     * Native name: COPP_ProtectionStandard_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => -2147483648

    /**
     * Unknown.
     * Native name: COPP_ProtectionStandard_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * IEC 61880, 525i.
     * Native name: COPP_ProtectionStandard_IEC61880_525i
     * @type {Integer (Int32)}
     */
    static IEC61880_525i => 1

    /**
     * IEC 61880-2, 525i.
     * Native name: COPP_ProtectionStandard_IEC61880_2_525i
     * @type {Integer (Int32)}
     */
    static IEC61880_2_525i => 2

    /**
     * IEC 62375, 625p.
     * Native name: COPP_ProtectionStandard_IEC62375_625p
     * @type {Integer (Int32)}
     */
    static IEC62375_625p => 4

    /**
     * EIA/CEA-608-B, 525i.
     * Native name: COPP_ProtectionStandard_EIA608B_525
     * @type {Integer (Int32)}
     */
    static EIA608B_525 => 8

    /**
     * ETSI EN 300 294, 625i.
     * Native name: COPP_ProtectionStandard_EN300294_625i
     * @type {Integer (Int32)}
     */
    static EN300294_625i => 16

    /**
     * CEA-805-A Type A, 525p.
     * Native name: COPP_ProtectionStandard_CEA805A_TypeA_525p
     * @type {Integer (Int32)}
     */
    static CEA805A_TypeA_525p => 32

    /**
     * CEA-805-A Type A, 750p.
     * Native name: COPP_ProtectionStandard_CEA805A_TypeA_750p
     * @type {Integer (Int32)}
     */
    static CEA805A_TypeA_750p => 64

    /**
     * CEA-805-A Type A, 1125i.
     * Native name: COPP_ProtectionStandard_CEA805A_TypeA_1125i
     * @type {Integer (Int32)}
     */
    static CEA805A_TypeA_1125i => 128

    /**
     * CEA-805-A Type B, 525p.
     * Native name: COPP_ProtectionStandard_CEA805A_TypeB_525p
     * @type {Integer (Int32)}
     */
    static CEA805A_TypeB_525p => 256

    /**
     * CEA-805-A Type B, 750p.
     * Native name: COPP_ProtectionStandard_CEA805A_TypeB_750p
     * @type {Integer (Int32)}
     */
    static CEA805A_TypeB_750p => 512

    /**
     * CEA-805-A Type B, 1125i.
     * Native name: COPP_ProtectionStandard_CEA805A_TypeB_1125i
     * @type {Integer (Int32)}
     */
    static CEA805A_TypeB_1125i => 1024

    /**
     * ARIB TR-B15, 525i.
     * Native name: COPP_ProtectionStandard_ARIBTRB15_525i
     * @type {Integer (Int32)}
     */
    static ARIBTRB15_525i => 2048

    /**
     * ARIB TR-B15, 525p.
     * Native name: COPP_ProtectionStandard_ARIBTRB15_525p
     * @type {Integer (Int32)}
     */
    static ARIBTRB15_525p => 4096

    /**
     * ARIB TR-B15, 750p.
     * Native name: COPP_ProtectionStandard_ARIBTRB15_750p
     * @type {Integer (Int32)}
     */
    static ARIBTRB15_750p => 8192

    /**
     * ARIB TR-B15, 1125i.
     * Native name: COPP_ProtectionStandard_ARIBTRB15_1125i
     * @type {Integer (Int32)}
     */
    static ARIBTRB15_1125i => 16384

    /**
     * Reserved.
     * Native name: COPP_ProtectionStandard_Mask
     * @type {Integer (Int32)}
     */
    static Mask => -2147450881

    /**
     * Reserved.
     * Native name: COPP_ProtectionStandard_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 2147450880
}
