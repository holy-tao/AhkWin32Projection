#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of visual feedback displayed for the injected input type.
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputvisualizationmode
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputVisualizationMode extends Win32Enum{

    /**
     * Indicates no visual feedback for the injected input. Default.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates default system visual feedback for the type of injected input.
     * @type {Integer (Int32)}
     */
    static Default => 1

    /**
     * Indicates indirect visual feedback for the type of injected input (pen and touch only, typically for projection to an external monitor).
     * @type {Integer (Int32)}
     */
    static Indirect => 2
}
