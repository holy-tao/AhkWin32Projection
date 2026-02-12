#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\Win32\Foundation\POINT.ahk

/**
 * Represents a single point for a [DelegatedInkTrailVisual](delegatedinktrailvisual.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.inktrailpoint
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class InkTrailPoint extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * A single point used in the construction of an [DelegatedInkTrailVisual](delegatedinktrailvisual.md).
     * @type {POINT}
     */
    Point{
        get {
            if(!this.HasProp("__Point"))
                this.__Point := POINT(0, this)
            return this.__Point
        }
    }

    /**
     * The radius of the *Point* in the [DelegatedInkTrailVisual](delegatedinktrailvisual.md).
     * @type {Float}
     */
    Radius {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
