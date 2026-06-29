#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_WCS_DEVICE_RESET_ACTION.ahk" { NVME_WCS_DEVICE_RESET_ACTION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NVME_WCS_DEVICE_CAPABILITIES.ahk" { NVME_WCS_DEVICE_CAPABILITIES }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_ERROR_RECOVERY_LOG_V2 {
    #StructPack 8

    PanicResetWaitTime : UInt16

    PanicResetAction : NVME_WCS_DEVICE_RESET_ACTION

    DeviceRecoveryAction1 : Int8

    PanicId : Int64

    DeviceCapabilitiesA : NVME_WCS_DEVICE_CAPABILITIES

    VendorSpecificRecoveryCode : Int8

    Reserved0 : Int8[3]

    VendorSpecificCommandCDW12 : UInt32

    VendorSpecificCommandCDW13 : UInt32

    VendorSpecificCommandTimeout : Int8

    DeviceRecoveryAction2 : Int8

    DeviceRecoveryAction2Timeout : Int8

    Reserved1 : Int8[463]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
