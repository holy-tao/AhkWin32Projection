#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_ATTRIBUTE_TAG_INFORMATION {
    #StructPack 4

    FileAttributes : UInt32

    ReparseTag : UInt32

}
