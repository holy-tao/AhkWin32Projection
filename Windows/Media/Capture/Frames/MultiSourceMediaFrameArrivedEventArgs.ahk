#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMultiSourceMediaFrameArrivedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [MultiSourceMediaFrameReader.FrameArrived](multisourcemediaframereader_framearrived.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.multisourcemediaframearrivedeventargs
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class MultiSourceMediaFrameArrivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMultiSourceMediaFrameArrivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMultiSourceMediaFrameArrivedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
