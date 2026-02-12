#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioGraphUnrecoverableErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents arguments for an [UnrecoverableErrorOccurred](audiograph_unrecoverableerroroccurred.md) event.
 * @remarks
 * Get an instance of this class by handling the [UnrecoverableErrorOccurred](audiograph_unrecoverableerroroccurred.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographunrecoverableerroroccurredeventargs
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioGraphUnrecoverableErrorOccurredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioGraphUnrecoverableErrorOccurredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioGraphUnrecoverableErrorOccurredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audiographunrecoverableerroroccurredeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
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
    get_Error() {
        if (!this.HasProp("__IAudioGraphUnrecoverableErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IAudioGraphUnrecoverableErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioGraphUnrecoverableErrorOccurredEventArgs := IAudioGraphUnrecoverableErrorOccurredEventArgs(outPtr)
        }

        return this.__IAudioGraphUnrecoverableErrorOccurredEventArgs.get_Error()
    }

;@endregion Instance Methods
}
