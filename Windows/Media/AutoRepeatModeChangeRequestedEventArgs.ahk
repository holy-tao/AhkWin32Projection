#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutoRepeatModeChangeRequestedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [AutoRepeatModeChangeRequested](systemmediatransportcontrols_autorepeatmodechangerequested.md) event.
 * @remarks
 * Get an instance of this class by handling the [AutoRepeatModeChangeRequested](systemmediatransportcontrols_autorepeatmodechangerequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.autorepeatmodechangerequestedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class AutoRepeatModeChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoRepeatModeChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoRepeatModeChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the requested auto-repeat mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.autorepeatmodechangerequestedeventargs.requestedautorepeatmode
     * @type {Integer} 
     */
    RequestedAutoRepeatMode {
        get => this.get_RequestedAutoRepeatMode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequestedAutoRepeatMode() {
        if (!this.HasProp("__IAutoRepeatModeChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoRepeatModeChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoRepeatModeChangeRequestedEventArgs := IAutoRepeatModeChangeRequestedEventArgs(outPtr)
        }

        return this.__IAutoRepeatModeChangeRequestedEventArgs.get_RequestedAutoRepeatMode()
    }

;@endregion Instance Methods
}
