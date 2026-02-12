#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IMediaTransportControls.ahk
#Include .\IMediaTransportControls2.ahk
#Include .\IMediaTransportControls3.ahk
#Include .\IMediaTransportControls4.ahk
#Include .\IMediaTransportControlsFactory.ahk
#Include .\IMediaTransportControlsStatics4.ahk
#Include .\IMediaTransportControlsStatics3.ahk
#Include .\IMediaTransportControlsStatics2.ahk
#Include .\IMediaTransportControlsStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaTransportControls.ahk
#Include ..\Media\MediaTransportControlsThumbnailRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the playback controls for a media player element.
 * @remarks
 * The media transport controls let users interact with their media by providing a default playback experience comprised of various buttons including play, pause, closed captions, and others. It has many properties to allow for easy customization of the UI and configuration of which buttons are visible or enabled.
 * 
 * You can use the MediaTransportControls to make it easy for users to control their audio and video content. The MediaTransportControls class is intended to be used only in conjunction with a [MediaElement](mediaelement.md) or [MediaPlayerElement](mediaplayerelement.md) control. It doesn't function as a stand-alone control. You access an instance of MediaTransportControls through the [MediaElement.TransportControls](mediaelement_transportcontrols.md) or [MediaPlayerElement.TransportControls](mediaplayerelement_transportcontrols.md) property.
 * 
 * <img alt="Default media transport controls" src="images/controls/MediaTransportControlsBasic.png" />
 * 
 * > [!NOTE]
 * > You can also integrate [MediaElement](mediaelement.md) with the system media transport controls. The system transport controls are the controls that pop up when hardware media keys are pressed, such as the media buttons on keyboards. If the user presses the pause key on a keyboard and your app supports the [SystemMediaTransportControls](../windows.media/systemmediatransportcontrols.md), your app is notified and you can take the appropriate action. For more info, see [System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MediaTransportControls extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTransportControls

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTransportControls.IID

    /**
     * Identifies the IsCompactOverlayButtonVisible dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iscompactoverlaybuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsCompactOverlayButtonVisibleProperty {
        get => MediaTransportControls.get_IsCompactOverlayButtonVisibleProperty()
    }

    /**
     * Identifies the IsCompactOverlayEnabled dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iscompactoverlayenabledproperty
     * @type {DependencyProperty} 
     */
    static IsCompactOverlayEnabledProperty {
        get => MediaTransportControls.get_IsCompactOverlayEnabledProperty()
    }

    /**
     * Identifies the ShowAndHideAutomatically dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.showandhideautomaticallyproperty
     * @type {DependencyProperty} 
     */
    static ShowAndHideAutomaticallyProperty {
        get => MediaTransportControls.get_ShowAndHideAutomaticallyProperty()
    }

    /**
     * Identifies the IsRepeatEnabled dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isrepeatenabledproperty
     * @type {DependencyProperty} 
     */
    static IsRepeatEnabledProperty {
        get => MediaTransportControls.get_IsRepeatEnabledProperty()
    }

    /**
     * Identifies the IsRepeatButtonVisible dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isrepeatbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsRepeatButtonVisibleProperty {
        get => MediaTransportControls.get_IsRepeatButtonVisibleProperty()
    }

    /**
     * Identifies the [IsSkipForwardButtonVisible](mediatransportcontrols_isskipforwardbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipforwardbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsSkipForwardButtonVisibleProperty {
        get => MediaTransportControls.get_IsSkipForwardButtonVisibleProperty()
    }

    /**
     * Identifies the [IsSkipForwardEnabled](mediatransportcontrols_isskipforwardenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipforwardenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSkipForwardEnabledProperty {
        get => MediaTransportControls.get_IsSkipForwardEnabledProperty()
    }

    /**
     * Identifies the [IsSkipBackwardButtonVisible](mediatransportcontrols_isskipbackwardbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipbackwardbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsSkipBackwardButtonVisibleProperty {
        get => MediaTransportControls.get_IsSkipBackwardButtonVisibleProperty()
    }

    /**
     * Identifies the [IsSkipBackwardEnabled](mediatransportcontrols_isskipbackwardenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipbackwardenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSkipBackwardEnabledProperty {
        get => MediaTransportControls.get_IsSkipBackwardEnabledProperty()
    }

    /**
     * Identifies the [IsNextTrackButtonVisible](mediatransportcontrols_isnexttrackbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isnexttrackbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsNextTrackButtonVisibleProperty {
        get => MediaTransportControls.get_IsNextTrackButtonVisibleProperty()
    }

    /**
     * Identifies the [IsPreviousTrackButtonVisible](mediatransportcontrols_isprevioustrackbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isprevioustrackbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsPreviousTrackButtonVisibleProperty {
        get => MediaTransportControls.get_IsPreviousTrackButtonVisibleProperty()
    }

    /**
     * Identifies the [FastPlayFallbackBehaviour](mediatransportcontrols_fastplayfallbackbehaviour.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.fastplayfallbackbehaviourproperty
     * @type {DependencyProperty} 
     */
    static FastPlayFallbackBehaviourProperty {
        get => MediaTransportControls.get_FastPlayFallbackBehaviourProperty()
    }

    /**
     * Identifies the [IsFullWindowButtonVisible](mediatransportcontrols_isfullwindowbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfullwindowbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsFullWindowButtonVisibleProperty {
        get => MediaTransportControls.get_IsFullWindowButtonVisibleProperty()
    }

    /**
     * Identifies the [IsFullWindowEnabled](mediatransportcontrols_isfullwindowenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfullwindowenabledproperty
     * @type {DependencyProperty} 
     */
    static IsFullWindowEnabledProperty {
        get => MediaTransportControls.get_IsFullWindowEnabledProperty()
    }

    /**
     * Identifies the [IsZoomButtonVisible](mediatransportcontrols_iszoombuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iszoombuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsZoomButtonVisibleProperty {
        get => MediaTransportControls.get_IsZoomButtonVisibleProperty()
    }

    /**
     * Identifies the [IsZoomEnabled](mediatransportcontrols_iszoomenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iszoomenabledproperty
     * @type {DependencyProperty} 
     */
    static IsZoomEnabledProperty {
        get => MediaTransportControls.get_IsZoomEnabledProperty()
    }

    /**
     * Identifies the [IsFastForwardButtonVisible](mediatransportcontrols_isfastforwardbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastforwardbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsFastForwardButtonVisibleProperty {
        get => MediaTransportControls.get_IsFastForwardButtonVisibleProperty()
    }

    /**
     * Identifies the [IsFastForwardEnabled](mediatransportcontrols_isfastforwardenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastforwardenabledproperty
     * @type {DependencyProperty} 
     */
    static IsFastForwardEnabledProperty {
        get => MediaTransportControls.get_IsFastForwardEnabledProperty()
    }

    /**
     * Identifies the [IsFastRewindButtonVisible](mediatransportcontrols_isfastrewindbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastrewindbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsFastRewindButtonVisibleProperty {
        get => MediaTransportControls.get_IsFastRewindButtonVisibleProperty()
    }

    /**
     * Identifies the [IsFastRewindEnabled](mediatransportcontrols_isfastrewindenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastrewindenabledproperty
     * @type {DependencyProperty} 
     */
    static IsFastRewindEnabledProperty {
        get => MediaTransportControls.get_IsFastRewindEnabledProperty()
    }

    /**
     * Identifies the [IsStopButtonVisible](mediatransportcontrols_isstopbuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isstopbuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsStopButtonVisibleProperty {
        get => MediaTransportControls.get_IsStopButtonVisibleProperty()
    }

    /**
     * Identifies the [IsStopEnabled](mediatransportcontrols_isstopenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isstopenabledproperty
     * @type {DependencyProperty} 
     */
    static IsStopEnabledProperty {
        get => MediaTransportControls.get_IsStopEnabledProperty()
    }

    /**
     * Identifies the [IsVolumeButtonVisible](mediatransportcontrols_isvolumebuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isvolumebuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsVolumeButtonVisibleProperty {
        get => MediaTransportControls.get_IsVolumeButtonVisibleProperty()
    }

    /**
     * Identifies the [IsVolumeEnabled](mediatransportcontrols_isvolumeenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isvolumeenabledproperty
     * @type {DependencyProperty} 
     */
    static IsVolumeEnabledProperty {
        get => MediaTransportControls.get_IsVolumeEnabledProperty()
    }

    /**
     * Identifies the [IsPlaybackRateButtonVisible](mediatransportcontrols_isplaybackratebuttonvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isplaybackratebuttonvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsPlaybackRateButtonVisibleProperty {
        get => MediaTransportControls.get_IsPlaybackRateButtonVisibleProperty()
    }

    /**
     * Identifies the [IsPlaybackRateEnabled](mediatransportcontrols_isplaybackrateenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isplaybackrateenabledproperty
     * @type {DependencyProperty} 
     */
    static IsPlaybackRateEnabledProperty {
        get => MediaTransportControls.get_IsPlaybackRateEnabledProperty()
    }

    /**
     * Identifies the [IsSeekBarVisible](mediatransportcontrols_isseekbarvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isseekbarvisibleproperty
     * @type {DependencyProperty} 
     */
    static IsSeekBarVisibleProperty {
        get => MediaTransportControls.get_IsSeekBarVisibleProperty()
    }

    /**
     * Identifies the [IsSeekEnabled](mediatransportcontrols_isseekenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isseekenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSeekEnabledProperty {
        get => MediaTransportControls.get_IsSeekEnabledProperty()
    }

    /**
     * Identifies the [IsCompact](mediatransportcontrols_iscompact.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iscompactproperty
     * @type {DependencyProperty} 
     */
    static IsCompactProperty {
        get => MediaTransportControls.get_IsCompactProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MediaTransportControls} 
     */
    static CreateInstance() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsFactory.IID)
            MediaTransportControls.__IMediaTransportControlsFactory := IMediaTransportControlsFactory(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactOverlayButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics4.IID)
            MediaTransportControls.__IMediaTransportControlsStatics4 := IMediaTransportControlsStatics4(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics4.get_IsCompactOverlayButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactOverlayEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics4.IID)
            MediaTransportControls.__IMediaTransportControlsStatics4 := IMediaTransportControlsStatics4(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics4.get_IsCompactOverlayEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ShowAndHideAutomaticallyProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics3.IID)
            MediaTransportControls.__IMediaTransportControlsStatics3 := IMediaTransportControlsStatics3(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics3.get_ShowAndHideAutomaticallyProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRepeatEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics3.IID)
            MediaTransportControls.__IMediaTransportControlsStatics3 := IMediaTransportControlsStatics3(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics3.get_IsRepeatEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRepeatButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics3.IID)
            MediaTransportControls.__IMediaTransportControlsStatics3 := IMediaTransportControlsStatics3(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics3.get_IsRepeatButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSkipForwardButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_IsSkipForwardButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSkipForwardEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_IsSkipForwardEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSkipBackwardButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_IsSkipBackwardButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSkipBackwardEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_IsSkipBackwardEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsNextTrackButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_IsNextTrackButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPreviousTrackButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_IsPreviousTrackButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FastPlayFallbackBehaviourProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics2.IID)
            MediaTransportControls.__IMediaTransportControlsStatics2 := IMediaTransportControlsStatics2(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics2.get_FastPlayFallbackBehaviourProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFullWindowButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsFullWindowButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFullWindowEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsFullWindowEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsZoomButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsZoomEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsZoomEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFastForwardButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsFastForwardButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFastForwardEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsFastForwardEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFastRewindButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsFastRewindButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFastRewindEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsFastRewindEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStopButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsStopButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStopEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsStopEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsVolumeButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsVolumeButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsVolumeEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsVolumeEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPlaybackRateButtonVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsPlaybackRateButtonVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPlaybackRateEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsPlaybackRateEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSeekBarVisibleProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsSeekBarVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSeekEnabledProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsSeekEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactProperty() {
        if (!MediaTransportControls.HasProp("__IMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaTransportControlsStatics.IID)
            MediaTransportControls.__IMediaTransportControlsStatics := IMediaTransportControlsStatics(factoryPtr)
        }

        return MediaTransportControls.__IMediaTransportControlsStatics.get_IsCompactProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the full screen button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfullwindowbuttonvisible
     * @type {Boolean} 
     */
    IsFullWindowButtonVisible {
        get => this.get_IsFullWindowButtonVisible()
        set => this.put_IsFullWindowButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can play the media in full-screen mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfullwindowenabled
     * @type {Boolean} 
     */
    IsFullWindowEnabled {
        get => this.get_IsFullWindowEnabled()
        set => this.put_IsFullWindowEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the zoom button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iszoombuttonvisible
     * @type {Boolean} 
     */
    IsZoomButtonVisible {
        get => this.get_IsZoomButtonVisible()
        set => this.put_IsZoomButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can zoom the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iszoomenabled
     * @type {Boolean} 
     */
    IsZoomEnabled {
        get => this.get_IsZoomEnabled()
        set => this.put_IsZoomEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the fast forward button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastforwardbuttonvisible
     * @type {Boolean} 
     */
    IsFastForwardButtonVisible {
        get => this.get_IsFastForwardButtonVisible()
        set => this.put_IsFastForwardButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can fast forward the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastforwardenabled
     * @type {Boolean} 
     */
    IsFastForwardEnabled {
        get => this.get_IsFastForwardEnabled()
        set => this.put_IsFastForwardEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the rewind button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastrewindbuttonvisible
     * @type {Boolean} 
     */
    IsFastRewindButtonVisible {
        get => this.get_IsFastRewindButtonVisible()
        set => this.put_IsFastRewindButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can rewind the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isfastrewindenabled
     * @type {Boolean} 
     */
    IsFastRewindEnabled {
        get => this.get_IsFastRewindEnabled()
        set => this.put_IsFastRewindEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the stop button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isstopbuttonvisible
     * @type {Boolean} 
     */
    IsStopButtonVisible {
        get => this.get_IsStopButtonVisible()
        set => this.put_IsStopButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can stop the media playback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isstopenabled
     * @type {Boolean} 
     */
    IsStopEnabled {
        get => this.get_IsStopEnabled()
        set => this.put_IsStopEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the volume button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isvolumebuttonvisible
     * @type {Boolean} 
     */
    IsVolumeButtonVisible {
        get => this.get_IsVolumeButtonVisible()
        set => this.put_IsVolumeButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can adjust the volume of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isvolumeenabled
     * @type {Boolean} 
     */
    IsVolumeEnabled {
        get => this.get_IsVolumeEnabled()
        set => this.put_IsVolumeEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the playback rate button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isplaybackratebuttonvisible
     * @type {Boolean} 
     */
    IsPlaybackRateButtonVisible {
        get => this.get_IsPlaybackRateButtonVisible()
        set => this.put_IsPlaybackRateButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can adjust the playback rate of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isplaybackrateenabled
     * @type {Boolean} 
     */
    IsPlaybackRateEnabled {
        get => this.get_IsPlaybackRateEnabled()
        set => this.put_IsPlaybackRateEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the seek bar is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isseekbarvisible
     * @type {Boolean} 
     */
    IsSeekBarVisible {
        get => this.get_IsSeekBarVisible()
        set => this.put_IsSeekBarVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can use the seek bar to find a location in the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isseekenabled
     * @type {Boolean} 
     */
    IsSeekEnabled {
        get => this.get_IsSeekEnabled()
        set => this.put_IsSeekEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether transport controls are shown on one row instead of two.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iscompact
     * @type {Boolean} 
     */
    IsCompact {
        get => this.get_IsCompact()
        set => this.put_IsCompact(value)
    }

    /**
     * Gets or sets a value that indicates whether the skip forward button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipforwardbuttonvisible
     * @type {Boolean} 
     */
    IsSkipForwardButtonVisible {
        get => this.get_IsSkipForwardButtonVisible()
        set => this.put_IsSkipForwardButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can skip forward in the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipforwardenabled
     * @type {Boolean} 
     */
    IsSkipForwardEnabled {
        get => this.get_IsSkipForwardEnabled()
        set => this.put_IsSkipForwardEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the skip backward button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipbackwardbuttonvisible
     * @type {Boolean} 
     */
    IsSkipBackwardButtonVisible {
        get => this.get_IsSkipBackwardButtonVisible()
        set => this.put_IsSkipBackwardButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can skip backward in the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isskipbackwardenabled
     * @type {Boolean} 
     */
    IsSkipBackwardEnabled {
        get => this.get_IsSkipBackwardEnabled()
        set => this.put_IsSkipBackwardEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the next track button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isnexttrackbuttonvisible
     * @type {Boolean} 
     */
    IsNextTrackButtonVisible {
        get => this.get_IsNextTrackButtonVisible()
        set => this.put_IsNextTrackButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the previous track button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isprevioustrackbuttonvisible
     * @type {Boolean} 
     */
    IsPreviousTrackButtonVisible {
        get => this.get_IsPreviousTrackButtonVisible()
        set => this.put_IsPreviousTrackButtonVisible(value)
    }

    /**
     * Gets or sets a value that specifies how the fast-forward/fast-rewind buttons behave.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.fastplayfallbackbehaviour
     * @type {Integer} 
     */
    FastPlayFallbackBehaviour {
        get => this.get_FastPlayFallbackBehaviour()
        set => this.put_FastPlayFallbackBehaviour(value)
    }

    /**
     * Gets or sets a value that indicates whether the controls are shown and hidden automatically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.showandhideautomatically
     * @type {Boolean} 
     */
    ShowAndHideAutomatically {
        get => this.get_ShowAndHideAutomatically()
        set => this.put_ShowAndHideAutomatically(value)
    }

    /**
     * Gets or sets a value that indicates whether a user repeat the playback of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isrepeatenabled
     * @type {Boolean} 
     */
    IsRepeatEnabled {
        get => this.get_IsRepeatEnabled()
        set => this.put_IsRepeatEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the repeat button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.isrepeatbuttonvisible
     * @type {Boolean} 
     */
    IsRepeatButtonVisible {
        get => this.get_IsRepeatButtonVisible()
        set => this.put_IsRepeatButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the compact overlay button is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iscompactoverlaybuttonvisible
     * @type {Boolean} 
     */
    IsCompactOverlayButtonVisible {
        get => this.get_IsCompactOverlayButtonVisible()
        set => this.put_IsCompactOverlayButtonVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether a user can enter compact overlay mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.iscompactoverlayenabled
     * @type {Boolean} 
     */
    IsCompactOverlayEnabled {
        get => this.get_IsCompactOverlayEnabled()
        set => this.put_IsCompactOverlayEnabled(value)
    }

    /**
     * Occurs whenever the app needs to display a thumbnail adjacent to the seek bar when the user performs a seek operation.
     * @remarks
     * This event is raised only when the [MediaTransportControls](mediatransportcontrols.md) is used with a [MediaPlayerElement](mediaplayerelement.md). It is not raised when the [MediaTransportControls](mediatransportcontrols.md) are used with a [MediaElement](mediaelement.md).
     * @type {TypedEventHandler<MediaTransportControls, MediaTransportControlsThumbnailRequestedEventArgs>}
    */
    OnThumbnailRequested {
        get {
            if(!this.HasProp("__OnThumbnailRequested")){
                this.__OnThumbnailRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c2925ff8-71f0-59d3-ba13-862b226eeba2}"),
                    MediaTransportControls,
                    MediaTransportControlsThumbnailRequestedEventArgs
                )
                this.__OnThumbnailRequestedToken := this.add_ThumbnailRequested(this.__OnThumbnailRequested.iface)
            }
            return this.__OnThumbnailRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnThumbnailRequestedToken")) {
            this.remove_ThumbnailRequested(this.__OnThumbnailRequestedToken)
            this.__OnThumbnailRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindowButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsFullWindowButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFullWindowButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsFullWindowButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindowEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsFullWindowEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFullWindowEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsFullWindowEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsZoomButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsZoomButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsZoomEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsZoomEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsZoomEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsZoomEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastForwardButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsFastForwardButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFastForwardButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsFastForwardButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastForwardEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsFastForwardEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFastForwardEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsFastForwardEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastRewindButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsFastRewindButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFastRewindButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsFastRewindButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastRewindEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsFastRewindEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFastRewindEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsFastRewindEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStopButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsStopButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStopButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsStopButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStopEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsStopEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStopEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsStopEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVolumeButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsVolumeButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVolumeButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsVolumeButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVolumeEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsVolumeEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVolumeEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsVolumeEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackRateButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsPlaybackRateButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPlaybackRateButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsPlaybackRateButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlaybackRateEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsPlaybackRateEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPlaybackRateEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsPlaybackRateEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeekBarVisible() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsSeekBarVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSeekBarVisible(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsSeekBarVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeekEnabled() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsSeekEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSeekEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsSeekEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompact() {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.get_IsCompact()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompact(value) {
        if (!this.HasProp("__IMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls := IMediaTransportControls(outPtr)
        }

        return this.__IMediaTransportControls.put_IsCompact(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipForwardButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_IsSkipForwardButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSkipForwardButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_IsSkipForwardButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipForwardEnabled() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_IsSkipForwardEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSkipForwardEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_IsSkipForwardEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipBackwardButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_IsSkipBackwardButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSkipBackwardButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_IsSkipBackwardButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSkipBackwardEnabled() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_IsSkipBackwardEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSkipBackwardEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_IsSkipBackwardEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNextTrackButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_IsNextTrackButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsNextTrackButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_IsNextTrackButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPreviousTrackButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_IsPreviousTrackButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPreviousTrackButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_IsPreviousTrackButtonVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FastPlayFallbackBehaviour() {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.get_FastPlayFallbackBehaviour()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FastPlayFallbackBehaviour(value) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.put_FastPlayFallbackBehaviour(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaTransportControls, MediaTransportControlsThumbnailRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ThumbnailRequested(handler) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.add_ThumbnailRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ThumbnailRequested(token) {
        if (!this.HasProp("__IMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls2 := IMediaTransportControls2(outPtr)
        }

        return this.__IMediaTransportControls2.remove_ThumbnailRequested(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowAndHideAutomatically() {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.get_ShowAndHideAutomatically()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowAndHideAutomatically(value) {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.put_ShowAndHideAutomatically(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRepeatEnabled() {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.get_IsRepeatEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRepeatEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.put_IsRepeatEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRepeatButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.get_IsRepeatButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRepeatButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.put_IsRepeatButtonVisible(value)
    }

    /**
     * Shows the tranport controls if they're hidden.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.show
     */
    Show() {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.Show()
    }

    /**
     * Hides the transport controls if they're shown.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediatransportcontrols.hide
     */
    Hide() {
        if (!this.HasProp("__IMediaTransportControls3")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls3 := IMediaTransportControls3(outPtr)
        }

        return this.__IMediaTransportControls3.Hide()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompactOverlayButtonVisible() {
        if (!this.HasProp("__IMediaTransportControls4")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls4 := IMediaTransportControls4(outPtr)
        }

        return this.__IMediaTransportControls4.get_IsCompactOverlayButtonVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompactOverlayButtonVisible(value) {
        if (!this.HasProp("__IMediaTransportControls4")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls4 := IMediaTransportControls4(outPtr)
        }

        return this.__IMediaTransportControls4.put_IsCompactOverlayButtonVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompactOverlayEnabled() {
        if (!this.HasProp("__IMediaTransportControls4")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls4 := IMediaTransportControls4(outPtr)
        }

        return this.__IMediaTransportControls4.get_IsCompactOverlayEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompactOverlayEnabled(value) {
        if (!this.HasProp("__IMediaTransportControls4")) {
            if ((queryResult := this.QueryInterface(IMediaTransportControls4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTransportControls4 := IMediaTransportControls4(outPtr)
        }

        return this.__IMediaTransportControls4.put_IsCompactOverlayEnabled(value)
    }

;@endregion Instance Methods
}
