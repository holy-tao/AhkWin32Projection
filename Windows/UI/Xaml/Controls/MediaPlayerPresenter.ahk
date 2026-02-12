#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IMediaPlayerPresenter.ahk
#Include .\IMediaPlayerPresenterStatics.ahk
#Include .\IMediaPlayerPresenterFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an object that displays a [MediaPlayer](../windows.media.playback/mediaplayer.md).
 * @remarks
 * MediaPlayerPresenter is intended to be used in the control template of the [MediaPlayerElement](mediaplayerelement.md) control. You will typically use [MediaPlayerElement](mediaplayerelement.md) in your app rather than MediaPlayerPresenter.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MediaPlayerPresenter extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayerPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayerPresenter.IID

    /**
     * Identifies the [MediaPlayer](mediaplayerpresenter_mediaplayer.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter.mediaplayerproperty
     * @type {DependencyProperty} 
     */
    static MediaPlayerProperty {
        get => MediaPlayerPresenter.get_MediaPlayerProperty()
    }

    /**
     * Identifies the [Stretch](mediaplayerpresenter_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => MediaPlayerPresenter.get_StretchProperty()
    }

    /**
     * Identifies the [IsFullWindow](mediaplayerpresenter_isfullwindow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter.isfullwindowproperty
     * @type {DependencyProperty} 
     */
    static IsFullWindowProperty {
        get => MediaPlayerPresenter.get_IsFullWindowProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MediaPlayerProperty() {
        if (!MediaPlayerPresenter.HasProp("__IMediaPlayerPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerPresenterStatics.IID)
            MediaPlayerPresenter.__IMediaPlayerPresenterStatics := IMediaPlayerPresenterStatics(factoryPtr)
        }

        return MediaPlayerPresenter.__IMediaPlayerPresenterStatics.get_MediaPlayerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!MediaPlayerPresenter.HasProp("__IMediaPlayerPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerPresenterStatics.IID)
            MediaPlayerPresenter.__IMediaPlayerPresenterStatics := IMediaPlayerPresenterStatics(factoryPtr)
        }

        return MediaPlayerPresenter.__IMediaPlayerPresenterStatics.get_StretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFullWindowProperty() {
        if (!MediaPlayerPresenter.HasProp("__IMediaPlayerPresenterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerPresenterStatics.IID)
            MediaPlayerPresenter.__IMediaPlayerPresenterStatics := IMediaPlayerPresenterStatics(factoryPtr)
        }

        return MediaPlayerPresenter.__IMediaPlayerPresenterStatics.get_IsFullWindowProperty()
    }

    /**
     * 
     * @returns {MediaPlayerPresenter} 
     */
    static CreateInstance() {
        if (!MediaPlayerPresenter.HasProp("__IMediaPlayerPresenterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MediaPlayerPresenter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaPlayerPresenterFactory.IID)
            MediaPlayerPresenter.__IMediaPlayerPresenterFactory := IMediaPlayerPresenterFactory(factoryPtr)
        }

        return MediaPlayerPresenter.__IMediaPlayerPresenterFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [MediaPlayer](../windows.media.playback/mediaplayer.md) instance used to render media.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter.mediaplayer
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
        set => this.put_MediaPlayer(value)
    }

    /**
     * Gets or sets a value that describes how an [MediaPlayerPresenter](mediaplayerpresenter.md) should be stretched to fill the destination rectangle.
     * @remarks
     * Here's what the [Stretch](../windows.ui.xaml.media/stretch.md) values represent for [MediaPlayerPresenter](mediaplayerpresenter.md) content:
     * + **None**: The original size of the content is preserved.
     * + **Fill**: The content is resized to fill the destination dimensions. The aspect ratio of the video is not preserved.
     * + **UniformToFill**: Uniformly stretches the [MediaPlayerPresenter](mediaplayerpresenter.md) to fill the available layout space while preserving the aspect ratio of the content. If the aspect ratio of the destination rectangle differs from the source, the source content is clipped to fit the destination dimensions.
     * + **Uniform**: Uniformly stretches the [MediaPlayerPresenter](mediaplayerpresenter.md) to fill the layout space while preserve the aspect ratio of the image. This will ensure that the entire image is displayed, undistorted and not cropped. This may result in letterboxing or pillarboxing on the top or sides of the image, depending on the aspect ratio of the content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets or sets a value that specifies if the [MediaPlayerPresenter](mediaplayerpresenter.md) is rendering in full window mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.mediaplayerpresenter.isfullwindow
     * @type {Boolean} 
     */
    IsFullWindow {
        get => this.get_IsFullWindow()
        set => this.put_IsFullWindow(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        if (!this.HasProp("__IMediaPlayerPresenter")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerPresenter := IMediaPlayerPresenter(outPtr)
        }

        return this.__IMediaPlayerPresenter.get_MediaPlayer()
    }

    /**
     * 
     * @param {MediaPlayer} value 
     * @returns {HRESULT} 
     */
    put_MediaPlayer(value) {
        if (!this.HasProp("__IMediaPlayerPresenter")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerPresenter := IMediaPlayerPresenter(outPtr)
        }

        return this.__IMediaPlayerPresenter.put_MediaPlayer(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__IMediaPlayerPresenter")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerPresenter := IMediaPlayerPresenter(outPtr)
        }

        return this.__IMediaPlayerPresenter.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__IMediaPlayerPresenter")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerPresenter := IMediaPlayerPresenter(outPtr)
        }

        return this.__IMediaPlayerPresenter.put_Stretch(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFullWindow() {
        if (!this.HasProp("__IMediaPlayerPresenter")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerPresenter := IMediaPlayerPresenter(outPtr)
        }

        return this.__IMediaPlayerPresenter.get_IsFullWindow()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFullWindow(value) {
        if (!this.HasProp("__IMediaPlayerPresenter")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerPresenter := IMediaPlayerPresenter(outPtr)
        }

        return this.__IMediaPlayerPresenter.put_IsFullWindow(value)
    }

;@endregion Instance Methods
}
