#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the pen options used to simulate pen input through [InjectedInputPenInfo](injectedinputpeninfo.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpenbuttons
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputPenButtons extends Win32BitflagEnum{

    /**
     * No pen buttons are pressed. Default.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The barrel button is pressed.
     * @type {Integer (UInt32)}
     */
    static Barrel => 1

    /**
     * The pen is inverted.
     * @type {Integer (UInt32)}
     */
    static Inverted => 2

    /**
     * The eraser button is pressed.
     * @type {Integer (UInt32)}
     */
    static Eraser => 4
}
