#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CLMD_PIV_PUBLIC_KEY_DATA {
    #StructPack 8

    dwVersion : UInt32

    bKeyId : Int8

    pbPublicKey : IntPtr

    cbPublicKey : UInt32

}
