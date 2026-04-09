#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\UNICODE_PREFIX_TABLE_ENTRY.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class UNICODE_PREFIX_TABLE_ENTRY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NodeTypeCode {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NameLength {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }

    /**
     * @type {Pointer<UNICODE_PREFIX_TABLE_ENTRY>}
     */
    NextPrefixTree {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<UNICODE_PREFIX_TABLE_ENTRY>}
     */
    CaseMatch {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    Links {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<UNICODE_STRING>}
     */
    Prefix {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
