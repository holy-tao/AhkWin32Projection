#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaCaptureFocusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [FocusChanged](mediacapture_focuschanged.md) event.
 * @remarks
 * Handle the [MediaCapture.FocusChanged](mediacapture_focuschanged.md) event to obtain an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturefocuschangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class MediaCaptureFocusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaCaptureFocusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaCaptureFocusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current focus state of the capture device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.mediacapturefocuschangedeventargs.focusstate
     * @type {Integer} 
     */
    FocusState {
        get => this.get_FocusState()
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
    get_FocusState() {
        if (!this.HasProp("__IMediaCaptureFocusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaCaptureFocusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaCaptureFocusChangedEventArgs := IMediaCaptureFocusChangedEventArgs(outPtr)
        }

        return this.__IMediaCaptureFocusChangedEventArgs.get_FocusState()
    }

;@endregion Instance Methods
}
