#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VDS_DISK_STATUS.ahk" { VDS_DISK_STATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\VDS_HEALTH.ahk" { VDS_HEALTH }
#Import ".\VDS_PARTITION_STYLE.ahk" { VDS_PARTITION_STYLE }
#Import ".\VDS_STORAGE_BUS_TYPE.ahk" { VDS_STORAGE_BUS_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_ADVANCEDDISK_PROP {
    #StructPack 8

    pwszId : PWSTR

    pwszPathname : PWSTR

    pwszLocation : PWSTR

    pwszFriendlyName : PWSTR

    pswzIdentifier : PWSTR

    usIdentifierFormat : UInt16

    ulNumber : UInt32

    pwszSerialNumber : PWSTR

    pwszFirmwareVersion : PWSTR

    pwszManufacturer : PWSTR

    pwszModel : PWSTR

    ullTotalSize : Int64

    ullAllocatedSize : Int64

    ulLogicalSectorSize : UInt32

    ulPhysicalSectorSize : UInt32

    ulPartitionCount : UInt32

    status : VDS_DISK_STATUS

    health : VDS_HEALTH

    BusType : VDS_STORAGE_BUS_TYPE

    PartitionStyle : VDS_PARTITION_STYLE

    dwSignature : UInt32

    ulFlags : UInt32

    dwDeviceType : UInt32

    static __New() {
        DefineProp(this.Prototype, 'DiskGuid', { type: Guid, offset: 124 })
        this.DeleteProp("__New")
    }
}
