#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the parameters that are passed in for EV policy validation. Applications use this structure to pass hints to the API that indicate which of the policy qualifier flags of the extended validation certificates are important to the application.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-ev_extra_cert_chain_policy_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class EV_EXTRA_CERT_CHAIN_POLICY_PARA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwRootProgramQualifierFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
