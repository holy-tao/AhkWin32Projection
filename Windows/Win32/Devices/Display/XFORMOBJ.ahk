#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-xformobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class XFORMOBJ extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
