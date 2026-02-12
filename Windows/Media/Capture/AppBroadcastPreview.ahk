#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppBroadcastPreview.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppBroadcastPreview.ahk
#Include .\AppBroadcastPreviewStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides status information and access to the app broadcast preview. 
  * 
  * > [!NOTE]
  * > This API requires the **appBroadcast** and **appBroadcastSettings** capability which is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime.
 * @remarks
 * This API may throw an error if the background service has shut down due to idle timeout.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreview
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastPreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBroadcastPreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBroadcastPreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the state of the app broadcast preview.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreview.previewstate
     * @type {Integer} 
     */
    PreviewState {
        get => this.get_PreviewState()
    }

    /**
     * Gets the error code associated with the app broadcast preview.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreview.errorcode
     * @type {IReference<Integer>} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets a stream reader for the app broadcast preview.
     * @remarks
     * This API may throw an error if the background service has shut down due to idle timeout.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreview.previewstreamreader
     * @type {AppBroadcastPreviewStreamReader} 
     */
    PreviewStreamReader {
        get => this.get_PreviewStreamReader()
    }

    /**
     * Occurs when the state of the app broadcast preview changes.
     * @type {TypedEventHandler<AppBroadcastPreview, AppBroadcastPreviewStateChangedEventArgs>}
    */
    OnPreviewStateChanged {
        get {
            if(!this.HasProp("__OnPreviewStateChanged")){
                this.__OnPreviewStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{41d8b8e1-dce7-5ebc-940f-de7dd2a62ab5}"),
                    AppBroadcastPreview,
                    AppBroadcastPreviewStateChangedEventArgs
                )
                this.__OnPreviewStateChangedToken := this.add_PreviewStateChanged(this.__OnPreviewStateChanged.iface)
            }
            return this.__OnPreviewStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPreviewStateChangedToken")) {
            this.remove_PreviewStateChanged(this.__OnPreviewStateChangedToken)
            this.__OnPreviewStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Stop the app broadcast preview.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastpreview.stoppreview
     */
    StopPreview() {
        if (!this.HasProp("__IAppBroadcastPreview")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreview := IAppBroadcastPreview(outPtr)
        }

        return this.__IAppBroadcastPreview.StopPreview()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviewState() {
        if (!this.HasProp("__IAppBroadcastPreview")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreview := IAppBroadcastPreview(outPtr)
        }

        return this.__IAppBroadcastPreview.get_PreviewState()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppBroadcastPreview")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreview := IAppBroadcastPreview(outPtr)
        }

        return this.__IAppBroadcastPreview.get_ErrorCode()
    }

    /**
     * 
     * @param {TypedEventHandler<AppBroadcastPreview, AppBroadcastPreviewStateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PreviewStateChanged(value) {
        if (!this.HasProp("__IAppBroadcastPreview")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreview := IAppBroadcastPreview(outPtr)
        }

        return this.__IAppBroadcastPreview.add_PreviewStateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PreviewStateChanged(token) {
        if (!this.HasProp("__IAppBroadcastPreview")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreview := IAppBroadcastPreview(outPtr)
        }

        return this.__IAppBroadcastPreview.remove_PreviewStateChanged(token)
    }

    /**
     * 
     * @returns {AppBroadcastPreviewStreamReader} 
     */
    get_PreviewStreamReader() {
        if (!this.HasProp("__IAppBroadcastPreview")) {
            if ((queryResult := this.QueryInterface(IAppBroadcastPreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBroadcastPreview := IAppBroadcastPreview(outPtr)
        }

        return this.__IAppBroadcastPreview.get_PreviewStreamReader()
    }

;@endregion Instance Methods
}
