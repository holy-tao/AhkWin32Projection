#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_EXPORT_DIRECTORY {
    #StructPack 4

    Characteristics : UInt32

    TimeDateStamp : UInt32

    MajorVersion : UInt16

    MinorVersion : UInt16

    Name : UInt32

    Base : UInt32

    NumberOfFunctions : UInt32

    NumberOfNames : UInt32

    AddressOfFunctions : UInt32

    AddressOfNames : UInt32

    AddressOfNameOrdinals : UInt32

}
