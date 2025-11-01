#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/printdocs/core-printer-driver
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class CORE_PRINTER_DRIVERW extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    CoreDriverGUID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {FILETIME}
     */
    ftDriverDate{
        get {
            if(!this.HasProp("__ftDriverDate"))
                this.__ftDriverDate := FILETIME(8, this)
            return this.__ftDriverDate
        }
    }

    /**
     * @type {Integer}
     */
    dwlDriverVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    szPackageID {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }
}
