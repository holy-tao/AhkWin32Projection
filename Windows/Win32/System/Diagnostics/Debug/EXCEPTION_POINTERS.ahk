#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONTEXT.ahk" { CONTEXT }
#Import ".\EXCEPTION_RECORD.ahk" { EXCEPTION_RECORD }

/**
 * Contains an exception record with a machine-independent description of an exception and a context record with a machine-dependent description of the processor context at the time of the exception.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-exception_pointers
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct EXCEPTION_POINTERS {
    #StructPack 8

    /**
     * A pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure that contains a machine-independent description of the exception.
     */
    ExceptionRecord : EXCEPTION_RECORD.Ptr

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-context">CONTEXT</a> structure that contains a processor-specific description of the state of the processor at the time of the exception.
     */
    ContextRecord : CONTEXT.Ptr

}
