#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_COPYRIGHT_DESCRIPTOR {
    #StructPack 2

    CopyrightProtectionType : Int8

    RegionManagementInformation : Int8

    Reserved : UInt16

}
