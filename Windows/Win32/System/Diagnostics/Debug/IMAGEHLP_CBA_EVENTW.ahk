#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IMAGEHLP_CBA_EVENT_SEVERITY.ahk" { IMAGEHLP_CBA_EVENT_SEVERITY }

/**
 * The IMAGEHLP_CBA_EVENTW (Unicode) structure (dbghelp.h) contains information about a debugging event.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines IMAGEHLP_CBA_EVENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_cba_eventw
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct IMAGEHLP_CBA_EVENTW {
    #StructPack 8

    severity : IMAGEHLP_CBA_EVENT_SEVERITY

    /**
     * This member is reserved for future use.
     */
    code : UInt32

    /**
     * A text description of the error.
     */
    desc : PWSTR

    /**
     * This member is reserved for future use.
     */
    object : IntPtr

}
