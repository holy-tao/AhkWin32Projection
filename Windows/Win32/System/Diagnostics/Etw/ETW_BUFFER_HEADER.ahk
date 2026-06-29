#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_BUFFER_CONTEXT.ahk" { ETW_BUFFER_CONTEXT }

/**
 * The header structure of an ETW buffer.
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ns-evntrace-etw_buffer_header
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct ETW_BUFFER_HEADER {
    #StructPack 8

    /**
     * Reserved.
     */
    Reserved1 : UInt32[4]

    /**
     * The time when the buffer was flushed. It will be in the raw clock type of the session from which the buffer was collected (for example, QueryPerformanceCounter, CPU timestamp counter, or GetSystemTimeAsFileTime).
     */
    TimeStamp : Int64

    /**
     * Reserved.
     */
    Reserved2 : UInt32[4]

    /**
     * Contains information about the processor and logger that generated this buffer. See [ETW_BUFFER_CONTEXT](ns-evntrace-etw_buffer_context.md).
     */
    ClientContext : ETW_BUFFER_CONTEXT

    Reserved3 : UInt32

    /**
     * The size of the valid data in the buffer. This is the size of the ETW_BUFFER_HEADER and the event data. When a buffer is copied, it is common to only allocate enough memory to store the valid data (for example, only FilledBytes bytes are allocated and copied), so recipients of a buffer should not read beyond this offset
     */
    FilledBytes : UInt32

    /**
     * Reserved.
     */
    Reserved4 : UInt32[5]

}
