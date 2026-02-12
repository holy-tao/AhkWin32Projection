#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaProcessingTriggerDetails.ahk
#Include ..\..\Guid.ahk

/**
 * Provides a media processing background task access to the set of arguments supplied in the call to [MediaProcessingTrigger.RequestAsync](../windows.applicationmodel.background/mediaprocessingtrigger_requestasync_1089362155.md).
 * @remarks
 * Get an instance of this class by casting the [TriggerDetails](../windows.applicationmodel.background/ibackgroundtaskinstance_triggerdetails.md) property of the [IBackgroundTaskInstance](../windows.applicationmodel.background/ibackgroundtaskinstance.md) object, which is passed into the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method of your background task, to a **MediaProcessingTriggerDetails** object.
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaprocessingtriggerdetails
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaProcessingTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaProcessingTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaProcessingTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value set containing the arguments supplied in the call to [MediaProcessingTrigger.RequestAsync](../windows.applicationmodel.background/mediaprocessingtrigger_requestasync_1089362155.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediaprocessingtriggerdetails.arguments
     * @type {ValueSet} 
     */
    Arguments {
        get => this.get_Arguments()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Arguments() {
        if (!this.HasProp("__IMediaProcessingTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IMediaProcessingTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProcessingTriggerDetails := IMediaProcessingTriggerDetails(outPtr)
        }

        return this.__IMediaProcessingTriggerDetails.get_Arguments()
    }

;@endregion Instance Methods
}
