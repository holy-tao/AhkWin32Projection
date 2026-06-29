#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSV1_0_CREDENTIAL_KEY_TYPE.ahk" { MSV1_0_CREDENTIAL_KEY_TYPE }
#Import ".\MSV1_0_CREDENTIAL_KEY.ahk" { MSV1_0_CREDENTIAL_KEY }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_REMOTE_SUPPLEMENTAL_CREDENTIAL {
    #StructPack 4

    Version : UInt32

    Flags : UInt32

    CredentialKey : MSV1_0_CREDENTIAL_KEY

    CredentialKeyType : MSV1_0_CREDENTIAL_KEY_TYPE

    EncryptedCredsSize : UInt32

    EncryptedCreds : Int8[1]

}
