#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDownloadBitrateChangedEventArgs.ahk
#Include .\IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [DownloadBitrateChanged](adaptivemediasource_downloadbitratechanged.md) event.
 * @remarks
 * Obtain an instance of this class by implementing a handler for the [DownloadBitrateChanged](adaptivemediasource_downloadbitratechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadbitratechangedeventargs
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadBitrateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDownloadBitrateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDownloadBitrateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the previous download bitrate for the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadbitratechangedeventargs.oldvalue
     * @type {Integer} 
     */
    OldValue {
        get => this.get_OldValue()
    }

    /**
     * Gets a value indicating the new download bitrate for the media source.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadbitratechangedeventargs.newvalue
     * @type {Integer} 
     */
    NewValue {
        get => this.get_NewValue()
    }

    /**
     * Gets a value specifying the reason that the download bitrate changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadbitratechangedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
    get_OldValue() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadBitrateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs := IAdaptiveMediaSourceDownloadBitrateChangedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs.get_OldValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewValue() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadBitrateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs := IAdaptiveMediaSourceDownloadBitrateChangedEventArgs(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs.get_NewValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2 := IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2(outPtr)
        }

        return this.__IAdaptiveMediaSourceDownloadBitrateChangedEventArgs2.get_Reason()
    }

;@endregion Instance Methods
}
