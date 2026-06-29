#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Contains I/O callback information.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_io_callback
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_IO_CALLBACK {
    #StructPack 8

    /**
     * The file handle passed to the <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/nf-minidumpapiset-minidumpwritedump">MiniDumpWriteDump</a> function.
     */
    Handle : HANDLE

    /**
     * The offset for the write operation from the start of the minidump data. This member is used only with <b>IoWriteAllCallback</b>.
     */
    Offset : Int64

    /**
     * A pointer to a buffer that contains the data to be written. This member is used only with <b>IoWriteAllCallback</b>.
     */
    Buffer : IntPtr

    /**
     * The size of the data buffer, in bytes. This member is used only with <b>IoWriteAllCallback</b>.
     */
    BufferBytes : UInt32

}
