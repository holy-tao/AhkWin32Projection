#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInfraredMediaFrame.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a [VideoMediaFrame](videomediaframe.md) that contains infrared video data.
 * @remarks
 * Get an instance of this class by accessing the InfraredMediaFrame property of the [VideoMediaFrame](videomediaframe.md) class.
 * 
 * For how-to guidance on using [MediaFrameSource](mediaframesource.md) to capture frames, see [Process media frames with MediaFrameReader](/windows/uwp/audio-video-camera/process-media-frames-with-mediaframereader).
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.infraredmediaframe
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class InfraredMediaFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInfraredMediaFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInfraredMediaFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaFrameReference](mediaframereference.md) wrapper object associated with the [InfraredMediaFrame](infraredmediaframe.md), which provides access to format information and other properties of the media frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.infraredmediaframe.framereference
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * Gets the [VideoMediaFrame](videomediaframe.md) associated with the [InfraredMediaFrame](infraredmediaframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.infraredmediaframe.videomediaframe
     * @type {VideoMediaFrame} 
     */
    VideoMediaFrame {
        get => this.get_VideoMediaFrame()
    }

    /**
     * Gets a value specifying whether the infrared media frame is illuminated.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.infraredmediaframe.isilluminated
     * @type {Boolean} 
     */
    IsIlluminated {
        get => this.get_IsIlluminated()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    get_FrameReference() {
        if (!this.HasProp("__IInfraredMediaFrame")) {
            if ((queryResult := this.QueryInterface(IInfraredMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredMediaFrame := IInfraredMediaFrame(outPtr)
        }

        return this.__IInfraredMediaFrame.get_FrameReference()
    }

    /**
     * 
     * @returns {VideoMediaFrame} 
     */
    get_VideoMediaFrame() {
        if (!this.HasProp("__IInfraredMediaFrame")) {
            if ((queryResult := this.QueryInterface(IInfraredMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredMediaFrame := IInfraredMediaFrame(outPtr)
        }

        return this.__IInfraredMediaFrame.get_VideoMediaFrame()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIlluminated() {
        if (!this.HasProp("__IInfraredMediaFrame")) {
            if ((queryResult := this.QueryInterface(IInfraredMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInfraredMediaFrame := IInfraredMediaFrame(outPtr)
        }

        return this.__IInfraredMediaFrame.get_IsIlluminated()
    }

;@endregion Instance Methods
}
