#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains user-defined information stored in a data stream.
 * @remarks
 * In this context, a data stream refers to a block of data within a minidump file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_user_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64, Arm64
 */
export default struct MINIDUMP_USER_STREAM {
    #StructPack 8

    /**
     * The type of data stream. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ne-minidumpapiset-minidump_stream_type">MINIDUMP_STREAM_TYPE</a>.
     */
    Type : UInt32

    /**
     * The size of the user-defined data stream buffer, in bytes.
     */
    BufferSize : UInt32

    /**
     * A pointer to a buffer that contains the user-defined data stream.
     */
    Buffer : IntPtr

}
