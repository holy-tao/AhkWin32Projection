#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_POWERUP_REASON_TYPE.ahk" { STORAGE_POWERUP_REASON_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_IDLE_POWERUP_REASON {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    PowerupReason : STORAGE_POWERUP_REASON_TYPE

}
