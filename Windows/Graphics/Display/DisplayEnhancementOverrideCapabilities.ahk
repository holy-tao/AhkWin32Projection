#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayEnhancementOverrideCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes the capabilities of a display enhancement override object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverridecapabilities
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayEnhancementOverrideCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayEnhancementOverrideCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayEnhancementOverrideCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that describes whether brightness control is currently supported.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverridecapabilities.isbrightnesscontrolsupported
     * @type {Boolean} 
     */
    IsBrightnessControlSupported {
        get => this.get_IsBrightnessControlSupported()
    }

    /**
     * Gets a value that describes whether brightness control in nits is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverridecapabilities.isbrightnessnitscontrolsupported
     * @type {Boolean} 
     */
    IsBrightnessNitsControlSupported {
        get => this.get_IsBrightnessNitsControlSupported()
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
    get_IsBrightnessControlSupported() {
        if (!this.HasProp("__IDisplayEnhancementOverrideCapabilities")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverrideCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverrideCapabilities := IDisplayEnhancementOverrideCapabilities(outPtr)
        }

        return this.__IDisplayEnhancementOverrideCapabilities.get_IsBrightnessControlSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBrightnessNitsControlSupported() {
        if (!this.HasProp("__IDisplayEnhancementOverrideCapabilities")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverrideCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverrideCapabilities := IDisplayEnhancementOverrideCapabilities(outPtr)
        }

        return this.__IDisplayEnhancementOverrideCapabilities.get_IsBrightnessNitsControlSupported()
    }

    /**
     * Retrieves the supported nit ranges.
     * @returns {IVectorView<NitRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverridecapabilities.getsupportednitranges
     */
    GetSupportedNitRanges() {
        if (!this.HasProp("__IDisplayEnhancementOverrideCapabilities")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverrideCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverrideCapabilities := IDisplayEnhancementOverrideCapabilities(outPtr)
        }

        return this.__IDisplayEnhancementOverrideCapabilities.GetSupportedNitRanges()
    }

;@endregion Instance Methods
}
