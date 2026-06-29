#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_SMBIOS_INFO {
    #StructPack 4

    SizeOfStruct : UInt32

    SmbiosMajorVersion : Int8

    SmbiosMinorVersion : Int8

    DMIVersion : Int8

    TableSize : UInt32

    BiosMajorRelease : Int8

    BiosMinorRelease : Int8

    FirmwareMajorRelease : Int8

    FirmwareMinorRelease : Int8

    BaseBoardManufacturer : CHAR[64]

    BaseBoardProduct : CHAR[64]

    BaseBoardVersion : CHAR[64]

    BiosReleaseDate : CHAR[64]

    BiosVendor : CHAR[64]

    BiosVersion : CHAR[64]

    SystemFamily : CHAR[64]

    SystemManufacturer : CHAR[64]

    SystemProductName : CHAR[64]

    SystemSKU : CHAR[64]

    SystemVersion : CHAR[64]

}
