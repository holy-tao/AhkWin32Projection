#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTransportControlsThumbnailRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the MediaTransportControls.ThumbnailRequested event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.mediatransportcontrolsthumbnailrequestedeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class MediaTransportControlsThumbnailRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTransportControlsThumbnailRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTransportControlsThumbnailRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the source of the thumbnail image.
     * @param {IInputStream} source The source of the thumbnail image.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.mediatransportcontrolsthumbnailrequestedeventargs.setthumbnailimage
     */
    SetThumbnailImage(source) {
        if (!this.HasProp("__IMediaTransportControlsThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControlsThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControlsThumbnailRequestedEventArgs := IMediaTransportControlsThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IMediaTransportControlsThumbnailRequestedEventArgs.SetThumbnailImage(source)
    }

    /**
     * Returns a deferral that can be used to defer the completion of the ThumbnailRequested event while the thumbnail is generated.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.mediatransportcontrolsthumbnailrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaTransportControlsThumbnailRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControlsThumbnailRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControlsThumbnailRequestedEventArgs := IMediaTransportControlsThumbnailRequestedEventArgs(outPtr)
        }

        return this.__IMediaTransportControlsThumbnailRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
