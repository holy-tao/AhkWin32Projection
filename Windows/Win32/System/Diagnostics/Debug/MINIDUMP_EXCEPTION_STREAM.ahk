#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MINIDUMP_LOCATION_DESCRIPTOR.ahk" { MINIDUMP_LOCATION_DESCRIPTOR }
#Import ".\MINIDUMP_EXCEPTION.ahk" { MINIDUMP_EXCEPTION }

/**
 * Represents an exception information stream.
 * @remarks
 * In this context, a data stream is a set of data in a minidump file.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_exception_stream
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_EXCEPTION_STREAM {
    #StructPack 8

    /**
     * The identifier of the thread that caused the exception.
     */
    ThreadId : UInt32

    /**
     * A variable for alignment.
     */
    __alignment : UInt32

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minidumpapiset/ns-minidumpapiset-minidump_exception">MINIDUMP_EXCEPTION</a> structure.
     */
    ExceptionRecord : MINIDUMP_EXCEPTION

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_location_descriptor">MINIDUMP_LOCATION_DESCRIPTOR</a> structure.
     */
    ThreadContext : MINIDUMP_LOCATION_DESCRIPTOR

}
