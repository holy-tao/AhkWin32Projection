#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_RESOURCE_DIRECTORY {
    #StructPack 4

    Characteristics : UInt32

    TimeDateStamp : UInt32

    MajorVersion : UInt16

    MinorVersion : UInt16

    NumberOfNamedEntries : UInt16

    NumberOfIdEntries : UInt16

}
