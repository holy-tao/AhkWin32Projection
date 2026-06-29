#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_SEPARATE_DEBUG_HEADER {
    #StructPack 4

    Signature : UInt16

    Flags : UInt16

    Machine : UInt16

    Characteristics : UInt16

    TimeDateStamp : UInt32

    CheckSum : UInt32

    ImageBase : UInt32

    SizeOfImage : UInt32

    NumberOfSections : UInt32

    ExportedNamesSize : UInt32

    DebugDirectorySize : UInt32

    SectionAlignment : UInt32

    Reserved : UInt32[2]

}
