#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds the negotiated security package keys.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcontext_negokeys
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_NegoKeys {
    #StructPack 8

    /**
     * The key type.
     */
    KeyType : UInt32

    /**
     * The length of the key, in bytes.
     */
    KeyLength : UInt16

    /**
     * The key value.
     */
    KeyValue : IntPtr

    /**
     * The key type for the verification key.
     */
    VerifyKeyType : UInt32

    /**
     * The length of the verification key, in bytes.
     */
    VerifyKeyLength : UInt16

    /**
     * The verification key value.
     */
    VerifyKeyValue : IntPtr

}
