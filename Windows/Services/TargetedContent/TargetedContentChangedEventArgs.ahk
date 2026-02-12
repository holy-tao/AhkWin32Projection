#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the arguments for the [TargetedContentSubscription.ContentChanged](targetedcontentsubscription_contentchanged.md) Content Changed event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentchangedeventargs
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a boolean value indicating if the previous content for this event has expired.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentchangedeventargs.haspreviouscontentexpired
     * @type {Boolean} 
     */
    HasPreviousContentExpired {
        get => this.get_HasPreviousContentExpired()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the deferral. Required for async handlers. The caller is responsible for calling Complete when the event is handled.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentchangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ITargetedContentChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITargetedContentChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentChangedEventArgs := ITargetedContentChangedEventArgs(outPtr)
        }

        return this.__ITargetedContentChangedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPreviousContentExpired() {
        if (!this.HasProp("__ITargetedContentChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITargetedContentChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentChangedEventArgs := ITargetedContentChangedEventArgs(outPtr)
        }

        return this.__ITargetedContentChangedEventArgs.get_HasPreviousContentExpired()
    }

;@endregion Instance Methods
}
