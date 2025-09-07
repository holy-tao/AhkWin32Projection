#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines a list of TV protection standards for Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_TVProtectionStandard{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_Unknown => -2147483648

    /**
     * Unknown.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_None => 0

    /**
     * IEC 61880, 525i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_IEC61880_525i => 1

    /**
     * IEC 61880-2, 525i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_IEC61880_2_525i => 2

    /**
     * IEC 62375, 625p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_IEC62375_625p => 4

    /**
     * EIA/CEA-608-B, 525i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_EIA608B_525 => 8

    /**
     * ETSI EN 300 294, 625i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_EN300294_625i => 16

    /**
     * CEA-805-A Type A, 525p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_CEA805A_TypeA_525p => 32

    /**
     * CEA-805-A Type A, 750p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_CEA805A_TypeA_750p => 64

    /**
     * CEA-805-A Type A, 1125i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_CEA805A_TypeA_1125i => 128

    /**
     * CEA-805-A Type B, 525p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_CEA805A_TypeB_525p => 256

    /**
     * CEA-805-A Type B, 750p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_CEA805A_TypeB_750p => 512

    /**
     * CEA-805-A Type B, 1125i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_CEA805A_TypeB_1125i => 1024

    /**
     * ARIB TR-B15, 525i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_ARIBTRB15_525i => 2048

    /**
     * ARIB TR-B15, 525p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_ARIBTRB15_525p => 4096

    /**
     * ARIB TR-B15, 750p.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_ARIBTRB15_750p => 8192

    /**
     * ARIB TR-B15, 1125i.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_ARIBTRB15_1125i => 16384

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_Mask => -2147450881

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_ProtectionStandard_Reserved => 2147450880
}
