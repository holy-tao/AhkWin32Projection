#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the various options, or modifiers, used to simulate input from physical or virtual keyboards through [InjectedInputKeyboardInfo](injectedinputkeyboardinfo.md).
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
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.preview.injection.injectedinputkeyoptions
 * @namespace Windows.UI.Input.Preview.Injection
 * @version WindowsRuntime 1.4
 */
class InjectedInputKeyOptions extends Win32BitflagEnum{

    /**
     * No keystroke modifier. Default.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The key is an extended key, such as a function key or a key on the numeric keypad.
     * @type {Integer (UInt32)}
     */
    static ExtendedKey => 1

    /**
     * The key is released.
     * @type {Integer (UInt32)}
     */
    static KeyUp => 2

    /**
     * The OEM, device-dependent identifier for the key on the keyboard.A keyboard generates two scan codes when the user types a key—one when the user presses the key and another when the user releases the key.
     * @type {Integer (UInt32)}
     */
    static ScanCode => 8

    /**
     * The key is a Unicode value.
     * @type {Integer (UInt32)}
     */
    static Unicode => 4
}
