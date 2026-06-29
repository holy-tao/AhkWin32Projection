#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_MEMORY_INFORMATION {
    #StructPack 8

    VideoRamBase : IntPtr

    VideoRamLength : UInt32

    FrameBufferBase : IntPtr

    FrameBufferLength : UInt32

}
