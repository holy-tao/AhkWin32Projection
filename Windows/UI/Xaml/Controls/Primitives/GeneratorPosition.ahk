#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * GeneratorPosition is used to describe the position of an item that is managed by [ItemContainerGenerator](../windows.ui.xaml.controls/itemcontainergenerator.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.generatorposition
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class GeneratorPosition extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The index that is relative to the generated (realized) items.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The offset that is relative to the ungenerated (unrealized) items near the indexed item.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
