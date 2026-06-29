#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_READ_USER_MINIDUMP_STREAM {
    #StructPack 8

    StreamType : UInt32

    Flags : UInt32

    Offset : Int64

    Buffer : IntPtr

    BufferSize : UInt32

    BufferUsed : UInt32

}
