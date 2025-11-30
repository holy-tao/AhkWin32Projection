#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the ACP protection level.
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ne-dxva9typ-copp_acp_protection_level
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class COPP_ACP_Protection_Level extends Win32Enum{

    /**
     * Level 0.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_Level0 => 0

    /**
     * Minimum ACP level. Equivalent to <b>COPP_ACP_Level0</b>.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_LevelMin => 0

    /**
     * Level 1.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_Level1 => 1

    /**
     * Level 2.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_Level2 => 2

    /**
     * Level 3.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_Level3 => 3

    /**
     * Maximum ACP level. Equivalent to <b>COPP_ACP_Level3</b>.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_LevelMax => 3

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static COPP_ACP_ForceDWORD => 2147483647
}
