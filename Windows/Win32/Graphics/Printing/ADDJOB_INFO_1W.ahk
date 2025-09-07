#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADDJOB\_INFO\_1 structure identifies a print job as well as the directory and file in which an application can store that job.
 * @see https://learn.microsoft.com/windows/win32/printdocs/addjob-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class ADDJOB_INFO_1W extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that contains the path and file name that the application can use to store the print job.
     * @type {Pointer<Ptr>}
     */
    Path {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
