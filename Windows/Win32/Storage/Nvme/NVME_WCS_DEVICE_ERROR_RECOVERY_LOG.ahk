#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_WCS_DEVICE_RESET_ACTION.ahk" { NVME_WCS_DEVICE_RESET_ACTION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NVME_WCS_DEVICE_CAPABILITIES.ahk" { NVME_WCS_DEVICE_CAPABILITIES }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_WCS_DEVICE_ERROR_RECOVERY_LOG {
    #StructPack 8

    PanicResetWaitTime : UInt16

    PanicResetAction : NVME_WCS_DEVICE_RESET_ACTION

    DriveRecoveryAction : Int8

    PanicId : Int64

    DeviceCapabilitiesA : NVME_WCS_DEVICE_CAPABILITIES

    VendorSpecificRecoveryCode : Int8

    Reserved0 : Int8[3]

    VendorSpecificCommandCDW12 : UInt32

    VendorSpecificCommandCDW13 : UInt32

    Reserved1 : Int8[466]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
