#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayEnhancementOverrideCapabilitiesChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the arguments returned by the event raised when the display enhancement override changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverridecapabilitieschangedeventargs
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayEnhancementOverrideCapabilitiesChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayEnhancementOverrideCapabilitiesChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayEnhancementOverrideCapabilitiesChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display enhancement override capabilities that have changed.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayenhancementoverridecapabilitieschangedeventargs.capabilities
     * @type {DisplayEnhancementOverrideCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DisplayEnhancementOverrideCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__IDisplayEnhancementOverrideCapabilitiesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayEnhancementOverrideCapabilitiesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayEnhancementOverrideCapabilitiesChangedEventArgs := IDisplayEnhancementOverrideCapabilitiesChangedEventArgs(outPtr)
        }

        return this.__IDisplayEnhancementOverrideCapabilitiesChangedEventArgs.get_Capabilities()
    }

;@endregion Instance Methods
}
