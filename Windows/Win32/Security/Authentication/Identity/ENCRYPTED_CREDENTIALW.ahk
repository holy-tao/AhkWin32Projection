#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Credentials\CREDENTIAL_ATTRIBUTEW.ahk" { CREDENTIAL_ATTRIBUTEW }
#Import "..\..\Credentials\CRED_PERSIST.ahk" { CRED_PERSIST }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Credentials\CRED_FLAGS.ahk" { CRED_FLAGS }
#Import "..\..\Credentials\CREDENTIALW.ahk" { CREDENTIALW }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Credentials\CRED_TYPE.ahk" { CRED_TYPE }

/**
 * Represents an encrypted credential.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-encrypted_credentialw
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct ENCRYPTED_CREDENTIALW {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincred/ns-wincred-credentiala">CREDENTIAL</a> structure that contains the encrypted credential.
     */
    Cred : CREDENTIALW

    /**
     * The size, in bytes, of the unencrypted credential.
     */
    ClearCredentialBlobSize : UInt32

}
