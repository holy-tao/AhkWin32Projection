#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IMediaElement.ahk
#Include .\IMediaElement2.ahk
#Include .\IMediaElement3.ahk
#Include .\IMediaElementStatics2.ahk
#Include .\IMediaElementStatics.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\ExceptionRoutedEventHandler.ahk
#Include ..\ExceptionRoutedEventArgs.ahk
#Include ..\Media\TimelineMarkerRoutedEventHandler.ahk
#Include ..\Media\TimelineMarkerRoutedEventArgs.ahk
#Include ..\Media\RateChangedRoutedEventHandler.ahk
#Include ..\Media\RateChangedRoutedEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaElement.ahk
#Include ..\Media\PartialMediaFailureDetectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents an object that renders audio and video to the display. See Remarks.
 * @remarks
 * > [!IMPORTANT] 
 * > In Windows 10, build 1607 and on we recommend that you use [MediaPlayerElement](mediaplayerelement.md) in place of MediaElement. **MediaPlayerElement** has the same functionality as **MediaElement**, while also enabling more advanced media playback scenarios. Additionally, all future improvements in media playback will happen in **MediaPlayerElement**.
 * 
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Media playback](/windows/uwp/design/controls-and-patterns/media-playback).
 * 
 * Use a MediaElement control to play audio and video files in your app. Built– in media transport controls let users interact with their media by providing a default playback experience comprised of various buttons including play, pause, closed captions, and others. See [MediaTransportControls](mediatransportcontrols.md) for more info.
 * 
 * For info about the media formats that MediaElement supports, see [Supported codecs](/windows/uwp/audio-video-camera/supported-codecs).
 * 
 * For info about performance related to MediaElement, see [Optimize animations and media](/windows/uwp/debug-test-perf/optimize-animations-and-media).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MediaElement extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaElement.IID

    /**
     * Identifies the [AreTransportControlsEnabled](mediaelement_aretransportcontrolsenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.aretransportcontrolsenabledproperty
     * @type {DependencyProperty} 
     */
    static AreTransportControlsEnabledProperty {
        get => MediaElement.get_AreTransportControlsEnabledProperty()
    }

    /**
     * Identifies the [Stretch](mediaelement_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => MediaElement.get_StretchProperty()
    }

    /**
     * Identifies the [IsFullWindow](mediaelement_isfullwindow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isfullwindowproperty
     * @type {DependencyProperty} 
     */
    static IsFullWindowProperty {
        get => MediaElement.get_IsFullWindowProperty()
    }

    /**
     * Identifies the [PlayToPreferredSourceUri](mediaelement_playtopreferredsourceuri.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.playtopreferredsourceuriproperty
     * @type {DependencyProperty} 
     */
    static PlayToPreferredSourceUriProperty {
        get => MediaElement.get_PlayToPreferredSourceUriProperty()
    }

    /**
     * Identifies the [PosterSource](mediaelement_postersource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.postersourceproperty
     * @type {DependencyProperty} 
     */
    static PosterSourceProperty {
        get => MediaElement.get_PosterSourceProperty()
    }

    /**
     * Identifies the [Source](mediaelement_source.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => MediaElement.get_SourceProperty()
    }

    /**
     * Identifies the [IsMuted](mediaelement_ismuted.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.ismutedproperty
     * @type {DependencyProperty} 
     */
    static IsMutedProperty {
        get => MediaElement.get_IsMutedProperty()
    }

    /**
     * Identifies the [IsAudioOnly](mediaelement_isaudioonly.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isaudioonlyproperty
     * @type {DependencyProperty} 
     */
    static IsAudioOnlyProperty {
        get => MediaElement.get_IsAudioOnlyProperty()
    }

    /**
     * Identifies the [AutoPlay](mediaelement_autoplay.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.autoplayproperty
     * @type {DependencyProperty} 
     */
    static AutoPlayProperty {
        get => MediaElement.get_AutoPlayProperty()
    }

    /**
     * Identifies the [Volume](mediaelement_volume.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.volumeproperty
     * @type {DependencyProperty} 
     */
    static VolumeProperty {
        get => MediaElement.get_VolumeProperty()
    }

    /**
     * Identifies the [Balance](mediaelement_balance.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.balanceproperty
     * @type {DependencyProperty} 
     */
    static BalanceProperty {
        get => MediaElement.get_BalanceProperty()
    }

    /**
     * Identifies the [NaturalVideoHeight](mediaelement_naturalvideoheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.naturalvideoheightproperty
     * @type {DependencyProperty} 
     */
    static NaturalVideoHeightProperty {
        get => MediaElement.get_NaturalVideoHeightProperty()
    }

    /**
     * Identifies the [NaturalVideoWidth](mediaelement_naturalvideowidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.naturalvideowidthproperty
     * @type {DependencyProperty} 
     */
    static NaturalVideoWidthProperty {
        get => MediaElement.get_NaturalVideoWidthProperty()
    }

    /**
     * Identifies the [NaturalDuration](mediaelement_naturalduration.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.naturaldurationproperty
     * @type {DependencyProperty} 
     */
    static NaturalDurationProperty {
        get => MediaElement.get_NaturalDurationProperty()
    }

    /**
     * Identifies the [Position](mediaelement_position.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.positionproperty
     * @type {DependencyProperty} 
     */
    static PositionProperty {
        get => MediaElement.get_PositionProperty()
    }

    /**
     * Identifies the [DownloadProgress](mediaelement_downloadprogress.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.downloadprogressproperty
     * @type {DependencyProperty} 
     */
    static DownloadProgressProperty {
        get => MediaElement.get_DownloadProgressProperty()
    }

    /**
     * Identifies the [BufferingProgress](mediaelement_bufferingprogress.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.bufferingprogressproperty
     * @type {DependencyProperty} 
     */
    static BufferingProgressProperty {
        get => MediaElement.get_BufferingProgressProperty()
    }

    /**
     * Identifies the [DownloadProgressOffset](mediaelement_downloadprogressoffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.downloadprogressoffsetproperty
     * @type {DependencyProperty} 
     */
    static DownloadProgressOffsetProperty {
        get => MediaElement.get_DownloadProgressOffsetProperty()
    }

    /**
     * Identifies the [CurrentState](mediaelement_currentstate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.currentstateproperty
     * @type {DependencyProperty} 
     */
    static CurrentStateProperty {
        get => MediaElement.get_CurrentStateProperty()
    }

    /**
     * Identifies the [CanSeek](mediaelement_canseek.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.canseekproperty
     * @type {DependencyProperty} 
     */
    static CanSeekProperty {
        get => MediaElement.get_CanSeekProperty()
    }

    /**
     * Identifies the [CanPause](mediaelement_canpause.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.canpauseproperty
     * @type {DependencyProperty} 
     */
    static CanPauseProperty {
        get => MediaElement.get_CanPauseProperty()
    }

    /**
     * Identifies the [AudioStreamCount](mediaelement_audiostreamcount.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiostreamcountproperty
     * @type {DependencyProperty} 
     */
    static AudioStreamCountProperty {
        get => MediaElement.get_AudioStreamCountProperty()
    }

    /**
     * Identifies the [AudioStreamIndex](mediaelement_audiostreamindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiostreamindexproperty
     * @type {DependencyProperty} 
     */
    static AudioStreamIndexProperty {
        get => MediaElement.get_AudioStreamIndexProperty()
    }

    /**
     * Identifies the [PlaybackRate](mediaelement_playbackrate.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.playbackrateproperty
     * @type {DependencyProperty} 
     */
    static PlaybackRateProperty {
        get => MediaElement.get_PlaybackRateProperty()
    }

    /**
     * Identifies the [IsLooping](mediaelement_islooping.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isloopingproperty
     * @type {DependencyProperty} 
     */
    static IsLoopingProperty {
        get => MediaElement.get_IsLoopingProperty()
    }

    /**
     * Identifies the [PlayToSource](mediaelement_playtosource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.playtosourceproperty
     * @type {DependencyProperty} 
     */
    static PlayToSourceProperty {
        get => MediaElement.get_PlayToSourceProperty()
    }

    /**
     * Identifies the [DefaultPlaybackRate](mediaelement_defaultplaybackrate.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.defaultplaybackrateproperty
     * @type {DependencyProperty} 
     */
    static DefaultPlaybackRateProperty {
        get => MediaElement.get_DefaultPlaybackRateProperty()
    }

    /**
     * Identifies the [AspectRatioWidth](mediaelement_aspectratiowidth.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.aspectratiowidthproperty
     * @type {DependencyProperty} 
     */
    static AspectRatioWidthProperty {
        get => MediaElement.get_AspectRatioWidthProperty()
    }

    /**
     * Identifies the [AspectRatioHeight](mediaelement_aspectratioheight.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.aspectratioheightproperty
     * @type {DependencyProperty} 
     */
    static AspectRatioHeightProperty {
        get => MediaElement.get_AspectRatioHeightProperty()
    }

    /**
     * Identifies the [RealTimePlayback](mediaelement_realtimeplayback.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.realtimeplaybackproperty
     * @type {DependencyProperty} 
     */
    static RealTimePlaybackProperty {
        get => MediaElement.get_RealTimePlaybackProperty()
    }

    /**
     * Identifies the [AudioCategory](mediaelement_audiocategory.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiocategoryproperty
     * @type {DependencyProperty} 
     */
    static AudioCategoryProperty {
        get => MediaElement.get_AudioCategoryProperty()
    }

    /**
     * Identifies the [AudioDeviceType](mediaelement_audiodevicetype.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiodevicetypeproperty
     * @type {DependencyProperty} 
     */
    static AudioDeviceTypeProperty {
        get => MediaElement.get_AudioDeviceTypeProperty()
    }

    /**
     * Identifies the [ProtectionManager](mediaelement_protectionmanager.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.protectionmanagerproperty
     * @type {DependencyProperty} 
     */
    static ProtectionManagerProperty {
        get => MediaElement.get_ProtectionManagerProperty()
    }

    /**
     * Identifies the [Stereo3DVideoPackingMode](mediaelement_stereo3dvideopackingmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stereo3dvideopackingmodeproperty
     * @type {DependencyProperty} 
     */
    static Stereo3DVideoPackingModeProperty {
        get => MediaElement.get_Stereo3DVideoPackingModeProperty()
    }

    /**
     * Identifies the [Stereo3DVideoRenderMode](mediaelement_stereo3dvideorendermode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stereo3dvideorendermodeproperty
     * @type {DependencyProperty} 
     */
    static Stereo3DVideoRenderModeProperty {
        get => MediaElement.get_Stereo3DVideoRenderModeProperty()
    }

    /**
     * Identifies the [IsStereo3DVideo](mediaelement_isstereo3dvideo.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isstereo3dvideoproperty
     * @type {DependencyProperty} 
     */
    static IsStereo3DVideoProperty {
        get => MediaElement.get_IsStereo3DVideoProperty()
    }

    /**
     * Identifies the [ActualStereo3DVideoPackingMode](mediaelement_actualstereo3dvideopackingmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.actualstereo3dvideopackingmodeproperty
     * @type {DependencyProperty} 
     */
    static ActualStereo3DVideoPackingModeProperty {
        get => MediaElement.get_ActualStereo3DVideoPackingModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AreTransportControlsEnabledProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics2.IID)
            MediaElement.__IMediaElementStatics2 := IMediaElementStatics2(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics2.get_AreTransportControlsEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics2.IID)
            MediaElement.__IMediaElementStatics2 := IMediaElementStatics2(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics2.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFullWindowProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics2.IID)
            MediaElement.__IMediaElementStatics2 := IMediaElementStatics2(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics2.get_IsFullWindowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlayToPreferredSourceUriProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics2.IID)
            MediaElement.__IMediaElementStatics2 := IMediaElementStatics2(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics2.get_PlayToPreferredSourceUriProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PosterSourceProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_PosterSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsMutedProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_IsMutedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsAudioOnlyProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_IsAudioOnlyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoPlayProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AutoPlayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VolumeProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_VolumeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BalanceProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_BalanceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NaturalVideoHeightProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_NaturalVideoHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NaturalVideoWidthProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_NaturalVideoWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NaturalDurationProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_NaturalDurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PositionProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_PositionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DownloadProgressProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_DownloadProgressProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BufferingProgressProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_BufferingProgressProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DownloadProgressOffsetProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_DownloadProgressOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CurrentStateProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_CurrentStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanSeekProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_CanSeekProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanPauseProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_CanPauseProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AudioStreamCountProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AudioStreamCountProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AudioStreamIndexProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AudioStreamIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaybackRateProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_PlaybackRateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsLoopingProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_IsLoopingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlayToSourceProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_PlayToSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultPlaybackRateProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_DefaultPlaybackRateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AspectRatioWidthProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AspectRatioWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AspectRatioHeightProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AspectRatioHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RealTimePlaybackProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_RealTimePlaybackProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AudioCategoryProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AudioCategoryProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AudioDeviceTypeProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_AudioDeviceTypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ProtectionManagerProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_ProtectionManagerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Stereo3DVideoPackingModeProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_Stereo3DVideoPackingModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Stereo3DVideoRenderModeProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_Stereo3DVideoRenderModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStereo3DVideoProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_IsStereo3DVideoProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ActualStereo3DVideoPackingModeProperty() {
        if (!MediaElement.HasProp("__IMediaElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaElementStatics.IID)
            MediaElement.__IMediaElementStatics := IMediaElementStatics(factoryPtr)
        }

        return MediaElement.__IMediaElementStatics.get_ActualStereo3DVideoPackingModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the image source that is used for a placeholder image during [MediaElement](mediaelement.md) loading transition states.
     * @remarks
     * A PosterSource is an image, such as a album cover or movie poster, that is displayed in place of video. It provides your [MediaElement](mediaelement.md) with a visual representation before the media is loaded, or when the media is audio only.
     * 
     * 
     * The PosterSource is displayed in the following situations:
     * 
     * + When a valid source is not set. For example, [Source](mediaelement_source.md) is not set, [Source](mediaelement_source.md) is set to **Null**, or the source is invalid (as is the case when a [MediaFailed](mediaelement_mediafailed.md) event fires).
     * + While media is loading. For example, a valid source is set, but the [MediaOpened](mediaelement_mediaopened.md) event has not fired yet.
     * + While media is streaming to another device.
     * + When the media is audio only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.postersource
     * @type {ImageSource} 
     */
    PosterSource {
        get => this.get_PosterSource()
        set => this.put_PosterSource(value)
    }

    /**
     * Gets or sets a media source on the [MediaElement](mediaelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.source
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets a value indicating whether the audio is muted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.ismuted
     * @type {Boolean} 
     */
    IsMuted {
        get => this.get_IsMuted()
        set => this.put_IsMuted(value)
    }

    /**
     * Gets a value that reports whether the current source media is an audio-only media file.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isaudioonly
     * @type {Boolean} 
     */
    IsAudioOnly {
        get => this.get_IsAudioOnly()
    }

    /**
     * Gets or sets a value that indicates whether media will begin playback automatically when the [Source](mediaelement_source.md) property is set.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.autoplay
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * Gets or sets the media's volume.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.volume
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * Gets or sets a ratio of volume across stereo speakers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.balance
     * @type {Float} 
     */
    Balance {
        get => this.get_Balance()
        set => this.put_Balance(value)
    }

    /**
     * Gets the height of the video associated with the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.naturalvideoheight
     * @type {Integer} 
     */
    NaturalVideoHeight {
        get => this.get_NaturalVideoHeight()
    }

    /**
     * Gets the width of the video associated with the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.naturalvideowidth
     * @type {Integer} 
     */
    NaturalVideoWidth {
        get => this.get_NaturalVideoWidth()
    }

    /**
     * Gets the duration of the media file currently opened.
     * @remarks
     * A [Duration](../windows.ui.xaml/duration.md) value has a **TimeSpan** component.
     * 
     * > **C# or Microsoft Visual Basic**
     * > You can use utility methods of **System.TimeSpan** to get the duration components in whatever format you want. For example you can get [TimeSpan.Hours](/dotnet/api/system.timespan.hours?view=dotnet-uwp-10.0&preserve-view=true), [TimeSpan.Minutes](/dotnet/api/system.timespan.minutes?view=dotnet-uwp-10.0&preserve-view=true) and [TimeSpan.Seconds](/dotnet/api/system.timespan.seconds?view=dotnet-uwp-10.0&preserve-view=true) separately.
     * 
     * 
     * 
     * > **Visual C++ component extensions (C++/CX)**
     * > The data value of a [Duration](../windows.ui.xaml/duration.md) is a property named **TimeSpan**. This has a [TimeSpan](../windows.foundation/timespan.md) structure value, and that structure has a field named **Duration** that reports the duration as an **int64** that counts in 100-nanosecond units. [TimeSpan](../windows.foundation/timespan.md) doesn't have any methods for getting components of the time in *hours:minutes:seconds* format.
     * 
     * For more info, see Remarks in the [Duration](../windows.ui.xaml/duration.md) reference topic.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.naturalduration
     * @type {Duration} 
     */
    NaturalDuration {
        get => this.get_NaturalDuration()
    }

    /**
     * Gets or sets the current position of progress through the media's playback time.
     * @remarks
     * Set this property to set a specific start-play position within the media.
     * 
     * A **TimeSpan** is represented as different types depending on the programming language you are using. 
     * 
     * > **C# or Microsoft Visual Basic**
     * > Use a [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) structure. [System.TimeSpan](/dotnet/api/system.timespan?view=dotnet-uwp-10.0&preserve-view=true) has utility members such as [Parse(String)](/dotnet/api/system.timespan.parse?view=dotnet-uwp-10.0&preserve-view=true) that make it easy to create, change or compare time values.
     * 
     * 
     * 
     * > **Visual C++ component extensions (C++/CX)**
     * > Use a [Windows::Foundation::TimeSpan](../windows.foundation/timespan.md) structure. This structure has only one field member (**Duration**), which measures by 100-nanosecond units. If you intend to display a Position value in an hours:minutes:seconds format, you'll have to write your own logic for converting to that format from the **Duration** units.
     * 
     * If you are not sure of the current media source loaded as [MediaElement.Source](mediaelement_source.md), always check [CanSeek](mediaelement_canseek.md) first. A streaming media source results in the [MediaElement](mediaelement.md) reporting [CanSeek](mediaelement_canseek.md) as **false**, and in this case you cannot use Position to set the playback point.
     * <!--Silverlight did not report this as an exception AFAIK, it was a no op, test-->
     * 
     * If Position is settable, then these value constraints apply:
     * + If Position is set to a negative value, the value will revert to a **TimeSpan** with value "0:0:0".
     * + If Position is set to a value larger than the media's [NaturalDuration](mediaelement_naturalduration.md), then Position becomes the value of [NaturalDuration](mediaelement_naturalduration.md).
     * 
     * 
     * 
     * 
     * 
     * <!--<rem>The <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.mediaelement_position">Position</xref> value when media is being played is often presented to the user as a <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.slider">Slider</xref> control. This is shown briefly in the example in this topic, and you can see more code for associating the  <xref targtype="property_winrt" rid="w_ui_xaml_ctrl.mediaelement_position">Position</xref> value with a <xref targtype="class_winrt" rid="w_ui_xaml_ctrl.slider">Slider</xref> in <xref rid="m_media_mca.create_media_player" targtype="ovw" local="slider_progress_bar">Quickstart: Creating a media player app</xref>.</rem>-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets a value that indicates the amount of download completed for content located on a remote server.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.downloadprogress
     * @type {Float} 
     */
    DownloadProgress {
        get => this.get_DownloadProgress()
    }

    /**
     * Gets a value that indicates the current buffering progress.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.bufferingprogress
     * @type {Float} 
     */
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * Gets the offset of download progress, which is relevant in seek-ahead scenarios.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.downloadprogressoffset
     * @type {Float} 
     */
    DownloadProgressOffset {
        get => this.get_DownloadProgressOffset()
    }

    /**
     * Gets the status of this [MediaElement](mediaelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.currentstate
     * @type {Integer} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * Gets the collection of timeline markers associated with the currently loaded media file.
     * @remarks
     * A timeline marker is metadata associated with a particular point in a media file. These markers are usually created ahead of time and stored in the media file itself. They are typically used to name different scenes in a video or provide scripting cues. By handling the [MediaElement](mediaelement.md) object's [MarkerReached](mediaelement_markerreached.md) event or by accessing the [MediaElement](mediaelement.md) object's Markers property, you can use timeline markers to trigger actions or enable users to seek to selected positions in the media file.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.markers
     * @type {TimelineMarkerCollection} 
     */
    Markers {
        get => this.get_Markers()
    }

    /**
     * Gets a value that indicates whether media can be repositioned by setting the value of the [Position](mediaelement_position.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.canseek
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
    }

    /**
     * Gets a value that indicates whether media can be paused if the [Pause](mediaelement_pause_1953642114.md) method is called.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.canpause
     * @type {Boolean} 
     */
    CanPause {
        get => this.get_CanPause()
    }

    /**
     * Gets the number of audio streams that exist in the current media file.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiostreamcount
     * @type {Integer} 
     */
    AudioStreamCount {
        get => this.get_AudioStreamCount()
    }

    /**
     * Gets or sets the index of the audio stream that plays along with the video component. The collection of audio streams is composed at run time and represents all audio streams that are available in the media file.
     * @remarks
     * Setting AudioStreamIndex to **null** selects the default audio track, which is defined by the content.
     * 
     * 
     * 
     * 
     * <!--<rem>See the <xref targtype="ovw" rid="m_media_mca.create_media_player">Quickstart: create a media player application</xref> and <xref targtype="howto-singlepage" rid="m_media_mca.select_audio_tracks">How to select audio tracks in different languages</xref> for examples of supporting multiple audio tracks.</rem>-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiostreamindex
     * @type {IReference<Integer>} 
     */
    AudioStreamIndex {
        get => this.get_AudioStreamIndex()
        set => this.put_AudioStreamIndex(value)
    }

    /**
     * Gets or sets the playback rate ratio for the media engine.
     * @remarks
     * The current PlaybackRate is set to the value of [DefaultPlaybackRate](mediaelement_defaultplaybackrate.md) whenever [Play](mediaelement_play_848564459.md) is called. So setting [DefaultPlaybackRate](mediaelement_defaultplaybackrate.md) to a different value has no effect until [Play](mediaelement_play_848564459.md) is called.
     * 
     * To set a rate that will persist throughout the lifetime of the [MediaElement](mediaelement.md), use [DefaultPlaybackRate](mediaelement_defaultplaybackrate.md). Once playback ends, due to the [MediaEnded](mediaelement_mediaended.md) event being raised or if [Pause](mediaelement_pause_1953642114.md) or [Stop](mediaelement_stop_1201535524.md) are called, the PlaybackRate will be effectively lost.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.playbackrate
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * Gets or sets a value that describes whether the media source currently loaded in the media engine should automatically set the position to the media start after reaching its end.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.islooping
     * @type {Boolean} 
     */
    IsLooping {
        get => this.get_IsLooping()
        set => this.put_IsLooping(value)
    }

    /**
     * Gets the information that is transmitted if the [MediaElement](mediaelement.md) is used for a "PlayTo" scenario.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.playtosource
     * @type {PlayToSource} 
     */
    PlayToSource {
        get => this.get_PlayToSource()
    }

    /**
     * Gets or sets the default playback rate for the media engine. The playback rate applies when the user isn't using fast forward or reverse.
     * @remarks
     * The current [PlaybackRate](mediaelement_playbackrate.md) is set to the value of DefaultPlaybackRate whenever [Play](mediaelement_play_848564459.md) is called. So setting DefaultPlaybackRate to a different value has no effect until [Play](mediaelement_play_848564459.md) is called.
     * 
     * To set a rate that will persist throughout the lifetime of the [MediaElement](mediaelement.md), use DefaultPlaybackRate. Once playback ends, due to the [MediaEnded](mediaelement_mediaended.md) event being raised or if [Pause](mediaelement_pause_1953642114.md) or [Stop](mediaelement_stop_1201535524.md) are called, the [PlaybackRate](mediaelement_playbackrate.md) will be effectively lost.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.defaultplaybackrate
     * @type {Float} 
     */
    DefaultPlaybackRate {
        get => this.get_DefaultPlaybackRate()
        set => this.put_DefaultPlaybackRate(value)
    }

    /**
     * Gets the width portion of the native aspect ratio of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.aspectratiowidth
     * @type {Integer} 
     */
    AspectRatioWidth {
        get => this.get_AspectRatioWidth()
    }

    /**
     * Gets the height portion of the native aspect ratio of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.aspectratioheight
     * @type {Integer} 
     */
    AspectRatioHeight {
        get => this.get_AspectRatioHeight()
    }

    /**
     * Gets or sets a value that configures the [MediaElement](mediaelement.md) for real-time communications scenarios.
     * @remarks
     * Configuring for real-time playback changes the internal update logic to place higher emphasis on video refresh from available samples, and also restricts playback to natural 1x speed. Setting the property requires an internal reconstruction of the backing media engine. 
     * <!--which might justify recommendation to set sparsely.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.realtimeplayback
     * @type {Boolean} 
     */
    RealTimePlayback {
        get => this.get_RealTimePlayback()
        set => this.put_RealTimePlayback(value)
    }

    /**
     * Gets or sets a value that describes the purpose of the audio information in an audio stream.
     * @remarks
     * For hardware audio offload to be automatically applied, the audio category must be set to **ForegroundOnlyMedia** or **BackgroundCapableMedia**. Hardware audio offload optimizes audio rendering which can improve functionality and battery life.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiocategory
     * @type {Integer} 
     */
    AudioCategory {
        get => this.get_AudioCategory()
        set => this.put_AudioCategory(value)
    }

    /**
     * Gets or sets a value that describes the primary usage of the device that is being used to play back audio.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.audiodevicetype
     * @type {Integer} 
     */
    AudioDeviceType {
        get => this.get_AudioDeviceType()
        set => this.put_AudioDeviceType(value)
    }

    /**
     * Gets or sets the dedicated object for media content protection that is associated with this [MediaElement](mediaelement.md).
     * @remarks
     * See the [PlayReady sample](https://github.com/microsoft/Windows-universal-samples/tree/master/archived/PlayReady) for an example of using ProtectionManager.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.protectionmanager
     * @type {MediaProtectionManager} 
     */
    ProtectionManager {
        get => this.get_ProtectionManager()
        set => this.put_ProtectionManager(value)
    }

    /**
     * Gets or sets an enumeration value that determines the stereo 3-D video frame-packing mode for the current media source.
     * @remarks
     * The Stereo3DVideoPackingMode default is to allow the system to determine the packing mode from the metadata of the video content. In order to reset a Stereo3DVideoPackingMode value once it has been set, use [ClearValue](../windows.ui.xaml/dependencyobject_clearvalue_1095854009.md). Stereo3DVideoPackingMode is used in conjunction with [Stereo3DVideoRenderMode](mediaelement_stereo3dvideorendermode.md) to display 3-D content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stereo3dvideopackingmode
     * @type {Integer} 
     */
    Stereo3DVideoPackingMode {
        get => this.get_Stereo3DVideoPackingMode()
        set => this.put_Stereo3DVideoPackingMode(value)
    }

    /**
     * Gets or sets an enumeration value that determines the stereo 3-D video render mode for the current media source.
     * @remarks
     * [IsStereo3DVideo](mediaelement_isstereo3dvideo.md) is an evaluated read-only property that is based on Stereo3DVideoRenderMode.
     * 
     * Set Stereo3DVideoRenderMode to [Stereo](../windows.ui.xaml.media/stereo3dvideorendermode.md) when you want to enable the [MediaElement](mediaelement.md) to play 3D video. The API works in conjunction with [Stereo3DVideoPackingMode](mediaelement_stereo3dvideopackingmode.md), which lets you set the packing mode or allows the sub systems to infer it from the video file
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stereo3dvideorendermode
     * @type {Integer} 
     */
    Stereo3DVideoRenderMode {
        get => this.get_Stereo3DVideoRenderMode()
        set => this.put_Stereo3DVideoRenderMode(value)
    }

    /**
     * Gets a value that reports whether the current source media is a stereo 3-D video media file.
     * @remarks
     * If this property value is **true**, check [Stereo3DVideoRenderMode](mediaelement_stereo3dvideorendermode.md) for information on the render mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isstereo3dvideo
     * @type {Boolean} 
     */
    IsStereo3DVideo {
        get => this.get_IsStereo3DVideo()
    }

    /**
     * Gets an enumeration value that determines the current value of stereo 3-D video frame-packing mode, accounting for other factors such as whether the media engine is ready for use.
     * @remarks
     * ActualStereo3DVideoPackingMode is used to determine the current [Stereo3DVideoPackingMode](mediaelement_stereo3dvideopackingmode.md) being used by the subsystem. This could be different than what is set by the app author or if the app author sets **None** which is the default of [Stereo3DVideoPackingMode](mediaelement_stereo3dvideopackingmode.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.actualstereo3dvideopackingmode
     * @type {Integer} 
     */
    ActualStereo3DVideoPackingMode {
        get => this.get_ActualStereo3DVideoPackingMode()
    }

    /**
     * Gets or sets a value that determines whether the standard transport controls are enabled.
     * @remarks
     * The transport controls are exposed as a [MediaTransportControls](mediatransportcontrols.md) object that you can access through the [MediaElement.TransportControls](mediaelement_transportcontrols.md) property. See [MediaTransportControls](mediatransportcontrols.md) for more info.
     * 
     * If AreTransportControlsEnabled is **true**, the standard transport controls are enabled and displayed on the [MediaElement](mediaelement.md). If AreTransportControlsEnabled is **false**, the standard transport controls are not enabled and are not displayed.
     * 
     * The transport controls hide themselves after a short period of no user interaction with the [MediaElement](mediaelement.md). They reappear when the user interacts with the [MediaElement](mediaelement.md).
     * 
     * If the [Width](../windows.ui.xaml/frameworkelement_width.md) of [MediaElement](mediaelement.md) is not sufficient to display all of the transport controls, a subset of the controls are displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.aretransportcontrolsenabled
     * @type {Boolean} 
     */
    AreTransportControlsEnabled {
        get => this.get_AreTransportControlsEnabled()
        set => this.put_AreTransportControlsEnabled(value)
    }

    /**
     * Gets or sets a value that describes how an [MediaElement](mediaelement.md) should be stretched to fill the destination rectangle.
     * @remarks
     * Here's what the [Stretch](../windows.ui.xaml.media/stretch.md) values represent for [MediaElement](mediaelement.md) content:
     * + **None**: The original size of the content is preserved.
     * + **Fill**: The content is resized to fill the destination dimensions. The aspect ratio of the video is not preserved.
     * + **UniformToFill**: Uniformly stretches the [MediaElement](mediaelement.md) to fill the available layout space while preserving the aspect ratio of the content. If the aspect ratio of the destination rectangle differs from the source, the source content is clipped to fit the destination dimensions.
     * + **Uniform**: Uniformly stretches the [MediaElement](mediaelement.md) to fill the layout space while preserve the aspect ratio of the image. This will ensure that the entire image is displayed, undistorted and not cropped. This may result in letterboxing or pillarboxing on the top or sides of the image, depending on the aspect ratio of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets a value that specifies if the [MediaElement](mediaelement.md) is rendering in full window mode. Setting this property enables or disables full window rendering.
     * @remarks
     * Setting and un-setting this property enables and disables full window rendering.
     * 
     * Always use the IsFullWindow property to enable and disable full window rendering. This ensures system level optimizations are used during media playback.
     * 
     * When in full-window mode, input events received on the [MediaElement](mediaelement.md) will still route through to the visual tree in the background. For example, if the [MediaElement](mediaelement.md) is in a [ListBox](listbox.md), turning the scroll wheel could cause the [ListBox](listbox.md) to scroll in the background. This can cause unexpected behavior. If input events should not be routed when in full-window mode, the [MediaElement](mediaelement.md) should handle the events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.isfullwindow
     * @type {Boolean} 
     */
    IsFullWindow {
        get => this.get_IsFullWindow()
        set => this.put_IsFullWindow(value)
    }

    /**
     * > [!NOTE]
     * > **PlayToPreferredSourceUri** is deprecated. Instead, call [**MediaElement.GetAsCastingSource**](/uwp/api/windows.ui.xaml.controls.mediaelement.getascastingsource) and, on the returned value, call [**CastingSource.PreferredSourceUri**](/uwp/api/windows.media.casting.castingsource.preferredsourceuri).
     * 
     * Gets or sets the path to the preferred media source which enables the Play To target device to stream the media content, which can be DRM protected, from a different location, such as a cloud media server.
     * @remarks
     * [PlayToSource.PreferredSourceUri](../windows.media.playto/playtosource_preferredsourceuri.md) enables Play To by reference. This allows streaming content on the Play To target device from a different location, such as a cloud media server. This enables web pages and UWP app to play Digital Rights Management (DRM) protected content. The app specifies a preferred Uniform Resource Identifier (URI) that will be sent to the Play To target device. This Uniform Resource Identifier (URI) can point to a cloud based media server. If the [PlayToSource.PreferredSourceUri](../windows.media.playto/playtosource_preferredsourceuri.md) value is present, the Play To target device can stream content directly from the cloud, which can be Digital Rights Management (DRM) protected, instead of streaming content from the Windows machine which must be unprotected content.
     * 
     * A forward slash ("/") is appended to the Uniform Resource Identifier (URI) string when it is sent over the network to a Play To device. This is done to conform to Uniform Resource Identifier (URI) standards.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.playtopreferredsourceuri
     * @type {Uri} 
     */
    PlayToPreferredSourceUri {
        get => this.get_PlayToPreferredSourceUri()
        set => this.put_PlayToPreferredSourceUri(value)
    }

    /**
     * Gets or sets the transport controls for the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.transportcontrols
     * @type {MediaTransportControls} 
     */
    TransportControls {
        get => this.get_TransportControls()
        set => this.put_TransportControls(value)
    }

    /**
     * Occurs when the media stream has been validated and opened, and the file headers have been read.
     * @remarks
     * Live media streams report a [NaturalDuration](mediaelement_naturalduration.md) of **Int64.MaxValue**.
     * 
     * Any calls to [Play](mediaelement_play_848564459.md), [Pause](mediaelement_pause_1953642114.md), and [Stop](mediaelement_stop_1201535524.md) methods that occur before the MediaOpened event is raised are ignored.
     * @type {RoutedEventHandler}
    */
    OnMediaOpened {
        get {
            if(!this.HasProp("__OnMediaOpened")){
                this.__OnMediaOpened := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnMediaOpenedToken := this.add_MediaOpened(this.__OnMediaOpened.iface)
            }
            return this.__OnMediaOpened
        }
    }

    /**
     * Occurs when the [MediaElement](mediaelement.md) finishes playing audio or video.
     * @type {RoutedEventHandler}
    */
    OnMediaEnded {
        get {
            if(!this.HasProp("__OnMediaEnded")){
                this.__OnMediaEnded := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnMediaEndedToken := this.add_MediaEnded(this.__OnMediaEnded.iface)
            }
            return this.__OnMediaEnded
        }
    }

    /**
     * Occurs when there is an error associated with the media [Source](mediaelement_source.md).
     * @remarks
     * It is a best practice to always handle the MediaFailed event and take appropriate action.
     * @type {ExceptionRoutedEventHandler}
    */
    OnMediaFailed {
        get {
            if(!this.HasProp("__OnMediaFailed")){
                this.__OnMediaFailed := WinRTEventHandler(
                    ExceptionRoutedEventHandler,
                    ExceptionRoutedEventHandler.IID,
                    IInspectable,
                    ExceptionRoutedEventArgs
                )
                this.__OnMediaFailedToken := this.add_MediaFailed(this.__OnMediaFailed.iface)
            }
            return this.__OnMediaFailed
        }
    }

    /**
     * Occurs when the [DownloadProgress](mediaelement_downloadprogress.md) property has changed.
     * @type {RoutedEventHandler}
    */
    OnDownloadProgressChanged {
        get {
            if(!this.HasProp("__OnDownloadProgressChanged")){
                this.__OnDownloadProgressChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnDownloadProgressChangedToken := this.add_DownloadProgressChanged(this.__OnDownloadProgressChanged.iface)
            }
            return this.__OnDownloadProgressChanged
        }
    }

    /**
     * Occurs when the [BufferingProgress](mediaelement_bufferingprogress.md) property changes.
     * @type {RoutedEventHandler}
    */
    OnBufferingProgressChanged {
        get {
            if(!this.HasProp("__OnBufferingProgressChanged")){
                this.__OnBufferingProgressChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnBufferingProgressChangedToken := this.add_BufferingProgressChanged(this.__OnBufferingProgressChanged.iface)
            }
            return this.__OnBufferingProgressChanged
        }
    }

    /**
     * Occurs when the value of the [CurrentState](mediaelement_currentstate.md) property changes.
     * @type {RoutedEventHandler}
    */
    OnCurrentStateChanged {
        get {
            if(!this.HasProp("__OnCurrentStateChanged")){
                this.__OnCurrentStateChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnCurrentStateChangedToken := this.add_CurrentStateChanged(this.__OnCurrentStateChanged.iface)
            }
            return this.__OnCurrentStateChanged
        }
    }

    /**
     * Occurs when a timeline marker is encountered during media playback.
     * @type {TimelineMarkerRoutedEventHandler}
    */
    OnMarkerReached {
        get {
            if(!this.HasProp("__OnMarkerReached")){
                this.__OnMarkerReached := WinRTEventHandler(
                    TimelineMarkerRoutedEventHandler,
                    TimelineMarkerRoutedEventHandler.IID,
                    IInspectable,
                    TimelineMarkerRoutedEventArgs
                )
                this.__OnMarkerReachedToken := this.add_MarkerReached(this.__OnMarkerReached.iface)
            }
            return this.__OnMarkerReached
        }
    }

    /**
     * Occurs when [PlaybackRate](mediaelement_playbackrate.md) or [DefaultPlaybackRate](mediaelement_defaultplaybackrate.md) value changes.
     * @type {RateChangedRoutedEventHandler}
    */
    OnRateChanged {
        get {
            if(!this.HasProp("__OnRateChanged")){
                this.__OnRateChanged := WinRTEventHandler(
                    RateChangedRoutedEventHandler,
                    RateChangedRoutedEventHandler.IID,
                    IInspectable,
                    RateChangedRoutedEventArgs
                )
                this.__OnRateChangedToken := this.add_RateChanged(this.__OnRateChanged.iface)
            }
            return this.__OnRateChanged
        }
    }

    /**
     * Occurs when the value of the [Volume](mediaelement_volume.md) property changes.
     * @type {RoutedEventHandler}
    */
    OnVolumeChanged {
        get {
            if(!this.HasProp("__OnVolumeChanged")){
                this.__OnVolumeChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnVolumeChangedToken := this.add_VolumeChanged(this.__OnVolumeChanged.iface)
            }
            return this.__OnVolumeChanged
        }
    }

    /**
     * Occurs when the seek point of a requested seek operation is ready for playback. 
     * <!--Are seeks asynch? Found spec that says so but it might be a specific application and not really the Seek API.-->
     * @type {RoutedEventHandler}
    */
    OnSeekCompleted {
        get {
            if(!this.HasProp("__OnSeekCompleted")){
                this.__OnSeekCompleted := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnSeekCompletedToken := this.add_SeekCompleted(this.__OnSeekCompleted.iface)
            }
            return this.__OnSeekCompleted
        }
    }

    /**
     * Occurs when one or more streams fails to decode in content containing multiple streams.
     * @remarks
     * If at least one stream in the content is successfully decoded, the decoded media is played and this event is raised. If the stream that fails to decode is the only stream contained in the content, playback fails and the [MediaFailed](mediaelement_mediafailed.md) event is raised.
     * @type {TypedEventHandler<MediaElement, PartialMediaFailureDetectedEventArgs>}
    */
    OnPartialMediaFailureDetected {
        get {
            if(!this.HasProp("__OnPartialMediaFailureDetected")){
                this.__OnPartialMediaFailureDetected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b402b0ca-beca-5537-8192-8f30f7cb5d0e}"),
                    MediaElement,
                    PartialMediaFailureDetectedEventArgs
                )
                this.__OnPartialMediaFailureDetectedToken := this.add_PartialMediaFailureDetected(this.__OnPartialMediaFailureDetected.iface)
            }
            return this.__OnPartialMediaFailureDetected
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Instantiates a new instance of the [MediaElement](mediaelement.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaElement")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMediaOpenedToken")) {
            this.remove_MediaOpened(this.__OnMediaOpenedToken)
            this.__OnMediaOpened.iface.Dispose()
        }

        if(this.HasProp("__OnMediaEndedToken")) {
            this.remove_MediaEnded(this.__OnMediaEndedToken)
            this.__OnMediaEnded.iface.Dispose()
        }

        if(this.HasProp("__OnMediaFailedToken")) {
            this.remove_MediaFailed(this.__OnMediaFailedToken)
            this.__OnMediaFailed.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadProgressChangedToken")) {
            this.remove_DownloadProgressChanged(this.__OnDownloadProgressChangedToken)
            this.__OnDownloadProgressChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBufferingProgressChangedToken")) {
            this.remove_BufferingProgressChanged(this.__OnBufferingProgressChangedToken)
            this.__OnBufferingProgressChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCurrentStateChangedToken")) {
            this.remove_CurrentStateChanged(this.__OnCurrentStateChangedToken)
            this.__OnCurrentStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMarkerReachedToken")) {
            this.remove_MarkerReached(this.__OnMarkerReachedToken)
            this.__OnMarkerReached.iface.Dispose()
        }

        if(this.HasProp("__OnRateChangedToken")) {
            this.remove_RateChanged(this.__OnRateChangedToken)
            this.__OnRateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVolumeChangedToken")) {
            this.remove_VolumeChanged(this.__OnVolumeChangedToken)
            this.__OnVolumeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSeekCompletedToken")) {
            this.remove_SeekCompleted(this.__OnSeekCompletedToken)
            this.__OnSeekCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnPartialMediaFailureDetectedToken")) {
            this.remove_PartialMediaFailureDetected(this.__OnPartialMediaFailureDetectedToken)
            this.__OnPartialMediaFailureDetected.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PosterSource() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_PosterSource()
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PosterSource(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_PosterSource(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Source()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_Source(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMuted() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_IsMuted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMuted(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_IsMuted(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAudioOnly() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_IsAudioOnly()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AutoPlay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_AutoPlay(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Volume()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_Volume(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Balance() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Balance()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Balance(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_Balance(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoHeight() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_NaturalVideoHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoWidth() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_NaturalVideoWidth()
    }

    /**
     * 
     * @returns {Duration} 
     */
    get_NaturalDuration() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_NaturalDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Position()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_Position(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgress() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_DownloadProgress()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BufferingProgress() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_BufferingProgress()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgressOffset() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_DownloadProgressOffset()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentState() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_CurrentState()
    }

    /**
     * 
     * @returns {TimelineMarkerCollection} 
     */
    get_Markers() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Markers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_CanSeek()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPause() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_CanPause()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioStreamCount() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AudioStreamCount()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_AudioStreamIndex() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AudioStreamIndex()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_AudioStreamIndex(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_AudioStreamIndex(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_PlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_PlaybackRate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLooping() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_IsLooping()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLooping(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_IsLooping(value)
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_PlayToSource() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_PlayToSource()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DefaultPlaybackRate() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_DefaultPlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DefaultPlaybackRate(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_DefaultPlaybackRate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AspectRatioWidth() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AspectRatioWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AspectRatioHeight() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AspectRatioHeight()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RealTimePlayback() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_RealTimePlayback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RealTimePlayback(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_RealTimePlayback(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioCategory() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AudioCategory()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioCategory(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_AudioCategory(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioDeviceType() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_AudioDeviceType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioDeviceType(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_AudioDeviceType(value)
    }

    /**
     * 
     * @returns {MediaProtectionManager} 
     */
    get_ProtectionManager() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_ProtectionManager()
    }

    /**
     * 
     * @param {MediaProtectionManager} value 
     * @returns {HRESULT} 
     */
    put_ProtectionManager(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_ProtectionManager(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stereo3DVideoPackingMode() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Stereo3DVideoPackingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stereo3DVideoPackingMode(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_Stereo3DVideoPackingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stereo3DVideoRenderMode() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_Stereo3DVideoRenderMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stereo3DVideoRenderMode(value) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.put_Stereo3DVideoRenderMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo3DVideo() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_IsStereo3DVideo()
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaOpened(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_MediaOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaOpened(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_MediaOpened(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaEnded(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_MediaEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaEnded(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_MediaEnded(token)
    }

    /**
     * 
     * @param {ExceptionRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaFailed(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_MediaFailed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaFailed(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_MediaFailed(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadProgressChanged(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_DownloadProgressChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadProgressChanged(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_DownloadProgressChanged(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingProgressChanged(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_BufferingProgressChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferingProgressChanged(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_BufferingProgressChanged(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanged(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_CurrentStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentStateChanged(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_CurrentStateChanged(token)
    }

    /**
     * 
     * @param {TimelineMarkerRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MarkerReached(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_MarkerReached(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MarkerReached(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_MarkerReached(token)
    }

    /**
     * 
     * @param {RateChangedRoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RateChanged(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_RateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RateChanged(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_RateChanged(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VolumeChanged(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_VolumeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VolumeChanged(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_VolumeChanged(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SeekCompleted(handler) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.add_SeekCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SeekCompleted(token) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.remove_SeekCompleted(token)
    }

    /**
     * Stops and resets media to be played from the beginning.
     * @remarks
     * Any calls to [Play](mediaelement_play_848564459.md), [Pause](mediaelement_pause_1953642114.md), and Stop methods that occur before the [MediaOpened](mediaelement_mediaopened.md) event is raised are ignored.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.stop
     */
    Stop() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.Stop()
    }

    /**
     * Plays media from the current position.
     * @remarks
     * Any calls to Play, [Pause](mediaelement_pause_1953642114.md), and [Stop](mediaelement_stop_1201535524.md) methods that occur before the [MediaOpened](mediaelement_mediaopened.md) event is raised are ignored.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.play
     */
    Play() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.Play()
    }

    /**
     * Pauses media at the current position.
     * @remarks
     * Any calls to [Play](mediaelement_play_848564459.md), Pause, and [Stop](mediaelement_stop_1201535524.md) methods that occur before the [MediaOpened](mediaelement_mediaopened.md) event is raised are ignored.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.pause
     */
    Pause() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.Pause()
    }

    /**
     * Returns an enumeration value that describes the likelihood that the current [MediaElement](mediaelement.md) and its client configuration can play that media source.
     * @param {HSTRING} type A string that describes the desired type as a MIME string.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.canplaytype
     */
    CanPlayType(type) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.CanPlayType(type)
    }

    /**
     * Sets the [Source](mediaelement_source.md) property using the specified stream and MIME type.
     * @remarks
     * You can use the [FileOpenPicker](../windows.storage.pickers/fileopenpicker.md) control to get the file stream for a media file on the local system.
     * @param {IRandomAccessStream} stream The stream that contains the media to load.
     * @param {HSTRING} mimeType The MIME type of the media resource, expressed as the string form typically seen in HTTP headers and requests. The empty string "" can be passed in as the *mimeType* value if the MIME type is unknown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.setsource
     */
    SetSource(stream, mimeType) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.SetSource(stream, mimeType)
    }

    /**
     * Returns the RFC 1766 language for the specified audio stream.
     * @param {IReference<Integer>} index The index of the stream to get the language for.
     * 
     * <!--Projection dochack:-->
     * If you are programming using C#or Microsoft Visual Basic, the type of this parameter is projected as **int?**(a nullable integer).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.getaudiostreamlanguage
     */
    GetAudioStreamLanguage(index) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.GetAudioStreamLanguage(index)
    }

    /**
     * Applies an audio effect to playback. Takes effect for the next source that is set on this [MediaElement](mediaelement.md).
     * @remarks
     * The audio effects needs to be added before loading the source. Otherwise, it will be applied for the next source that is set on this [MediaElement](mediaelement.md).
     * @param {HSTRING} effectID The identifier for the desired effect.
     * @param {Boolean} effectOptional **true** if the effect shouldn't block playback when the effect can't be used at run time. **false** if the effect should block playback when the effect can't be used at run time.
     * @param {IPropertySet} effectConfiguration A property set that transmits property values to specific effects as selected by *effectID*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.addaudioeffect
     */
    AddAudioEffect(effectID, effectOptional, effectConfiguration) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.AddAudioEffect(effectID, effectOptional, effectConfiguration)
    }

    /**
     * Applies a video effect to playback. Takes effect for the next source that is set on this [MediaElement](mediaelement.md).
     * @param {HSTRING} effectID The identifier for the desired effect.
     * @param {Boolean} effectOptional **true** if the effect shouldn't block playback when the effect can't be used at run time. **false** if the effect should block playback when the effect can't be used at run time.
     * @param {IPropertySet} effectConfiguration A property set that transmits property values to specific effects as selected by *effectID*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.addvideoeffect
     */
    AddVideoEffect(effectID, effectOptional, effectConfiguration) {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.AddVideoEffect(effectID, effectOptional, effectConfiguration)
    }

    /**
     * Removes all effects for the next source set for this [MediaElement](mediaelement.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.removealleffects
     */
    RemoveAllEffects() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.RemoveAllEffects()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActualStereo3DVideoPackingMode() {
        if (!this.HasProp("__IMediaElement")) {
            if ((queryResult := this.QueryInterface(IMediaElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement := IMediaElement(outPtr)
        }

        return this.__IMediaElement.get_ActualStereo3DVideoPackingMode()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreTransportControlsEnabled() {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.get_AreTransportControlsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AreTransportControlsEnabled(value) {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.put_AreTransportControlsEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.put_Stretch(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindow() {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.get_IsFullWindow()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFullWindow(value) {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.put_IsFullWindow(value)
    }

    /**
     * Sets the [Source](mediaelement_source.md) of the [MediaElement](mediaelement.md) to the specified MediaStreamSource.
     * @param {IMediaSource} source The media source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.setmediastreamsource
     */
    SetMediaStreamSource(source) {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.SetMediaStreamSource(source)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_PlayToPreferredSourceUri() {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.get_PlayToPreferredSourceUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_PlayToPreferredSourceUri(value) {
        if (!this.HasProp("__IMediaElement2")) {
            if ((queryResult := this.QueryInterface(IMediaElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement2 := IMediaElement2(outPtr)
        }

        return this.__IMediaElement2.put_PlayToPreferredSourceUri(value)
    }

    /**
     * 
     * @returns {MediaTransportControls} 
     */
    get_TransportControls() {
        if (!this.HasProp("__IMediaElement3")) {
            if ((queryResult := this.QueryInterface(IMediaElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement3 := IMediaElement3(outPtr)
        }

        return this.__IMediaElement3.get_TransportControls()
    }

    /**
     * 
     * @param {MediaTransportControls} value 
     * @returns {HRESULT} 
     */
    put_TransportControls(value) {
        if (!this.HasProp("__IMediaElement3")) {
            if ((queryResult := this.QueryInterface(IMediaElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement3 := IMediaElement3(outPtr)
        }

        return this.__IMediaElement3.put_TransportControls(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaElement, PartialMediaFailureDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PartialMediaFailureDetected(handler) {
        if (!this.HasProp("__IMediaElement3")) {
            if ((queryResult := this.QueryInterface(IMediaElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement3 := IMediaElement3(outPtr)
        }

        return this.__IMediaElement3.add_PartialMediaFailureDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PartialMediaFailureDetected(token) {
        if (!this.HasProp("__IMediaElement3")) {
            if ((queryResult := this.QueryInterface(IMediaElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement3 := IMediaElement3(outPtr)
        }

        return this.__IMediaElement3.remove_PartialMediaFailureDetected(token)
    }

    /**
     * Sets the source of the [MediaElement](mediaelement.md) to the specified media playback source.
     * @param {IMediaPlaybackSource} source The media playback source.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.setplaybacksource
     */
    SetPlaybackSource(source) {
        if (!this.HasProp("__IMediaElement3")) {
            if ((queryResult := this.QueryInterface(IMediaElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement3 := IMediaElement3(outPtr)
        }

        return this.__IMediaElement3.SetPlaybackSource(source)
    }

    /**
     * Returns the media element as a [CastingSource](../windows.media.casting/castingsource.md).
     * @remarks
     * For more info about using [MediaElement](mediaelement.md) as a casting source, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * @returns {CastingSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaelement.getascastingsource
     */
    GetAsCastingSource() {
        if (!this.HasProp("__IMediaElement3")) {
            if ((queryResult := this.QueryInterface(IMediaElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaElement3 := IMediaElement3(outPtr)
        }

        return this.__IMediaElement3.GetAsCastingSource()
    }

;@endregion Instance Methods
}
