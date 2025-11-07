#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PALOBJ structure is a user object that represents an indexed color palette.
 * @remarks
 * 
 * This structure is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-palobj_cgetcolors">PALOBJ_cGetColors</a> service routine.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winddi/ns-winddi-palobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PALOBJ extends Win32Struct
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
