#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the system shortcuts for [InjectShortcut](inputinjector_injectshortcut_1050225526.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputshortcut
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputShortcut extends Win32Enum{

    /**
     * Indicates traversal through a back stack.
     * @type {Integer (Int32)}
     */
    static Back => 0

    /**
     * Indicates traversal to a start, or home, screen.
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Indicates traversal to a search screen.
     * @type {Integer (Int32)}
     */
    static Search => 2
}
