#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS structure holds additional Authenticode policy information for chain verification of files.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-authenticode_extra_cert_chain_policy_status
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS {
    #StructPack 4

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * BOOL flag. If <b>TRUE</b>, a signer has been verified by a CA as meeting certain minimum financial standards.
     */
    fCommercial : BOOL

}
