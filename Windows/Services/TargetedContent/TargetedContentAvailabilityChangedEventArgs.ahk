#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentAvailabilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [TargetedContentSubscription.AvailabilityChanged](targetedcontentsubscription_availabilitychanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentavailabilitychangedeventargs
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentAvailabilityChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentAvailabilityChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentAvailabilityChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Represents the arguments for the [TargetedContentSubscription.AvailabilityChanged](targetedcontentsubscription_availabilitychanged.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentavailabilitychangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ITargetedContentAvailabilityChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITargetedContentAvailabilityChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentAvailabilityChangedEventArgs := ITargetedContentAvailabilityChangedEventArgs(outPtr)
        }

        return this.__ITargetedContentAvailabilityChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
