#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the changes in state of a button associated with a pointer.
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputbuttonchangekind
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputButtonChangeKind extends Win32Enum{

    /**
     * No change in button state. Default.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates a primary action is initiated.
     * 
     * A touch pointer has this flag set when it is in contact with the digitizer surface.
     * 
     * A pen pointer has this flag set when it is in contact with the digitizer surface with no buttons pressed.
     * 
     * A mouse pointer sets this flag when the left mouse button is down.
     * @type {Integer (Int32)}
     */
    static FirstButtonDown => 1

    /**
     * Indicates a primary action is complete.
     * @type {Integer (Int32)}
     */
    static FirstButtonUp => 2

    /**
     * Indicates a secondary action is initiated.
     * 
     * A touch pointer does not use this flag.
     * 
     * A pen pointer has this flag set when it is in contact with the digitizer surface with the pen barrel button pressed.
     * 
     * A mouse pointer sets this flag when the right mouse button is down.
     * @type {Integer (Int32)}
     */
    static SecondButtonDown => 3

    /**
     * Indicates a secondary action is complete.
     * @type {Integer (Int32)}
     */
    static SecondButtonUp => 4

    /**
     * Indicates a third action is initiated.A touch pointer does not use this flag.
     * 
     * A pen pointer does not use this flag.
     * 
     * A mouse pointer sets this flag when the mouse wheel button is down.
     * @type {Integer (Int32)}
     */
    static ThirdButtonDown => 5

    /**
     * Indicates a third action is complete.
     * @type {Integer (Int32)}
     */
    static ThirdButtonUp => 6

    /**
     * Indicates a fourth action is initiated.
     * 
     * A touch pointer does not use this flag.
     * 
     * A pen pointer does not use this flag.
     * 
     * A mouse pointer has this flag set when the first extended mouse (XBUTTON1) button is down.
     * @type {Integer (Int32)}
     */
    static FourthButtonDown => 7

    /**
     * Indicates a fourth action is complete.
     * @type {Integer (Int32)}
     */
    static FourthButtonUp => 8

    /**
     * Indicates a fifth action is initiated.
     * 
     * A touch pointer does not use this flag.
     * 
     * A pen pointer does not use this flag.
     * 
     * A mouse pointer has this flag set when the second extended mouse (XBUTTON2) button is down.
     * @type {Integer (Int32)}
     */
    static FifthButtonDown => 9

    /**
     * Indicates a fifth action is complete.
     * @type {Integer (Int32)}
     */
    static FifthButtonUp => 10
}
