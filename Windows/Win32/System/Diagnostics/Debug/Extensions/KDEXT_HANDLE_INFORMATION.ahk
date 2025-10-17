#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class KDEXT_HANDLE_INFORMATION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    HandleTableEntry {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Handle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Object {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ObjectBody {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    GrantedAccess {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    HandleAttributes {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {BOOLEAN}
     */
    PagedOut {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }
}
