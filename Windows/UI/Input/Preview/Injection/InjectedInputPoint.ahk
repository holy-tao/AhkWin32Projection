#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the screen coordinates of the pointer in device-independent pixel (DIP).
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpoint
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputPoint extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The x-coordinate of the pointer in device-independent pixel (DIP).
     * @type {Integer}
     */
    PositionX {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The y-coordinate of the pointer in device-independent pixel (DIP).
     * @type {Integer}
     */
    PositionY {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
