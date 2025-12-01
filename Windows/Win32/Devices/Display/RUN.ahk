#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RUN structure is used to describe a linear set of pixels that is not clipped by the CLIPLINE structure.
 * @remarks
 * If the <a href="https://docs.microsoft.com/windows-hardware/drivers/">clip region</a> is complex, a single line segment can be broken into many RUNs. The same segment is returned as many times as necessary to list all of its RUNs.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-run
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class RUN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the starting point for a field of pixels to be drawn. The first pixel of the unclipped line is pixel 0.
     * @type {Integer}
     */
    iStart {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the stopping point for a field of pixels to be drawn.
     * @type {Integer}
     */
    iStop {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
