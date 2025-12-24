#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class KD_OPTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KD_OPTION_SET_BLOCK_ENABLE => 0
}
