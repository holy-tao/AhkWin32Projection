#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates how much any visible DIPs (device independent pixels) overshoot each side of the layout or inline objects.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_overhang_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_OVERHANG_METRICS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the left-most visible DIP to its  left-alignment edge.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the top-most visible DIP to its  top alignment edge.
     * @type {Float}
     */
    top {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the right-most visible DIP to its  right-alignment edge.
     * @type {Float}
     */
    right {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The distance from the bottom-most visible DIP to its lower-alignment edge.
     * @type {Float}
     */
    bottom {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
