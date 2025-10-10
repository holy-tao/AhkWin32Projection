#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the CGMS-A protection level.
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ne-dxva9typ-copp_cgmsa_protection_level
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_CGMSA_Protection_Level{

    /**
     * CGMS-A is disabled.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_Disabled => 0

    /**
     * Minimum CGMS-A level. Equivalent to <b>COPP_CGMSA_Disabled</b>.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_LevelMin => 0

    /**
     * The protection level is Copy Freely.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_CopyFreely => 1

    /**
     * The protection level is Copy No More.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_CopyNoMore => 2

    /**
     * The protection level is Copy One Generation.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_CopyOneGeneration => 3

    /**
     * The protection level is Copy Never.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_CopyNever => 4

    /**
     * Redistribution control (or <i>broadcast flag</i>) is required. This flag can be combined with the other flags.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_RedistributionControlRequired => 8

    /**
     * Maximum CGMS-A level.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_LevelMax => 12

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_CGMSA_ForceDWORD => 2147483647
}
