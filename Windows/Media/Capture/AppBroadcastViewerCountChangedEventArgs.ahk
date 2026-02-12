#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastViewerCountChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastViewerCountChanged](./appbroadcaststate_viewercountchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastviewercountchangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastViewerCountChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastViewerCountChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastViewerCountChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new viewer count.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastviewercountchangedeventargs.viewercount
     * @type {Integer} 
     */
    ViewerCount {
        get => this.get_ViewerCount()
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
    get_ViewerCount() {
        if (!this.HasProp("__IAppBroadcastViewerCountChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastViewerCountChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastViewerCountChangedEventArgs := IAppBroadcastViewerCountChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastViewerCountChangedEventArgs.get_ViewerCount()
    }

;@endregion Instance Methods
}
