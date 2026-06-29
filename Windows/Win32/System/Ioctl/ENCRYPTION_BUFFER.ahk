#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct ENCRYPTION_BUFFER {
    #StructPack 4

    EncryptionOperation : UInt32

    Private : Int8[1]

}
