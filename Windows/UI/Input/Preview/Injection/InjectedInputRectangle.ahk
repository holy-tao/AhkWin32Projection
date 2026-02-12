#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The offsets, from the injected pointer, for the bounding box that represents the touch contact area.
 * @remarks
 * > [!Important]
 * > The APIs in this namespace require the inputInjectionBrokered [restricted capability](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities).
 * 
 * Using input injection requires the following be added to the Package.appxmanifest:
 * 
 * - To `<Package>`
 *     - `xmlns:rescap="http://schemas.microsoft.com/appx/manifest/foundation/windows10/restrictedcapabilities"`
 *     - `IgnorableNamespaces="rescap"`
 * - To `<Capabilities>`
 *     - `<rescap:Capability Name="inputInjectionBrokered" />`
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputrectangle
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputRectangle extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The location of the left side of the rectangle, in device-independent pixel (DIP).
     * @type {Integer}
     */
    Left {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The location of the top side of the rectangle, in device-independent pixel (DIP).
     * @type {Integer}
     */
    Top {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The location of the bottom side of the rectangle, in device-independent pixel (DIP).
     * @type {Integer}
     */
    Bottom {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The location of the left side of the rectangle, in device-independent pixel (DIP).
     * @type {Integer}
     */
    Right {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
