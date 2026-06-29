#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PCP_TPM_FW_VERSION_INFO {
    #StructPack 2

    major1 : UInt16

    major2 : UInt16

    minor1 : UInt16

    minor2 : UInt16

}
