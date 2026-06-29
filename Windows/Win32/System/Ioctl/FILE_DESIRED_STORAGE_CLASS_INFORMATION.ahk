#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_STORAGE_TIER_CLASS.ahk" { FILE_STORAGE_TIER_CLASS }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_DESIRED_STORAGE_CLASS_INFORMATION {
    #StructPack 4

    Class : FILE_STORAGE_TIER_CLASS

    Flags : UInt32

}
