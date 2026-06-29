#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICEDUMP_SECTION_HEADER {
    #StructPack 4

    guidDeviceDataId : Guid

    sOrganizationID : Int8[16]

    dwFirmwareRevision : UInt32

    sModelNumber : Int8[32]

    szDeviceManufacturingID : Int8[32]

    dwFlags : UInt32

    bRestrictedPrivateDataVersion : UInt32

    dwFirmwareIssueId : UInt32

    szIssueDescriptionString : Int8[132]

}
