#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_TRUST_LIST_INFO structure that indicates valid usage of a CTL.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_trust_list_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_TRUST_LIST_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a structure that includes a subject identifier, the count of attributes associated with a CTL, and an array of those attributes.
     * @type {Pointer<CTL_ENTRY>}
     */
    pCtlEntry {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a CTL context.
     * @type {Pointer<CTL_CONTEXT>}
     */
    pCtlContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
