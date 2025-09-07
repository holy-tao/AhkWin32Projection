#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CONTAINER_MAP_RECORD extends Win32Struct
{
    static sizeof => 86

    static packingSize => 2

    /**
     * @type {String}
     */
    wszGuid {
        get => StrGet(this.ptr + 0, 39, "UTF-16")
        set => StrPut(value, this.ptr + 0, 39, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    bFlags {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    bReserved {
        get => NumGet(this, 81, "char")
        set => NumPut("char", value, this, 81)
    }

    /**
     * @type {Integer}
     */
    wSigKeySizeBits {
        get => NumGet(this, 82, "ushort")
        set => NumPut("ushort", value, this, 82)
    }

    /**
     * @type {Integer}
     */
    wKeyExchangeKeySizeBits {
        get => NumGet(this, 84, "ushort")
        set => NumPut("ushort", value, this, 84)
    }
}
