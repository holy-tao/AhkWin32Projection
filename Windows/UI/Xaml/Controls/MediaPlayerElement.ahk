#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IMediaPlayerElement.ahk
#Include .\IMediaPlayerElementFactory.ahk
#Include .\IMediaPlayerElementStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an object that uses a [MediaPlayer](../windows.media.playback/mediaplayer.md) to render audio and video to the display.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Media playback](/windows/uwp/design/controls-and-patterns/media-playback).
 * 
 * For info about the media formats that MediaPlayerElement supports, see [Supported codecs](/windows/uwp/audio-video-camera/supported-codecs).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MediaPlayerElement extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerElement.IID

    /**
     * Identifies the [Source](mediaplayerelement_source.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => MediaPlayerElement.get_SourceProperty()
    }

    /**
     * Identifies the [AreTransportControlsEnabled](mediaplayerelement_aretransportcontrolsenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.aretransportcontrolsenabledproperty
     * @type {DependencyProperty} 
     */
    static AreTransportControlsEnabledProperty {
        get => MediaPlayerElement.get_AreTransportControlsEnabledProperty()
    }

    /**
     * Identifies the [PosterSource](mediaplayerelement_postersource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.postersourceproperty
     * @type {DependencyProperty} 
     */
    static PosterSourceProperty {
        get => MediaPlayerElement.get_PosterSourceProperty()
    }

    /**
     * Identifies the [Stretch](mediaplayerelement_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => MediaPlayerElement.get_StretchProperty()
    }

    /**
     * Identifies the [AutoPlay](mediaplayerelement_autoplay.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.autoplayproperty
     * @type {DependencyProperty} 
     */
    static AutoPlayProperty {
        get => MediaPlayerElement.get_AutoPlayProperty()
    }

    /**
     * Identifies the [IsFullWindow](mediaplayerelement_isfullwindow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.isfullwindowproperty
     * @type {DependencyProperty} 
     */
    static IsFullWindowProperty {
        get => MediaPlayerElement.get_IsFullWindowProperty()
    }

    /**
     * Identifies the [MediaPlayer](mediaplayerelement_mediaplayer.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.mediaplayerproperty
     * @type {DependencyProperty} 
     */
    static MediaPlayerProperty {
        get => MediaPlayerElement.get_MediaPlayerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MediaPlayerElement} 
     */
    static CreateInstance() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementFactory.IID)
            MediaPlayerElement.__IMediaPlayerElementFactory := IMediaPlayerElementFactory(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreTransportControlsEnabledProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_AreTransportControlsEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PosterSourceProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_PosterSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoPlayProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_AutoPlayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFullWindowProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_IsFullWindowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MediaPlayerProperty() {
        if (!MediaPlayerElement.HasProp("__IMediaPlayerElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerElementStatics.IID)
            MediaPlayerElement.__IMediaPlayerElementStatics := IMediaPlayerElementStatics(factoryPtr)
        }

        return MediaPlayerElement.__IMediaPlayerElementStatics.get_MediaPlayerProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a media source on the [MediaPlayerElement](mediaplayerelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.source
     * @type {IMediaPlaybackSource} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets the transport controls for the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.transportcontrols
     * @type {MediaTransportControls} 
     */
    TransportControls {
        get => this.get_TransportControls()
        set => this.put_TransportControls(value)
    }

    /**
     * Gets or sets a value that determines whether the standard transport controls are enabled.
     * @remarks
     * The transport controls are exposed as a [MediaTransportControls](mediatransportcontrols.md) object that you can access through the [MediaPlayerElement.TransportControls](mediaplayerelement_transportcontrols.md) property. See [MediaTransportControls](mediatransportcontrols.md) for more info.
     * 
     * If AreTransportControlsEnabled is **true**, the standard transport controls are enabled and displayed on the [MediaPlayerElement](mediaplayerelement.md). If AreTransportControlsEnabled is **false**, the standard transport controls are not enabled and are not displayed.
     * 
     * The transport controls hide themselves after a short period of no user interaction with the [MediaPlayerElement](mediaplayerelement.md). They reappear when the user interacts with the [MediaPlayerElement](mediaplayerelement.md).
     * 
     * If the [Width](../windows.ui.xaml/frameworkelement_width.md) of [MediaPlayerElement](mediaplayerelement.md) is not sufficient to display all of the transport controls, a subset of the controls are displayed.
     * 
     * > [!NOTE]
     * > If you disable the [MediaPlaybackCommandManager](../windows.media.playback/mediaplaybackcommandmanager.md) by setting [IsEnabled](../windows.media.playback/mediaplaybackcommandmanager_isenabled.md) to **false**, it will break the link between the [MediaPlayer](../windows.media.playback/mediaplayer.md) the [TransportControls](mediaplayerelement_transportcontrols.md) provided by the MediaPlayerElement, so the built-in transport controls will no longer automatically control the playback of the player. Instead, you must implement your own controls to control the **MediaPlayer**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.aretransportcontrolsenabled
     * @type {Boolean} 
     */
    AreTransportControlsEnabled {
        get => this.get_AreTransportControlsEnabled()
        set => this.put_AreTransportControlsEnabled(value)
    }

    /**
     * Gets or sets the image source that is used for a placeholder image during [MediaPlayerElement](mediaplayerelement.md) loading transition states.
     * @remarks
     * A PosterSource is an image, such as a album cover or movie poster, that is displayed in place of video. It provides your [MediaPlayerElement](mediaplayerelement.md) with a visual representation before the media is loaded, or when the media is audio only.
     * 
     * 
     * The PosterSource is displayed in the following situations:
     * 
     * + When a valid source is not set. For example, [Source](mediaplayerelement_source.md) is not set, [Source](mediaplayerelement_source.md) is set to **Null**, or the source is invalid (as is the case when a [MediaFailed](../windows.media.playback/mediaplayer_mediafailed.md) event fires).
     * + While media is loading. For example, a valid source is set, but the [MediaOpened](../windows.media.playback/mediaplayer_mediaopened.md) event has not fired yet.
     * + While media is streaming to another device.
     * + When the media is audio only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.postersource
     * @type {ImageSource} 
     */
    PosterSource {
        get => this.get_PosterSource()
        set => this.put_PosterSource(value)
    }

    /**
     * Gets or sets a value that describes how an [MediaPlayerElement](mediaplayerelement.md) should be stretched to fill the destination rectangle.
     * @remarks
     * Here's what the [Stretch](../windows.ui.xaml.media/stretch.md) values represent for [MediaPlayerElement](mediaplayerelement.md) content:
     * + **None**: The original size of the content is preserved.
     * + **Fill**: The content is resized to fill the destination dimensions. The aspect ratio of the video is not preserved.
     * + **UniformToFill**: Uniformly stretches the [MediaPlayerElement](mediaplayerelement.md) to fill the available layout space while preserving the aspect ratio of the content. If the aspect ratio of the destination rectangle differs from the source, the source content is clipped to fit the destination dimensions.
     * + **Uniform**: Uniformly stretches the [MediaPlayerElement](mediaplayerelement.md) to fill the layout space while preserve the aspect ratio of the image. This will ensure that the entire image is displayed, undistorted and not cropped. This may result in letterboxing or pillarboxing on the top or sides of the image, depending on the aspect ratio of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets or sets a value that indicates whether media will begin playback automatically when the [Source](mediaplayerelement_source.md) property is set.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.autoplay
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * Gets or sets a value that specifies if the [MediaPlayerElement](mediaplayerelement.md) is rendering in full window mode.
     * @remarks
     * Setting and un-setting this property enables and disables full window rendering.
     * 
     * Always use the IsFullWindow property to enable and disable full window rendering. This ensures system level optimizations are used during media playback.
     * 
     * When in full-window mode, input events received on the [MediaPlayerElement](mediaplayerelement.md) will still route through to the visual tree in the background. For example, if the [MediaPlayerElement](mediaplayerelement.md) is in a [ListBox](listbox.md), turning the scroll wheel could cause the [ListBox](listbox.md) to scroll in the background. This can cause unexpected behavior. If input events should not be routed when in full-window mode, the [MediaPlayerElement](mediaplayerelement.md) should handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.isfullwindow
     * @type {Boolean} 
     */
    IsFullWindow {
        get => this.get_IsFullWindow()
        set => this.put_IsFullWindow(value)
    }

    /**
     * Gets the [MediaPlayer](../windows.media.playback/mediaplayer.md) instance used to render media.
     * @remarks
     * You can use the [SetMediaPlayer](mediaplayerelement_setmediaplayer_932380017.md) method to change the underlying [MediaPlayer](../windows.media.playback/mediaplayer.md) instance. Changing the [MediaPlayer](../windows.media.playback/mediaplayer.md) can cause non-trivial side effects because it can change other properties of the [MediaPlayerElement](mediaplayerelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.mediaplayer
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMediaPlaybackSource} 
     */
    get_Source() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_Source()
    }

    /**
     * 
     * @param {IMediaPlaybackSource} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_Source(value)
    }

    /**
     * 
     * @returns {MediaTransportControls} 
     */
    get_TransportControls() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_TransportControls()
    }

    /**
     * 
     * @param {MediaTransportControls} value 
     * @returns {HRESULT} 
     */
    put_TransportControls(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_TransportControls(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreTransportControlsEnabled() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_AreTransportControlsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreTransportControlsEnabled(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_AreTransportControlsEnabled(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PosterSource() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_PosterSource()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PosterSource(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_PosterSource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_Stretch(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_AutoPlay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_AutoPlay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindow() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_IsFullWindow()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFullWindow(value) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.put_IsFullWindow(value)
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.get_MediaPlayer()
    }

    /**
     * Sets the [MediaPlayer](../windows.media.playback/mediaplayer.md) instance used to render media.
     * @remarks
     * You can use the SetMediaPlayer method to change the underlying [MediaPlayer](../windows.media.playback/mediaplayer.md) instance. Calling this method to change the [MediaPlayer](../windows.media.playback/mediaplayer.md) can cause non-trivial side effects because it can change other properties of the [MediaPlayerElement](mediaplayerelement.md).
     * 
     * Use the [MediaPlayer](mediaplayerelement_mediaplayer.md) property to get the current instance of [MediaPlayer](../windows.media.playback/mediaplayer.md).
     * @param {MediaPlayer} mediaPlayer_ The new [MediaPlayer](../windows.media.playback/mediaplayer.md) instance used to render media.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerelement.setmediaplayer
     */
    SetMediaPlayer(mediaPlayer_) {
        if (!this.HasProp("__IMediaPlayerElement")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerElement := IMediaPlayerElement(outPtr)
        }

        return this.__IMediaPlayerElement.SetMediaPlayer(mediaPlayer_)
    }

;@endregion Instance Methods
}
