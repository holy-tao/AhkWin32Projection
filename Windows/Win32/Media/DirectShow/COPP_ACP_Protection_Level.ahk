#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ACP protection level.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ne-dxva9typ-copp_acp_protection_level
 * @namespace Windows.Win32.Media.DirectShow
 */
class COPP_ACP_Protection_Level extends Win32Enum {

    /**
     * Level 0.
     * Native name: COPP_ACP_Level0
     * @type {Integer (Int32)}
     */
    static Level0 => 0

    /**
     * Minimum ACP level. Equivalent to <b>COPP_ACP_Level0</b>.
     * Native name: COPP_ACP_LevelMin
     * @type {Integer (Int32)}
     */
    static Min => 0

    /**
     * Level 1.
     * Native name: COPP_ACP_Level1
     * @type {Integer (Int32)}
     */
    static Level1 => 1

    /**
     * Level 2.
     * Native name: COPP_ACP_Level2
     * @type {Integer (Int32)}
     */
    static Level2 => 2

    /**
     * Level 3.
     * Native name: COPP_ACP_Level3
     * @type {Integer (Int32)}
     */
    static Level3 => 3

    /**
     * Maximum ACP level. Equivalent to <b>COPP_ACP_Level3</b>.
     * Native name: COPP_ACP_LevelMax
     * @type {Integer (Int32)}
     */
    static Max => 3

    /**
     * Reserved.
     * Native name: COPP_ACP_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
