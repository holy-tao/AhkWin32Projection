#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MSV1_0_CREDENTIAL_KEY_TYPE.ahk" { MSV1_0_CREDENTIAL_KEY_TYPE }
#Import ".\MSV1_0_CREDENTIAL_KEY.ahk" { MSV1_0_CREDENTIAL_KEY }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_SUPPLEMENTAL_CREDENTIAL_V3 {
    #StructPack 4

    Version : UInt32

    Flags : UInt32

    CredentialKeyType : MSV1_0_CREDENTIAL_KEY_TYPE

    NtPassword : Int8[16]

    CredentialKey : MSV1_0_CREDENTIAL_KEY

    ShaPassword : Int8[20]

}
