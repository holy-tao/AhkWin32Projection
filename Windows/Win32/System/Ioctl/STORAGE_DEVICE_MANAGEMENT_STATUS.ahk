#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_DISK_OPERATIONAL_STATUS.ahk" { STORAGE_DISK_OPERATIONAL_STATUS }
#Import ".\STORAGE_DISK_HEALTH_STATUS.ahk" { STORAGE_DISK_HEALTH_STATUS }
#Import ".\STORAGE_OPERATIONAL_STATUS_REASON.ahk" { STORAGE_OPERATIONAL_STATUS_REASON }
#Import ".\STORAGE_OPERATIONAL_REASON.ahk" { STORAGE_OPERATIONAL_REASON }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_MANAGEMENT_STATUS {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Health : STORAGE_DISK_HEALTH_STATUS

    NumberOfOperationalStatus : UInt32

    NumberOfAdditionalReasons : UInt32

    OperationalStatus : STORAGE_DISK_OPERATIONAL_STATUS[16]

    AdditionalReasons : STORAGE_OPERATIONAL_REASON[1]

}
