#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the height and width of an object in a two-dimensional plane.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.sizeuint32
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class SizeUInt32 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The width of an object.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of an object.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
