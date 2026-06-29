#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct IO_IRP_EXT_TRACK_OFFSET_HEADER {
    #StructPack 8

    Validation : UInt16

    Flags : UInt16

    TrackedOffsetCallback : IntPtr

}
