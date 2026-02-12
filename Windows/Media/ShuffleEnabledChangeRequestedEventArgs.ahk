#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShuffleEnabledChangeRequestedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides data for the [ShuffleEnabledChangeRequested](systemmediatransportcontrols_shuffleenabledchangerequested.md) event.
 * @remarks
 * Get an instance of this class by handling the [ShuffleEnabledChangeRequested](systemmediatransportcontrols_shuffleenabledchangerequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.shuffleenabledchangerequestedeventargs
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class ShuffleEnabledChangeRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShuffleEnabledChangeRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShuffleEnabledChangeRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether the request is to enable or disable shuffle.
     * @see https://learn.microsoft.com/uwp/api/windows.media.shuffleenabledchangerequestedeventargs.requestedshuffleenabled
     * @type {Boolean} 
     */
    RequestedShuffleEnabled {
        get => this.get_RequestedShuffleEnabled()
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
    get_RequestedShuffleEnabled() {
        if (!this.HasProp("__IShuffleEnabledChangeRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IShuffleEnabledChangeRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShuffleEnabledChangeRequestedEventArgs := IShuffleEnabledChangeRequestedEventArgs(outPtr)
        }

        return this.__IShuffleEnabledChangeRequestedEventArgs.get_RequestedShuffleEnabled()
    }

;@endregion Instance Methods
}
