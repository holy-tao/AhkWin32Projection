#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Enables you to specify custom functions that can be used to allocate and free data.
 * @see https://learn.microsoft.com/windows/win32/api/ncrypt/ns-ncrypt-ncrypt_alloc_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class NCRYPT_ALLOC_PARA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Address of a custom function that can allocate memory.
     * @type {Pointer<PFN_NCRYPT_ALLOC>}
     */
    pfnAlloc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Address of a function that can free memory allocated by the function specified by the <b>pfnAlloc</b> member.
     * @type {Pointer<PFN_NCRYPT_FREE>}
     */
    pfnFree {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
