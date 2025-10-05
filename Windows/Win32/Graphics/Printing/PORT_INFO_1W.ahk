#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PORT\_INFO\_1 structure identifies a supported printer port.
 * @see https://learn.microsoft.com/windows/win32/printdocs/port-info-1
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 * @charset Unicode
 */
class PORT_INFO_1W extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that identifies a supported printer port (for example, "LPT1:").
     * @type {Pointer<Char>}
     */
    pName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
