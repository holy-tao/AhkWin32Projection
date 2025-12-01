#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The XFORMOBJ structure describes an arbitrary linear two-dimensional transform, such as for geometric wide lines.
 * @remarks
 * The arbitrary two-dimensional transform can be downloaded to the driver. Functions are also provided to apply the transform to driver-supplied data.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-xformobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class XFORMOBJ extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * There are no public members in the XFORMOBJ structure.
     * @type {Integer}
     */
    ulReserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
