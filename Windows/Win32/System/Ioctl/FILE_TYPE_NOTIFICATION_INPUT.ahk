#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_TYPE_NOTIFICATION_INPUT {
    #StructPack 8

    Flags : UInt32

    NumFileTypeIDs : UInt32

    FileTypeID : IntPtr[1]

}
