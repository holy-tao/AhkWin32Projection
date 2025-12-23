#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class GROUP_NAME_SYNTAX extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_NS_SYNTAX_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_NS_SYNTAX_DCE => 3
}
