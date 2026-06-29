#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\STORAGE_ENCRYPTION_TYPE.ahk" { STORAGE_ENCRYPTION_TYPE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_SELF_ENCRYPTION_PROPERTY_V2 {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    SupportsSelfEncryption : BOOLEAN

    EncryptionType : STORAGE_ENCRYPTION_TYPE

}
