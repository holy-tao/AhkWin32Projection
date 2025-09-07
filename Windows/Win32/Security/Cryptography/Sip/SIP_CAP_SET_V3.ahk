#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SIP_CAP_SET_V3 structure defines the capabilities of a subject interface package (SIP). (SIP_CAP_SET_V3 structure)
 * @see https://learn.microsoft.com/windows/win32/api/mssip/ns-mssip-sip_cap_set_v3
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class SIP_CAP_SET_V3 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The SIP version. By default, this value is two (2).
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A value of one (1) indicates that the SIP supports multiple embedded signatures. Otherwise, set this value to zero (0).
     * @type {Integer}
     */
    isMultiSign {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
