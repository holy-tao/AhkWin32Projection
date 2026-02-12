#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToManager.ahk
#Include .\IPlayToManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PlayToManager.ahk
#Include .\PlayToSourceRequestedEventArgs.ahk
#Include .\PlayToSourceSelectedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to Play To capabilities.
 * @remarks
 * If your application includes audio, video, or image elements, users can stream the media source for those elements to a Play To target device. You can use the PlayToManager class to customize the Play To experience for users. You can disable the default behavior by using the [DefaultSourceSelection](playtomanager_defaultsourceselection.md) property.You can select which media is streamed by using the [SourceRequested](playtomanager_sourcerequested.md) event. And you can display the Play To UI in place of the **Devices** charm by using the [ShowPlayToUI](playtomanager_showplaytoui_77103824.md) method.
 * 
 * In Play To, video starts from the current position. If you want to start the video from the beginning, simply seek to the beginning of the video as soon as the Play To connection is established.
 * 
 * PlayTo apps will not be suspended as long as video or music is playing on the Play To receiver or images are continuously sent to the Play To receiver. Apps have approximately 10 seconds to send a new image after the current one is displayed and approximately 10 seconds to send the next audio or video after the current one has ended.
 * 
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtomanager
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the Play To manager for the current view.
     * @remarks
     * You can use the [PlayToManager](playtomanager.md) instance for the current view to establish the Play To contract for the app and customize which media Play To streams to a target device. You supply the media to be streamed during the [SourceRequested](playtomanager_sourcerequested.md) event by using the [SetSource](playtosourcerequest_setsource_1024738425.md) method.
     * @returns {PlayToManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtomanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!PlayToManager.HasProp("__IPlayToManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.PlayTo.PlayToManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayToManagerStatics.IID)
            PlayToManager.__IPlayToManagerStatics := IPlayToManagerStatics(factoryPtr)
        }

        return PlayToManager.__IPlayToManagerStatics.GetForCurrentView()
    }

    /**
     * Displays the Play To UI.
     * @remarks
     * By default, users invoke the **Devices** charm to select a Play To target device to stream media to. You can also display the UI to enable users to select a Play To target device by using the **ShowPlayToUI** method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtomanager.showplaytoui
     */
    static ShowPlayToUI() {
        if (!PlayToManager.HasProp("__IPlayToManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.PlayTo.PlayToManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayToManagerStatics.IID)
            PlayToManager.__IPlayToManagerStatics := IPlayToManagerStatics(factoryPtr)
        }

        return PlayToManager.__IPlayToManagerStatics.ShowPlayToUI()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Enables or disables the default source selection for Play To.
     * @remarks
     * An app that contains media elements has Play To enabled by default. If a user invokes the **Devices** charm while running the app and selects a target device to stream media to, Play To will stream the media from the first audio, video, or image element on the current page. You can disable this default behavior by setting the **DefaultSourceSelection** property to **false**.
     * ```javascript
     * var ptm = Windows.Media.PlayTo.PlayToManager.getForCurrentView();
     * ptm.defaultSourceSelection = false;
     * 
     * ```
     * 
     * 
     * 
     * You can exclude individual HTML elements from the default Play To behavior by adding the **-ms-playToDisabled** attribute in your HTML markup.
     * ```javascript
     * <video src="http://www.example.com/videos/video.mp4" x-ms-playToDisabled/>
     * ```
     * 
     * 
     * 
     * 
     * <!--What about XAML exclusion attribute?-->
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtomanager.defaultsourceselection
     * @type {Boolean} 
     */
    DefaultSourceSelection {
        get => this.get_DefaultSourceSelection()
        set => this.put_DefaultSourceSelection(value)
    }

    /**
     * Occurs when a user requests media to stream to a Play To target device.
     * @remarks
     * The **SourceRequested** event is fired when a user selects the **Devices** charm in a Play To– enabled application. You supply the audio, video, or image that Play To will stream to a target device during the **SourceRequested** event.
     * 
     * If you do not supply a media source within 200 milliseconds, the **SourceRequested** event will time out and the Devices charm will not display any Play To targets for your app.
     * 
     * The **SourceRequested** event occurs before the user selects the target device. After the user has selected the target device, the [SourceSelected](playtomanager_sourceselected.md) event is fired. If the user exits the **Devices** charm without selecting a target device, the [SourceSelected](playtomanager_sourceselected.md) event isn't fired.
     * @type {TypedEventHandler<PlayToManager, PlayToSourceRequestedEventArgs>}
    */
    OnSourceRequested {
        get {
            if(!this.HasProp("__OnSourceRequested")){
                this.__OnSourceRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6ac9f3a4-39b6-51d8-8e08-f137908e922f}"),
                    PlayToManager,
                    PlayToSourceRequestedEventArgs
                )
                this.__OnSourceRequestedToken := this.add_SourceRequested(this.__OnSourceRequested.iface)
            }
            return this.__OnSourceRequested
        }
    }

    /**
     * Occurs when a Play To source element has been selected.
     * @remarks
     * In a Play To– enabled app, the user selects the **Devices** charm (or the Play To UI) to stream audio, video, or images from the app to a target device. The SourceSelected event is fired after the user has selected a target device. If the user exits the **Devices** charm or the Play To UI without selecting a target device, the SourceSelected event isn't fired.
     * @type {TypedEventHandler<PlayToManager, PlayToSourceSelectedEventArgs>}
    */
    OnSourceSelected {
        get {
            if(!this.HasProp("__OnSourceSelected")){
                this.__OnSourceSelected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bf87431a-7451-52a5-a5e2-bfaf408e0c88}"),
                    PlayToManager,
                    PlayToSourceSelectedEventArgs
                )
                this.__OnSourceSelectedToken := this.add_SourceSelected(this.__OnSourceSelected.iface)
            }
            return this.__OnSourceSelected
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSourceRequestedToken")) {
            this.remove_SourceRequested(this.__OnSourceRequestedToken)
            this.__OnSourceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSourceSelectedToken")) {
            this.remove_SourceSelected(this.__OnSourceSelectedToken)
            this.__OnSourceSelected.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToManager, PlayToSourceRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceRequested(handler) {
        if (!this.HasProp("__IPlayToManager")) {
            if ((queryResult := this.QueryInterface(IPlayToManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToManager := IPlayToManager(outPtr)
        }

        return this.__IPlayToManager.add_SourceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceRequested(token) {
        if (!this.HasProp("__IPlayToManager")) {
            if ((queryResult := this.QueryInterface(IPlayToManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToManager := IPlayToManager(outPtr)
        }

        return this.__IPlayToManager.remove_SourceRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToManager, PlayToSourceSelectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceSelected(handler) {
        if (!this.HasProp("__IPlayToManager")) {
            if ((queryResult := this.QueryInterface(IPlayToManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToManager := IPlayToManager(outPtr)
        }

        return this.__IPlayToManager.add_SourceSelected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceSelected(token) {
        if (!this.HasProp("__IPlayToManager")) {
            if ((queryResult := this.QueryInterface(IPlayToManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToManager := IPlayToManager(outPtr)
        }

        return this.__IPlayToManager.remove_SourceSelected(token)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DefaultSourceSelection(value) {
        if (!this.HasProp("__IPlayToManager")) {
            if ((queryResult := this.QueryInterface(IPlayToManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToManager := IPlayToManager(outPtr)
        }

        return this.__IPlayToManager.put_DefaultSourceSelection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DefaultSourceSelection() {
        if (!this.HasProp("__IPlayToManager")) {
            if ((queryResult := this.QueryInterface(IPlayToManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToManager := IPlayToManager(outPtr)
        }

        return this.__IPlayToManager.get_DefaultSourceSelection()
    }

;@endregion Instance Methods
}
