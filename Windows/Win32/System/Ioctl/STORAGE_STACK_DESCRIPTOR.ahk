#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_STACK_TYPE.ahk" { STORAGE_STACK_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_STACK_DESCRIPTOR {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    StorageStackType : STORAGE_STACK_TYPE

}
