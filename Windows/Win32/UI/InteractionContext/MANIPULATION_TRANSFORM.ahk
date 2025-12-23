#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the transformation data for a manipulation.
 * @see https://learn.microsoft.com/windows/win32/api/interactioncontext/ns-interactioncontext-manipulation_transform
 * @namespace Windows.Win32.UI.InteractionContext
 * @version v4.0.30319
 */
class MANIPULATION_TRANSFORM extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Translation along the x-axis, in HIMETRIC units.
     * @type {Float}
     */
    translationX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Translation along the y-axis, in HIMETRIC units.
     * @type {Float}
     */
    translationY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Change in scale as a percentage, in HIMETRIC units.
     * @type {Float}
     */
    scale {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Expansion in user-defined coordinates, in HIMETRIC units.
     * @type {Float}
     */
    expansion {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Change in rotation, in radians.
     * @type {Float}
     */
    rotation {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
