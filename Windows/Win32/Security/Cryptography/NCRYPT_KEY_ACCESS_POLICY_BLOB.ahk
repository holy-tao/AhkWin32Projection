#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_KEY_ACCESS_POLICY_BLOB {
    #StructPack 4

    dwVersion : UInt32

    dwPolicyFlags : UInt32

    cbUserSid : UInt32

    cbApplicationSid : UInt32

}
