#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PCP_RAW_POLICYDIGEST_INFO {
    #StructPack 4

    dwVersion : UInt32

    cbDigest : UInt32

}
