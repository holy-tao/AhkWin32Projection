#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains private key information needed to authenticate a client or server.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-sch_cred_secret_privkey
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCH_CRED_SECRET_PRIVKEY {
    #StructPack 8

    /**
     * Must always be set to SCHANNEL_SECRET_PRIVKEY.
     */
    dwType : UInt32

    /**
     * Pointer to an encrypted private key.
     */
    pPrivateKey : IntPtr

    /**
     * Number of bytes in the encrypted private key.
     */
    cbPrivateKey : UInt32

    /**
     * Pointer to a null-terminated string that Schannel uses to decrypt the private key.
     */
    pszPassword : PSTR

}
