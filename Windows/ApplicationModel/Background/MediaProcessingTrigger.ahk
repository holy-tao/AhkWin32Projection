#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaProcessingTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task for performing media processing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.mediaprocessingtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class MediaProcessingTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaProcessingTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaProcessingTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaProcessingTrigger](mediaprocessingtrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.MediaProcessingTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Triggers the background task with the provided collection of arguments and returns a [MediaProcessingTriggerResult](mediaprocessingtriggerresult.md) indicating success or failure of the trigger request.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.mediaprocessingtrigger.requestasync
     */
    RequestAsync() {
        if (!this.HasProp("__IMediaProcessingTrigger")) {
            if ((queryResult := this.QueryInterface(IMediaProcessingTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProcessingTrigger := IMediaProcessingTrigger(outPtr)
        }

        return this.__IMediaProcessingTrigger.RequestAsync()
    }

    /**
     * Triggers the background task and returns a [MediaProcessingTriggerResult](mediaprocessingtriggerresult.md) indicating success or failure of the trigger request.
     * @param {ValueSet} arguments 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.mediaprocessingtrigger.requestasync
     */
    RequestAsyncWithArguments(arguments) {
        if (!this.HasProp("__IMediaProcessingTrigger")) {
            if ((queryResult := this.QueryInterface(IMediaProcessingTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaProcessingTrigger := IMediaProcessingTrigger(outPtr)
        }

        return this.__IMediaProcessingTrigger.RequestAsyncWithArguments(arguments)
    }

;@endregion Instance Methods
}
