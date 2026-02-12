#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the touch states used to simulate touch input through [InjectedInputTouchInfo](injectedinputtouchinfo.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputtouchparameters
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputTouchParameters extends Win32BitflagEnum{

    /**
     * No touch state reported. Default.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The screen coordinates of the bounding box that represents the touch contact area.
     * @type {Integer (UInt32)}
     */
    static Contact => 1

    /**
     * The counter-clockwise angle of rotation around the major axis of the pointer device (the z-axis, perpendicular to the surface of the digitizer).
     * @type {Integer (UInt32)}
     */
    static Orientation => 2

    /**
     * The force exerted by the pointer device on the surface of the digitizer.
     * @type {Integer (UInt32)}
     */
    static Pressure => 4
}
