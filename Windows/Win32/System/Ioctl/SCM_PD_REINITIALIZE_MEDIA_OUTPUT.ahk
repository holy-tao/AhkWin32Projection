#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCM_PD_MEDIA_REINITIALIZATION_STATUS.ahk" { SCM_PD_MEDIA_REINITIALIZATION_STATUS }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_PD_REINITIALIZE_MEDIA_OUTPUT {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Status : SCM_PD_MEDIA_REINITIALIZATION_STATUS

}
