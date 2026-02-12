#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCaptureDurationGeneratedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppCaptureRecordOperation.DurationGenerated](./appcapturerecordoperation_durationgenerated.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturedurationgeneratedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppCaptureDurationGeneratedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCaptureDurationGeneratedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCaptureDurationGeneratedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the duration associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appcapturedurationgeneratedeventargs.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IAppCaptureDurationGeneratedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppCaptureDurationGeneratedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppCaptureDurationGeneratedEventArgs := IAppCaptureDurationGeneratedEventArgs(outPtr)
        }

        return this.__IAppCaptureDurationGeneratedEventArgs.get_Duration()
    }

;@endregion Instance Methods
}
