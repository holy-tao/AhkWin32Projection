#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFrameFocusCapabilities.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about the focus capabilities of the capture device for frames in a variable photo sequences.
 * @remarks
 * Get an instance of this class by accessing the [Focus](framecontrolcapabilities_focus.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscapabilities
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class FrameFocusCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameFocusCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameFocusCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates if the capture device supports the focus control for frames in a variable photo sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscapabilities.supported
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * Gets the minimum focus length supported by the capture device for a frame in a variable photo sequence, specified in millimeters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscapabilities.min
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * Gets the maximum focus length supported by the capture device for a frame in a variable photo sequence, specified in millimeters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscapabilities.max
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * Gets the smallest focus increment supported by the capture device for a frame in a variable photo sequence, specified in millimeters.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.core.framefocuscapabilities.step
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
        if (!this.HasProp("__IFrameFocusCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFocusCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFocusCapabilities := IFrameFocusCapabilities(outPtr)
        }

        return this.__IFrameFocusCapabilities.get_Supported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        if (!this.HasProp("__IFrameFocusCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFocusCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFocusCapabilities := IFrameFocusCapabilities(outPtr)
        }

        return this.__IFrameFocusCapabilities.get_Min()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        if (!this.HasProp("__IFrameFocusCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFocusCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFocusCapabilities := IFrameFocusCapabilities(outPtr)
        }

        return this.__IFrameFocusCapabilities.get_Max()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        if (!this.HasProp("__IFrameFocusCapabilities")) {
            if ((queryResult := this.QueryInterface(IFrameFocusCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameFocusCapabilities := IFrameFocusCapabilities(outPtr)
        }

        return this.__IFrameFocusCapabilities.get_Step()
    }

;@endregion Instance Methods
}
