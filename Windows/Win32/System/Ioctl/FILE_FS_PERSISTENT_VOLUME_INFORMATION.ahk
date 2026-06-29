#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_FS_PERSISTENT_VOLUME_INFORMATION {
    #StructPack 4

    VolumeFlags : UInt32

    FlagMask : UInt32

    Version : UInt32

    Reserved : UInt32

}
