#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\MONITORINFO.ahk

/**
 * The MONITORINFOEX structure contains information about a display monitor.The GetMonitorInfo function stores information into a MONITORINFOEX structure or a MONITORINFO structure.The MONITORINFOEX structure is a superset of the MONITORINFO structure.
 * @remarks
 * 
  * > [!NOTE]
  * > The winuser.h header defines MONITORINFOEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-monitorinfoexa
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset ANSI
 */
class MONITORINFOEXA extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {MONITORINFO}
     */
    monitorInfo{
        get {
            if(!this.HasProp("__monitorInfo"))
                this.__monitorInfo := MONITORINFO(0, this)
            return this.__monitorInfo
        }
    }

    /**
     * A string that specifies the device name of the monitor being used.  Most applications have no use for a display monitor name, and so can save some bytes by using a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-monitorinfo">MONITORINFO</a> structure.
     * @type {String}
     */
    szDevice {
        get => StrGet(this.ptr + 48, 31, "UTF-8")
        set => StrPut(value, this.ptr + 48, 31, "UTF-8")
    }
}
