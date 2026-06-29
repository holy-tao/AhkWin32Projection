#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_HOT_PATCH_HASHES {
    #StructPack 1

    SHA256 : Int8[32]

    SHA1 : Int8[20]

}
