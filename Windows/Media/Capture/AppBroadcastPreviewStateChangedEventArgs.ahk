#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPreviewStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [AppBroadcastPreview.PreviewStateChanged](./appbroadcastpreview_previewstatechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstatechangedeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPreviewStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPreviewStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPreviewStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new state of the app broadcast preview.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstatechangedeventargs.previewstate
     * @type {Integer} 
     */
    PreviewState {
        get => this.get_PreviewState()
    }

    /**
     * Gets the error code associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreviewstatechangedeventargs.errorcode
     * @type {Integer} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
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
    get_PreviewState() {
        if (!this.HasProp("__IAppBroadcastPreviewStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStateChangedEventArgs := IAppBroadcastPreviewStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastPreviewStateChangedEventArgs.get_PreviewState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppBroadcastPreviewStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreviewStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreviewStateChangedEventArgs := IAppBroadcastPreviewStateChangedEventArgs(outPtr)
        }

        return this.__IAppBroadcastPreviewStateChangedEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
