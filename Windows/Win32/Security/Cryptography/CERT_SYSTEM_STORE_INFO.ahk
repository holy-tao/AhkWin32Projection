#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_SYSTEM_STORE_INFO structure contains information used by functions that work with system stores. Currently, no essential information is contained in this structure.
 * @remarks
 * Currently, no system store information is persisted.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_system_store_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SYSTEM_STORE_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 4
    }
}
