#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIRTUAL_STORAGE_BEHAVIOR_CODE.ahk" { VIRTUAL_STORAGE_BEHAVIOR_CODE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct VIRTUAL_STORAGE_SET_BEHAVIOR_INPUT {
    #StructPack 4

    Size : UInt32

    BehaviorCode : VIRTUAL_STORAGE_BEHAVIOR_CODE

}
