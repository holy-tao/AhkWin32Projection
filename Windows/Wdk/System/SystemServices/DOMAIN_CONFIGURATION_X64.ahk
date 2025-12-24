#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DOMAIN_CONFIGURATION_X64 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FirstLevelPageTableRoot {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    TranslationEnabled {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
