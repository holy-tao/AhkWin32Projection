#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToReceiver.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PlayToReceiver.ahk
#Include .\SourceChangeRequestedEventArgs.ahk
#Include .\PlaybackRateChangeRequestedEventArgs.ahk
#Include .\CurrentTimeChangeRequestedEventArgs.ahk
#Include .\MuteChangeRequestedEventArgs.ahk
#Include .\VolumeChangeRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Play To target.
 * @remarks
 * You can use the PlayToReceiver class to create a custom software Play To receiver that is a digital media renderer for computers on your network. You can include a PlayToReceiver object in your app to handle communication with Play To client computers, and then play or display content streamed from those computers using your own media elements or controls.
 * 
 * The members of the PlayToReceiver class consist of the following:
 * + The [FriendlyName](playtoreceiver_friendlyname.md) property that identifies the name of the Play To receiver when it is advertised on the network.
 * + Properties that identify the type of media that your Play To receiver supports: [SupportsAudio](playtoreceiver_supportsaudio.md), [SupportsVideo](playtoreceiver_supportsvideo.md), [SupportsImage](playtoreceiver_supportsimage.md).
 * + The [StartAsync](playtoreceiver_startasync_1931900819.md) method that starts the Play To receiver and advertises it on the network as a digital media renderer. The [StopAsync](playtoreceiver_stopasync_1648475005.md) method that stops the Play To receiver and stops advertising it on the network.
 * + The [SourceChangeRequested](playtoreceiver_sourcechangerequested.md) event that occurs when you receive a media stream from a computer, and events that occur when an action is requested by the Play To client computer such as a volume change, or a change in the playback location of the streamed media: [CurrentTimeChangeRequested](playtoreceiver_currenttimechangerequested.md), [MuteChangeRequested](playtoreceiver_mutechangerequested.md), [PauseRequested](playtoreceiver_pauserequested.md), [PlayRequested](playtoreceiver_playrequested.md), [StopRequested](playtoreceiver_stoprequested.md), [VolumeChangeRequested](playtoreceiver_volumechangerequested.md), [TimeUpdateRequested](playtoreceiver_timeupdaterequested.md).
 * + Methods that you can call to notify the Play To client when a change occurs for your Play To receiver: [NotifyDurationChange](playtoreceiver_notifydurationchange_1632513681.md), [NotifyEnded](playtoreceiver_notifyended_887919507.md), [NotifyError](playtoreceiver_notifyerror_1157154443.md), [NotifyLoadedMetadata](playtoreceiver_notifyloadedmetadata_50414725.md), [NotifyPaused](playtoreceiver_notifypaused_1175515486.md), [NotifyPlaying](playtoreceiver_notifyplaying_1675840659.md), [NotifyRateChange](playtoreceiver_notifyratechange_1422145476.md), [NotifySeeked](playtoreceiver_notifyseeked_1986074253.md), [NotifySeeking](playtoreceiver_notifyseeking_930196462.md), [NotifyStopped](playtoreceiver_notifystopped_1831716120.md), [NotifyTimeUpdate](playtoreceiver_notifytimeupdate_1370613405.md), [NotifyVolumeChange](playtoreceiver_notifyvolumechange_378380103.md).
 * 
 * 
 * In Play To, video starts from the current position. If you want to start the video from the beginning, simply seek to the beginning of the video as soon as the Play To connection is established.
 * 
 * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
 * 
 * [!code-csharp[StartAndStop](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetStartAndStop)]
 * 
 * [!code-vb[StartAndStop](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetStartAndStop)]
 * 
 * PlayTo apps will not be suspended as long as video or music is playing on the Play To receiver or images are continuously sent to the Play To receiver. Apps have approximately 10 seconds to send a new image after the current one is displayed and approximately 10 seconds to send the next audio or video after the current one has ended.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToReceiver extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToReceiver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToReceiver.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the display name of the Play To target.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * Gets or sets a value that indicates whether the Play To target supports images.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.supportsimage
     * @type {Boolean} 
     */
    SupportsImage {
        get => this.get_SupportsImage()
        set => this.put_SupportsImage(value)
    }

    /**
     * Gets or sets a value that indicates whether the Play To target supports audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.supportsaudio
     * @type {Boolean} 
     */
    SupportsAudio {
        get => this.get_SupportsAudio()
        set => this.put_SupportsAudio(value)
    }

    /**
     * Gets or sets a value that indicates whether the Play To target supports video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.supportsvideo
     * @type {Boolean} 
     */
    SupportsVideo {
        get => this.get_SupportsVideo()
        set => this.put_SupportsVideo(value)
    }

    /**
     * Gets a set of custom properties for the Play To receiver.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Occurs when audio or video playback starts.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[PlayRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetPlayRequested)]
     * 
     * [!code-vb[PlayRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetPlayRequested)]
     * @type {TypedEventHandler<PlayToReceiver, IInspectable>}
    */
    OnPlayRequested {
        get {
            if(!this.HasProp("__OnPlayRequested")){
                this.__OnPlayRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7a89b9c2-78d4-5866-88f1-4cdc0a0e75b8}"),
                    PlayToReceiver,
                    IInspectable
                )
                this.__OnPlayRequestedToken := this.add_PlayRequested(this.__OnPlayRequested.iface)
            }
            return this.__OnPlayRequested
        }
    }

    /**
     * Occurs when audio or video playback has been paused.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[PauseRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetPauseRequested)]
     * 
     * [!code-vb[PauseRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetPauseRequested)]
     * @type {TypedEventHandler<PlayToReceiver, IInspectable>}
    */
    OnPauseRequested {
        get {
            if(!this.HasProp("__OnPauseRequested")){
                this.__OnPauseRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7a89b9c2-78d4-5866-88f1-4cdc0a0e75b8}"),
                    PlayToReceiver,
                    IInspectable
                )
                this.__OnPauseRequestedToken := this.add_PauseRequested(this.__OnPauseRequested.iface)
            }
            return this.__OnPauseRequested
        }
    }

    /**
     * Occurs when the source media for the Play To receiver have changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[SourceChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetSourceChangeRequested)]
     * 
     * [!code-vb[SourceChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetSourceChangeRequested)]
     * @type {TypedEventHandler<PlayToReceiver, SourceChangeRequestedEventArgs>}
    */
    OnSourceChangeRequested {
        get {
            if(!this.HasProp("__OnSourceChangeRequested")){
                this.__OnSourceChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1466d074-b7b4-5814-b2d7-847c5ae7d87d}"),
                    PlayToReceiver,
                    SourceChangeRequestedEventArgs
                )
                this.__OnSourceChangeRequestedToken := this.add_SourceChangeRequested(this.__OnSourceChangeRequested.iface)
            }
            return this.__OnSourceChangeRequested
        }
    }

    /**
     * Occurs when the rate of audio or video playback has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[PlaybackRateChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetPlaybackRateChangeRequested)]
     * 
     * 
     * [!code-vb[PlaybackRateChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetPlaybackRateChangeRequested)]
     * @type {TypedEventHandler<PlayToReceiver, PlaybackRateChangeRequestedEventArgs>}
    */
    OnPlaybackRateChangeRequested {
        get {
            if(!this.HasProp("__OnPlaybackRateChangeRequested")){
                this.__OnPlaybackRateChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e7594396-58c3-5316-bc4f-1d13eadbeffd}"),
                    PlayToReceiver,
                    PlaybackRateChangeRequestedEventArgs
                )
                this.__OnPlaybackRateChangeRequestedToken := this.add_PlaybackRateChangeRequested(this.__OnPlaybackRateChangeRequested.iface)
            }
            return this.__OnPlaybackRateChangeRequested
        }
    }

    /**
     * Occurs when the time location of the playback has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[CurrentTimeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetCurrentTimeChangeRequested)]
     * 
     * [!code-vb[CurrentTimeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetCurrentTimeChangeRequested)]
     * @type {TypedEventHandler<PlayToReceiver, CurrentTimeChangeRequestedEventArgs>}
    */
    OnCurrentTimeChangeRequested {
        get {
            if(!this.HasProp("__OnCurrentTimeChangeRequested")){
                this.__OnCurrentTimeChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{42abdf9f-14a6-5c1f-839b-86029505b1d0}"),
                    PlayToReceiver,
                    CurrentTimeChangeRequestedEventArgs
                )
                this.__OnCurrentTimeChangeRequestedToken := this.add_CurrentTimeChangeRequested(this.__OnCurrentTimeChangeRequested.iface)
            }
            return this.__OnCurrentTimeChangeRequested
        }
    }

    /**
     * Occurs when the audio has been muted or unmuted.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[MuteChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetMuteChangeRequested)]
     * 
     * [!code-vb[MuteChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetMuteChangeRequested)]
     * @type {TypedEventHandler<PlayToReceiver, MuteChangeRequestedEventArgs>}
    */
    OnMuteChangeRequested {
        get {
            if(!this.HasProp("__OnMuteChangeRequested")){
                this.__OnMuteChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0674cf85-b6fd-5926-9b72-35fe517a3f44}"),
                    PlayToReceiver,
                    MuteChangeRequestedEventArgs
                )
                this.__OnMuteChangeRequestedToken := this.add_MuteChangeRequested(this.__OnMuteChangeRequested.iface)
            }
            return this.__OnMuteChangeRequested
        }
    }

    /**
     * Occurs when the volume for the source audio or video has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[VolumeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetVolumeChangeRequested)]
     * 
     * [!code-vb[VolumeChangeRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetVolumeChangeRequested)]
     * @type {TypedEventHandler<PlayToReceiver, VolumeChangeRequestedEventArgs>}
    */
    OnVolumeChangeRequested {
        get {
            if(!this.HasProp("__OnVolumeChangeRequested")){
                this.__OnVolumeChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9c3f7c84-9b4d-5cdc-8144-1c2f617b6ede}"),
                    PlayToReceiver,
                    VolumeChangeRequestedEventArgs
                )
                this.__OnVolumeChangeRequestedToken := this.add_VolumeChangeRequested(this.__OnVolumeChangeRequested.iface)
            }
            return this.__OnVolumeChangeRequested
        }
    }

    /**
     * Occurs when the current playback position has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[TimeUpdateRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetTimeUpdateRequested)]
     * 
     * [!code-vb[TimeUpdateRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetTimeUpdateRequested)]
     * @type {TypedEventHandler<PlayToReceiver, IInspectable>}
    */
    OnTimeUpdateRequested {
        get {
            if(!this.HasProp("__OnTimeUpdateRequested")){
                this.__OnTimeUpdateRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7a89b9c2-78d4-5866-88f1-4cdc0a0e75b8}"),
                    PlayToReceiver,
                    IInspectable
                )
                this.__OnTimeUpdateRequestedToken := this.add_TimeUpdateRequested(this.__OnTimeUpdateRequested.iface)
            }
            return this.__OnTimeUpdateRequested
        }
    }

    /**
     * Occurs when a request has been made for the Play To receiver to stop playing the streamed media.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[StopRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetStopRequested)]
     * 
     * [!code-vb[StopRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetStopRequested)]
     * @type {TypedEventHandler<PlayToReceiver, IInspectable>}
    */
    OnStopRequested {
        get {
            if(!this.HasProp("__OnStopRequested")){
                this.__OnStopRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7a89b9c2-78d4-5866-88f1-4cdc0a0e75b8}"),
                    PlayToReceiver,
                    IInspectable
                )
                this.__OnStopRequestedToken := this.add_StopRequested(this.__OnStopRequested.iface)
            }
            return this.__OnStopRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of a Play To receiver.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[StartAndStop](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetStartAndStop)]
     * 
     * [!code-vb[StartAndStop](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetStartAndStop)]
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.PlayTo.PlayToReceiver")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPlayRequestedToken")) {
            this.remove_PlayRequested(this.__OnPlayRequestedToken)
            this.__OnPlayRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPauseRequestedToken")) {
            this.remove_PauseRequested(this.__OnPauseRequestedToken)
            this.__OnPauseRequested.iface.Dispose()
        }

        if(this.HasProp("__OnSourceChangeRequestedToken")) {
            this.remove_SourceChangeRequested(this.__OnSourceChangeRequestedToken)
            this.__OnSourceChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackRateChangeRequestedToken")) {
            this.remove_PlaybackRateChangeRequested(this.__OnPlaybackRateChangeRequestedToken)
            this.__OnPlaybackRateChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnCurrentTimeChangeRequestedToken")) {
            this.remove_CurrentTimeChangeRequested(this.__OnCurrentTimeChangeRequestedToken)
            this.__OnCurrentTimeChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnMuteChangeRequestedToken")) {
            this.remove_MuteChangeRequested(this.__OnMuteChangeRequestedToken)
            this.__OnMuteChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnVolumeChangeRequestedToken")) {
            this.remove_VolumeChangeRequested(this.__OnVolumeChangeRequestedToken)
            this.__OnVolumeChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnTimeUpdateRequestedToken")) {
            this.remove_TimeUpdateRequested(this.__OnTimeUpdateRequestedToken)
            this.__OnTimeUpdateRequested.iface.Dispose()
        }

        if(this.HasProp("__OnStopRequestedToken")) {
            this.remove_StopRequested(this.__OnStopRequestedToken)
            this.__OnStopRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlayRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_PlayRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlayRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_PlayRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PauseRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_PauseRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PauseRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_PauseRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, SourceChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceChangeRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_SourceChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceChangeRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_SourceChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, PlaybackRateChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackRateChangeRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_PlaybackRateChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackRateChangeRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_PlaybackRateChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, CurrentTimeChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentTimeChangeRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_CurrentTimeChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentTimeChangeRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_CurrentTimeChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, MuteChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MuteChangeRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_MuteChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MuteChangeRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_MuteChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, VolumeChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VolumeChangeRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_VolumeChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VolumeChangeRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_VolumeChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimeUpdateRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_TimeUpdateRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TimeUpdateRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_TimeUpdateRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PlayToReceiver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StopRequested(handler) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.add_StopRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StopRequested(token) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.remove_StopRequested(token)
    }

    /**
     * Notifies the Play To receiver that the volume of the audio or video playback has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyVolumeChanged](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyVolumeChanged)]
     * 
     * [!code-vb[NotifyVolumeChanged](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyVolumeChanged)]
     * @param {Float} volume The new value for the volume.
     * @param {Boolean} mute True if the volume was muted; otherwise false.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyvolumechange
     */
    NotifyVolumeChange(volume, mute) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyVolumeChange(volume, mute)
    }

    /**
     * Notifies the Play To receiver that the rate of the audio or video playback has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyRateChange](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyRateChange)]
     * 
     * [!code-vb[NotifyRateChange](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyRateChange)]
     * @param {Float} rate The new value of the playback rate.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyratechange
     */
    NotifyRateChange(rate) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyRateChange(rate)
    }

    /**
     * Notifies the Play To receiver that metadata for the media has finished loading.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyDurationChange](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyDurationChange)]
     * 
     * [!code-vb[NotifyDurationChange](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyDurationChange)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyloadedmetadata
     */
    NotifyLoadedMetadata() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyLoadedMetadata()
    }

    /**
     * Notifies the Play To receiver that the time location of the audio or video playback has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[TimeUpdateRequested](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetTimeUpdateRequested)]
     * 
     * [!code-vb[TimeUpdateRequested](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetTimeUpdateRequested)]
     * @param {TimeSpan} currentTime The new time location of the playback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifytimeupdate
     */
    NotifyTimeUpdate(currentTime) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyTimeUpdate(currentTime)
    }

    /**
     * Notifies the Play To receiver that the duration of the audio or video playback has changed.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyDurationChange](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyDurationChange)]
     * 
     * [!code-vb[NotifyDurationChange](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyDurationChange)]
     * @param {TimeSpan} duration_ The new duration of the audio or video media.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifydurationchange
     */
    NotifyDurationChange(duration_) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyDurationChange(duration_)
    }

    /**
     * Notifies the Play To receiver that the audio or video playback element is seeking a new playback location.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifySeek](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifySeek)]
     * 
     * [!code-vb[NotifySeek](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifySeek)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyseeking
     */
    NotifySeeking() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifySeeking()
    }

    /**
     * Notifies the Play To receiver that the audio or video playback element has started at a new playback location.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifySeek](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifySeek)]
     * 
     * [!code-vb[NotifySeek](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifySeek)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyseeked
     */
    NotifySeeked() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifySeeked()
    }

    /**
     * Notifies the Play To receiver that the audio or video playback has been paused.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyPlayPauseStopError)]
     * 
     * [!code-vb[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyPlayPauseStopError)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifypaused
     */
    NotifyPaused() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyPaused()
    }

    /**
     * Notifies the Play To receiver that the audio or video playback has started.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyPlayPauseStopError)]
     * 
     * [!code-vb[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyPlayPauseStopError)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyplaying
     */
    NotifyPlaying() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyPlaying()
    }

    /**
     * Notifies the Play To receiver that the audio or video playback has ended.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyEnded](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyEnded)]
     * 
     * [!code-vb[NotifyEnded](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyEnded)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyended
     */
    NotifyEnded() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyEnded()
    }

    /**
     * Notifies the Play To receiver that an error has occurred in displaying or playing the media.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyPlayPauseStopError)]
     * 
     * [!code-vb[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyPlayPauseStopError)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifyerror
     */
    NotifyError() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyError()
    }

    /**
     * Notifies the Play To receiver that the audio or video playback has stopped.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetNotifyPlayPauseStopError)]
     * 
     * [!code-vb[NotifyPlayPauseStopError](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetNotifyPlayPauseStopError)]
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.notifystopped
     */
    NotifyStopped() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.NotifyStopped()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.get_FriendlyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.put_FriendlyName(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsImage(value) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.put_SupportsImage(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsImage() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.get_SupportsImage()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsAudio(value) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.put_SupportsAudio(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsAudio() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.get_SupportsAudio()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsVideo(value) {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.put_SupportsVideo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsVideo() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.get_SupportsVideo()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.get_Properties()
    }

    /**
     * Start receiving Play To commands.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[StartAsync](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetStartAsync)]
     * 
     * [!code-vb[StartAsync](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetStartAsync)]
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.startasync
     */
    StartAsync() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.StartAsync()
    }

    /**
     * Stop receiving Play To commands.
     * @remarks
     * For an example of creating a software Play To receiver, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * 
     * 
     * 
     * [!code-csharp[StopAsync](../windows.media.playto/code/PlayTo_Receiver1/csharp/MainPage.xaml.cs#SnippetStopAsync)]
     * 
     * [!code-vb[StopAsync](../windows.media.playto/code/PlayTo_Receiver1/vbnet/MainPage.xaml.vb#SnippetStopAsync)]
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoreceiver.stopasync
     */
    StopAsync() {
        if (!this.HasProp("__IPlayToReceiver")) {
            if ((queryResult := this.QueryInterface(IPlayToReceiver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToReceiver := IPlayToReceiver(outPtr)
        }

        return this.__IPlayToReceiver.StopAsync()
    }

;@endregion Instance Methods
}
