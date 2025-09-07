#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The ADDJOB\_INFO\_1 structure identifies a print job as well as the directory and file in which an application can store that job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addjob-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset ANSI
 */
class ADDJOB_INFO_1A extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the path and file name that the application can use to store the print job.
     * @type {PSTR}
     */
    Path{
        get {
            if(!this.HasProp("__Path"))
                this.__Path := PSTR(this.ptr + 0)
            return this.__Path
        }
    }

    /**
     * A handle to the print job.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
