#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\EXCEPTION_RECORD.ahk" { EXCEPTION_RECORD }

/**
 * Contains exception information that can be used by a debugger.
 * @see https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-exception_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct EXCEPTION_DEBUG_INFO {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure with information specific to the exception. This includes the exception code, flags, address, a pointer to a related exception, extra parameters, and so on.
     */
    ExceptionRecord : EXCEPTION_RECORD

    /**
     * A value that indicates whether the debugger has previously encountered the exception specified by the <b>ExceptionRecord</b> member. If the <b>dwFirstChance</b> member is nonzero, this is the first time the debugger has encountered the exception. Debuggers typically handle breakpoint and single-step exceptions when they are first encountered. If this member is zero, the debugger has previously encountered the exception. This occurs only if, during the search for structured exception handlers, either no handler was found or the exception was continued.
     */
    dwFirstChance : UInt32

}
