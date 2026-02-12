#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioFrameCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents arguments for an [AudioFrameCompleted](audioframeinputnode_audioframecompleted.md) event.
 * @remarks
 * Get an instance of this class by handling the [AudioFrameInputNode.AudioFrameCompleted](audioframeinputnode_audioframecompleted.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframecompletedeventargs
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class AudioFrameCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioFrameCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioFrameCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the audio frame that was just completed by the [AudioFrameInputNode](audioframeinputnode.md). A frame is completed when all of the audio in the frame has been consumed by the audio graph.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.audioframecompletedeventargs.frame
     * @type {AudioFrame} 
     */
    Frame {
        get => this.get_Frame()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AudioFrame} 
     */
    get_Frame() {
        if (!this.HasProp("__IAudioFrameCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAudioFrameCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrameCompletedEventArgs := IAudioFrameCompletedEventArgs(outPtr)
        }

        return this.__IAudioFrameCompletedEventArgs.get_Frame()
    }

;@endregion Instance Methods
}
