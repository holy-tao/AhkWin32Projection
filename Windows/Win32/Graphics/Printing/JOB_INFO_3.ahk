#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The JOB\_INFO\_3 structure is used to link together a set of print jobs.
 * @see https://learn.microsoft.com/windows/win32/printdocs/job-info-3
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class JOB_INFO_3 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The print job identifier.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The print job identifier for the next print job in the linked set of print jobs.
     * @type {Integer}
     */
    NextJobId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This value is reserved for future use. You must set it to zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
