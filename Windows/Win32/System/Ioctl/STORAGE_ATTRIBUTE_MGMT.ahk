#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_ATTRIBUTE_MGMT_ACTION.ahk" { STORAGE_ATTRIBUTE_MGMT_ACTION }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ATTRIBUTE_MGMT {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Action : STORAGE_ATTRIBUTE_MGMT_ACTION

    Attribute : UInt32

}
