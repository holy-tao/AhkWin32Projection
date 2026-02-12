#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the density of a typeface, in terms of the lightness or heaviness of the strokes.
 * @remarks
 * In standard typography API, the weight of a font is expressed by using constant names such as "Bold". Using constant names for setting a font weight property is supported through type converter behaviors and also by the [FontWeights](fontweights.md) support class. For code access, the relevant information is expressed as the **Weight** member of a FontWeight structure.
 * 
 * The [FontWeights](fontweights.md) values correspond to the "usWeightClass" definition in the [OpenType specification](/typography/opentype/spec/). The "usWeightClass" represents an integer value between 1 and 999. Lower values indicate lighter weights; higher values indicate heavier weights.
 * 
 * The **Weight** member of a FontWeight structure is typically initiated with one of the [FontWeights](fontweights.md) values. If you access a FontWeight structure in code, you can compare the value of its **Weight** member with values from the [FontWeights](fontweights.md) static properties.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.fontweight
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class FontWeight extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * The font weight expressed as a numeric value.
     * @type {Integer}
     */
    Weight {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
