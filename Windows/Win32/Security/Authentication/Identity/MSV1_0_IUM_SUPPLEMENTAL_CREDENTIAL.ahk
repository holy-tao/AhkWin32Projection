#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct MSV1_0_IUM_SUPPLEMENTAL_CREDENTIAL {
    #StructPack 4

    Version : UInt32

    EncryptedCredsSize : UInt32

    EncryptedCreds : Int8[1]

}
