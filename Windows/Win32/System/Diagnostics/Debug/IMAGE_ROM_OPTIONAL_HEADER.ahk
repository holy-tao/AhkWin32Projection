#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGE_ROM_OPTIONAL_HEADER {
    #StructPack 4

    Magic : UInt16

    MajorLinkerVersion : Int8

    MinorLinkerVersion : Int8

    SizeOfCode : UInt32

    SizeOfInitializedData : UInt32

    SizeOfUninitializedData : UInt32

    AddressOfEntryPoint : UInt32

    BaseOfCode : UInt32

    BaseOfData : UInt32

    BaseOfBss : UInt32

    GprMask : UInt32

    CprMask : UInt32[4]

    GpValue : UInt32

}
