#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK.ahk" { PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct IO_IRP_EXT_TRACK_OFFSET_HEADER {
    #StructPack 8

    Validation : UInt16

    Flags : UInt16

    TrackedOffsetCallback : PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK

}
