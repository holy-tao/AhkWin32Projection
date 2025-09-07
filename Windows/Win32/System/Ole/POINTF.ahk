#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to convert between container units, expressed in floating point, and control units, expressed in HIMETRIC.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-pointf
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class POINTF extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The x coordinates of the point in units that the container finds convenient.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y coordinates of the point in units that the container finds convenient.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
