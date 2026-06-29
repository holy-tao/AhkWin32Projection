#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_SELF_ENCRYPTION_PROPERTY {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    SupportsSelfEncryption : BOOLEAN

}
