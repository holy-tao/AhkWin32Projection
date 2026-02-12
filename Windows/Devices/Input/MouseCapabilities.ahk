#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMouseCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Supports the ability to determine the capabilities of any connected mouse devices.
 * @remarks
 * The values returned by the properties discussed here are based on the total number of mice connected: Boolean properties return true if one mouse supports a specific capability and numeric properties return the maximum value exposed by all mice.
 * 
 * The [Device Capabilities Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/Input%20Device%20capabilities%20sample) demonstrates how to detect the presence of input devices and retrieve the capabilities and attributes of each device.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousecapabilities
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class MouseCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMouseCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMouseCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether a mouse device is detected.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousecapabilities.mousepresent
     * @type {Integer} 
     */
    MousePresent {
        get => this.get_MousePresent()
    }

    /**
     * Gets a value indicating whether any of the mice connected to the computer have a scroll wheel that rolls up and down (usually for vertical scrolling).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousecapabilities.verticalwheelpresent
     * @type {Integer} 
     */
    VerticalWheelPresent {
        get => this.get_VerticalWheelPresent()
    }

    /**
     * Gets a value indicating whether any of the mice connected to the computer have a scroll wheel that tilts left and right (usually for horizontal scrolling).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousecapabilities.horizontalwheelpresent
     * @type {Integer} 
     */
    HorizontalWheelPresent {
        get => this.get_HorizontalWheelPresent()
    }

    /**
     * Gets a value indicating whether any of the mice connected to the computer has swapped left and right buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousecapabilities.swapbuttons
     * @type {Integer} 
     */
    SwapButtons {
        get => this.get_SwapButtons()
    }

    /**
     * Gets a value representing the number of buttons on the mouse. If multiple mice are present, it returns the number of buttons of the mouse which has maximum number of buttons.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousecapabilities.numberofbuttons
     * @type {Integer} 
     */
    NumberOfButtons {
        get => this.get_NumberOfButtons()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the MouseCapabilities class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.MouseCapabilities")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MousePresent() {
        if (!this.HasProp("__IMouseCapabilities")) {
            if ((queryResult := this.QueryInterface(IMouseCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseCapabilities := IMouseCapabilities(outPtr)
        }

        return this.__IMouseCapabilities.get_MousePresent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalWheelPresent() {
        if (!this.HasProp("__IMouseCapabilities")) {
            if ((queryResult := this.QueryInterface(IMouseCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseCapabilities := IMouseCapabilities(outPtr)
        }

        return this.__IMouseCapabilities.get_VerticalWheelPresent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalWheelPresent() {
        if (!this.HasProp("__IMouseCapabilities")) {
            if ((queryResult := this.QueryInterface(IMouseCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseCapabilities := IMouseCapabilities(outPtr)
        }

        return this.__IMouseCapabilities.get_HorizontalWheelPresent()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SwapButtons() {
        if (!this.HasProp("__IMouseCapabilities")) {
            if ((queryResult := this.QueryInterface(IMouseCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseCapabilities := IMouseCapabilities(outPtr)
        }

        return this.__IMouseCapabilities.get_SwapButtons()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfButtons() {
        if (!this.HasProp("__IMouseCapabilities")) {
            if ((queryResult := this.QueryInterface(IMouseCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseCapabilities := IMouseCapabilities(outPtr)
        }

        return this.__IMouseCapabilities.get_NumberOfButtons()
    }

;@endregion Instance Methods
}
