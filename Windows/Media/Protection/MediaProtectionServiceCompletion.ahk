#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaProtectionServiceCompletion.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains a method that indicates whether a protection service has completed successfully.
 * @remarks
 * To get an instance of this object, call either the [ComponentLoadFailedEventArgs.Completion](componentloadfailedeventargs_completion.md) or [ServiceRequestedEventArgs.Completion](servicerequestedeventargs_completion.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionservicecompletion
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class MediaProtectionServiceCompletion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaProtectionServiceCompletion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaProtectionServiceCompletion.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Indicates whether a protection service has completed successfully.
     * @remarks
     * This method completes the interaction with the service request or component load failure. It should only be called when an interaction with the service request object or handling of component load failures is completed. If this method is not called at that time the media playback system will be stalled indefinitely.
     * @param {Boolean} success Indicates the successful completion of a protection service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.mediaprotectionservicecompletion.complete
     */
    Complete(success) {
        if (!this.HasProp("__IMediaProtectionServiceCompletion")) {
            if ((queryResult := this.QueryInterface(IMediaProtectionServiceCompletion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProtectionServiceCompletion := IMediaProtectionServiceCompletion(outPtr)
        }

        return this.__IMediaProtectionServiceCompletion.Complete(success)
    }

;@endregion Instance Methods
}
