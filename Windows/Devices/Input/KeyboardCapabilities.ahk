#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyboardCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to determine the capabilities of any connected hardware keyboards.
 * @remarks
 * The [Device Capabilities Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/Input%20Device%20capabilities%20sample) demonstrates how to detect the presence of input devices and retrieve the capabilities and attributes of each device.
 * 
 * The following code shows how to create an instance of this class and use it to determine if a keyboard is present.
 * 
 * ```javascript
 * function getKeyboardCapabilities() {
 *   var keyboardCapabilities = new Windows.Devices.Input.KeyboardCapabilities();
 *   id("keyboardPresent").innerHTML = keyboardCapabilities.keyboardPresent;
 * }
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.keyboardcapabilities
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class KeyboardCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyboardCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyboardCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether a device identifying itself as a keyboard is detected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.keyboardcapabilities.keyboardpresent
     * @type {Integer} 
     */
    KeyboardPresent {
        get => this.get_KeyboardPresent()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the KeyboardCapabilities class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.KeyboardCapabilities")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyboardPresent() {
        if (!this.HasProp("__IKeyboardCapabilities")) {
            if ((queryResult := this.QueryInterface(IKeyboardCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardCapabilities := IKeyboardCapabilities(outPtr)
        }

        return this.__IKeyboardCapabilities.get_KeyboardPresent()
    }

;@endregion Instance Methods
}
