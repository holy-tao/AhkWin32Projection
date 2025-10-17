#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EXCEPTION_RECORD.ahk

/**
 * Contains exception information that can be used by a debugger.
 * @see https://docs.microsoft.com/windows/win32/api//minwinbase/ns-minwinbase-exception_debug_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class EXCEPTION_DEBUG_INFO extends Win32Struct
{
    static sizeof => 160

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-exception_record">EXCEPTION_RECORD</a> structure with information specific to the exception. This includes the exception code, flags, address, a pointer to a related exception, extra parameters, and so on.
     * @type {EXCEPTION_RECORD}
     */
    ExceptionRecord{
        get {
            if(!this.HasProp("__ExceptionRecord"))
                this.__ExceptionRecord := EXCEPTION_RECORD(0, this)
            return this.__ExceptionRecord
        }
    }

    /**
     * A value that indicates whether the debugger has previously encountered the exception specified by the <b>ExceptionRecord</b> member. If the <b>dwFirstChance</b> member is nonzero, this is the first time the debugger has encountered the exception. Debuggers typically handle breakpoint and single-step exceptions when they are first encountered. If this member is zero, the debugger has previously encountered the exception. This occurs only if, during the search for structured exception handlers, either no handler was found or the exception was continued.
     * @type {Integer}
     */
    dwFirstChance {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }
}
