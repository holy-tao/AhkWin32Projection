#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CLMD_PIV_GENERATE_ASYMMETRIC_KEY {
    #StructPack 8

    dwVersion : UInt32

    bAlgorithmId : Int8

    bKeyId : Int8

    pbKey : IntPtr

    cbKey : UInt32

}
