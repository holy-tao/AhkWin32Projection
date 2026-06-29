#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_RESOURCE_DATA_ENTRY {
    #StructPack 4

    OffsetToData : UInt32

    Size : UInt32

    CodePage : UInt32

    Reserved : UInt32

}
