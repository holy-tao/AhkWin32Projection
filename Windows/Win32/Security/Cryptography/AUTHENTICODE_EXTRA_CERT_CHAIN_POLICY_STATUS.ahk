#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS structure holds additional Authenticode policy information for chain verification of files.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-authenticode_extra_cert_chain_policy_status
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS extends Win32Struct
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
     * BOOL flag. If <b>TRUE</b>, a signer has been verified by a CA as meeting certain minimum financial standards.
     * @type {BOOL}
     */
    fCommercial {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
