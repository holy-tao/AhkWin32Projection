#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITouchCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the ability to determine the touch capabilities of any connected touch digitizers.
 * @remarks
 * The values returned by the properties discussed here are based on the total number of touch digitizers connected: Boolean properties return true if one digitizer supports a specific capability and numeric properties return the maximum value exposed by all digitizers.
 * 
 * The [Device Capabilities Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/Input%20Device%20capabilities%20sample) demonstrates how to detect the presence of input devices and retrieve the capabilities and attributes of each device.
 * 
 * The following code shows how to use this class to determine touch capabilities.
 * 
 * ```html
 *     function getTouchCapabilities() {
 *         var touchCapabilities = new Windows.Devices.Input.TouchCapabilities();
 *         id("contacts").innerHTML = touchCapabilities.Contacts;
 *     }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.touchcapabilities
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class TouchCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITouchCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITouchCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether a touch digitizer is detected.
     * @remarks
     * This property always returns 1 if an instance of the Microsoft Visual Studio simulator is running.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.touchcapabilities.touchpresent
     * @type {Integer} 
     */
    TouchPresent {
        get => this.get_TouchPresent()
    }

    /**
     * Gets the minimum number of contacts supported by all the digitizers.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.touchcapabilities.contacts
     * @type {Integer} 
     */
    Contacts {
        get => this.get_Contacts()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the TouchCapabilities class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.TouchCapabilities")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TouchPresent() {
        if (!this.HasProp("__ITouchCapabilities")) {
            if ((queryResult := this.QueryInterface(ITouchCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchCapabilities := ITouchCapabilities(outPtr)
        }

        return this.__ITouchCapabilities.get_TouchPresent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Contacts() {
        if (!this.HasProp("__ITouchCapabilities")) {
            if ((queryResult := this.QueryInterface(ITouchCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchCapabilities := ITouchCapabilities(outPtr)
        }

        return this.__ITouchCapabilities.get_Contacts()
    }

;@endregion Instance Methods
}
