#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_DIAGNOSTIC_LEVEL.ahk" { STORAGE_DIAGNOSTIC_LEVEL }
#Import ".\STORAGE_DIAGNOSTIC_TARGET_TYPE.ahk" { STORAGE_DIAGNOSTIC_TARGET_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DIAGNOSTIC_REQUEST {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Flags : UInt32

    TargetType : STORAGE_DIAGNOSTIC_TARGET_TYPE

    Level : STORAGE_DIAGNOSTIC_LEVEL

}
