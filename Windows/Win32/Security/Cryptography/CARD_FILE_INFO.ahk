#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CARD_FILE_ACCESS_CONDITION.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class CARD_FILE_INFO extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbFileSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {CARD_FILE_ACCESS_CONDITION}
     */
    AccessCondition {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
