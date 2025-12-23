#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAW_INPUT_DATA_COMMAND_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RID_HEADER => 268435461

    /**
     * @type {Integer (UInt32)}
     */
    static RID_INPUT => 268435459
}
