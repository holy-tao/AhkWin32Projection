#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PD_LAST_FW_ACTIVATION_STATUS.ahk" { SCM_PD_LAST_FW_ACTIVATION_STATUS }
#Import ".\SCM_PD_FIRMWARE_ACTIVATION_STATE.ahk" { SCM_PD_FIRMWARE_ACTIVATION_STATE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_RUNTIME_FW_ACTIVATION_INFO {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    LastFirmwareActivationStatus : SCM_PD_LAST_FW_ACTIVATION_STATUS

    FirmwareActivationState : SCM_PD_FIRMWARE_ACTIVATION_STATE

}
