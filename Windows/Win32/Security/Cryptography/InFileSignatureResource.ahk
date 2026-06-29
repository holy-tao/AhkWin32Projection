#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct InFileSignatureResource {
    #StructPack 4

    dwVersion : UInt32

    dwCrcOffset : UInt32

    rgbSignature : Int8[88]

}
