#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains CodeView and Misc records.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-modload_cvmisc
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class MODLOAD_CVMISC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The offset of the CodeView record.
     * @type {Integer}
     */
    oCV {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the CodeView record.
     * @type {Pointer}
     */
    cCV {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The offset of the Misc record.
     * @type {Integer}
     */
    oMisc {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The size of the Misc record.
     * @type {Pointer}
     */
    cMisc {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The date/time stamp of the image.
     * @type {Integer}
     */
    dtImage {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The size of the image.
     * @type {Integer}
     */
    cImage {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
