#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SERVER_OCSP_RESPONSE_OPEN_PARA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pcbUsedSize {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszOcspDirectory {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<PFN_CERT_SERVER_OCSP_RESPONSE_UPDATE_CALLBACK>}
     */
    pfnUpdateCallback {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvUpdateCallbackArg {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
