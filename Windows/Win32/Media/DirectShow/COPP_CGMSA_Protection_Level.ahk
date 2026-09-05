#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the CGMS-A protection level.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_cgmsa_protection_level
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_CGMSA_Protection_Level extends Win32Enum {

    /**
     * CGMS-A is disabled.
     * Native name: COPP_CGMSA_Disabled
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Minimum CGMS-A level. Equivalent to <b>COPP_CGMSA_Disabled</b>.
     * Native name: COPP_CGMSA_LevelMin
     * @type {Integer (Int32)}
     */
    static Min => 0

    /**
     * The protection level is Copy Freely.
     * Native name: COPP_CGMSA_CopyFreely
     * @type {Integer (Int32)}
     */
    static CopyFreely => 1

    /**
     * The protection level is Copy No More.
     * Native name: COPP_CGMSA_CopyNoMore
     * @type {Integer (Int32)}
     */
    static CopyNoMore => 2

    /**
     * The protection level is Copy One Generation.
     * Native name: COPP_CGMSA_CopyOneGeneration
     * @type {Integer (Int32)}
     */
    static CopyOneGeneration => 3

    /**
     * The protection level is Copy Never.
     * Native name: COPP_CGMSA_CopyNever
     * @type {Integer (Int32)}
     */
    static CopyNever => 4

    /**
     * Redistribution control (or <i>broadcast flag</i>) is required. This flag can be combined with the other flags.
     * Native name: COPP_CGMSA_RedistributionControlRequired
     * @type {Integer (Int32)}
     */
    static RedistributionControlRequired => 8

    /**
     * Maximum CGMS-A level.
     * Native name: COPP_CGMSA_LevelMax
     * @type {Integer (Int32)}
     */
    static Max => 12

    /**
     * Reserved.
     * Native name: COPP_CGMSA_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
