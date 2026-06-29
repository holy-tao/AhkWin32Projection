#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_CBA_EVENT_SEVERITY.ahk" { IMAGEHLP_CBA_EVENT_SEVERITY }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The IMAGEHLP_CBA_EVENT structure (dbghelp.h) contains information about a debugging event.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_cba_event
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset ANSI
 */
export default struct IMAGEHLP_CBA_EVENT {
    #StructPack 8

    severity : IMAGEHLP_CBA_EVENT_SEVERITY

    /**
     * This member is reserved for future use.
     */
    code : UInt32

    /**
     * A text description of the error.
     */
    desc : PSTR

    /**
     * This member is reserved for future use.
     */
    object : IntPtr

}
