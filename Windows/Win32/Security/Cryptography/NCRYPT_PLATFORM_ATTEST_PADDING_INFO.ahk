#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_PLATFORM_ATTEST_PADDING_INFO {
    #StructPack 4

    magic : UInt32

    pcrMask : UInt32

}
