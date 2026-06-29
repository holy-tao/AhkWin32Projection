#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_KEY_ATTEST_PADDING_INFO {
    #StructPack 8

    magic : UInt32

    pbKeyBlob : IntPtr

    cbKeyBlob : UInt32

    pbKeyAuth : IntPtr

    cbKeyAuth : UInt32

}
