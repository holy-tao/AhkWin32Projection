#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MONITORINFO.ahk" { MONITORINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The MONITORINFOEX structure contains information about a display monitor.The GetMonitorInfo function stores information into a MONITORINFOEX structure or a MONITORINFO structure.The MONITORINFOEX structure is a superset of the MONITORINFO structure. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winuser.h header defines MONITORINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-monitorinfoexa
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct MONITORINFOEXA {
    #StructPack 4

    monitorInfo : MONITORINFO

    /**
     * A string that specifies the device name of the monitor being used.  Most applications have no use for a display monitor name, and so can save some bytes by using a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfo">MONITORINFO</a> structure.
     */
    szDevice : CHAR[32]

}
