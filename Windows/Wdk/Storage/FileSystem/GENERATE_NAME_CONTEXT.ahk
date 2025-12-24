#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class GENERATE_NAME_CONTEXT extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Checksum {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    ChecksumInserted {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    NameLength {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {String}
     */
    NameBuffer {
        get => StrGet(this.ptr + 4, 7, "UTF-16")
        set => StrPut(value, this.ptr + 4, 7, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ExtensionLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {String}
     */
    ExtensionBuffer {
        get => StrGet(this.ptr + 24, 3, "UTF-16")
        set => StrPut(value, this.ptr + 24, 3, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    LastIndexValue {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
