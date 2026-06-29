#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct NCRYPT_CIPHER_PADDING_INFO {
    #StructPack 8

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

    pbIV : IntPtr

    cbIV : UInt32

    pbOtherInfo : IntPtr

    cbOtherInfo : UInt32

}
