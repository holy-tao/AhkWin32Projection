#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_TPM_PERSISTENT_KEY_BLOB_HEADER {
    #StructPack 4

    magic : UInt32

    cbHeader : UInt32

    tpmHandle : UInt32

}
