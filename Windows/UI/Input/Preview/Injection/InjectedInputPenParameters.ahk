#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the pen states used to simulate pen input through [InjectedInputPenInfo](injectedinputpeninfo.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputpenparameters
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputPenParameters extends Win32BitflagEnum{

    /**
     * No pen state reported. Default.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The pen contact pressure on the digitizer surface, normalized to a range between 0 and 1024. The default is 0 if the device does not report pressure.
     * @type {Integer (UInt32)}
     */
    static Pressure => 1

    /**
     * The clockwise rotation, or twist, of the pointer normalized in a range of 0 to 359. The default is 0.
     * @type {Integer (UInt32)}
     */
    static Rotation => 2

    /**
     * The angle of tilt of the pointer along the x-axis in a range of -90 to +90, with a positive value indicating a tilt to the right. The default is 0.
     * @type {Integer (UInt32)}
     */
    static TiltX => 4

    /**
     * The angle of tilt of the pointer along the y-axis in a range of -90 to +90, with a positive value indicating a tilt toward the user. The default is 0.
     * @type {Integer (UInt32)}
     */
    static TiltY => 8
}
