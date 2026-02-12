#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\ICaptureElement.ahk
#Include .\ICaptureElementStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Renders a stream from a capture device, such as a camera or webcam.  CaptureElement is used in conjunction with the [Windows.Media.Capture.MediaCapture](../windows.media.capture/mediacapture.md) API, and must be hooked up in the code behind.
 * @remarks
 * CaptureElement is used in conjunction with the [Windows.Media.Capture.MediaCapture](../windows.media.capture/mediacapture.md)  API. Make sure your project has specified device capabilities for Webcam and Microphone to use this API. For more info on how to use CaptureElement, see [Capture photos and video with MediaCapture](/windows/uwp/audio-video-camera/capture-photos-and-video-with-mediacapture).
 * 
 * Use the [MediaCapture](../windows.media.capture/mediacapture.md) object to control the stream and set options on the capture device. The CaptureElement is the UI portion of the stream that is associated with the [MediaCapture](../windows.media.capture/mediacapture.md).
 * 
 * You can use at most one CaptureElement to render a stream from a single capture device.
 * 
 * > [!NOTE]
 * > If your app manually sets the size of the **CaptureElement** control, you must make sure that the dimensions of the control do not exceed the device's native display resolution.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.captureelement
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CaptureElement extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICaptureElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICaptureElement.IID

    /**
     * Identifies the [Source](captureelement_source.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.captureelement.sourceproperty
     * @type {DependencyProperty} 
     */
    static SourceProperty {
        get => CaptureElement.get_SourceProperty()
    }

    /**
     * Identifies the [Stretch](captureelement_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.captureelement.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => CaptureElement.get_StretchProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SourceProperty() {
        if (!CaptureElement.HasProp("__ICaptureElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CaptureElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICaptureElementStatics.IID)
            CaptureElement.__ICaptureElementStatics := ICaptureElementStatics(factoryPtr)
        }

        return CaptureElement.__ICaptureElementStatics.get_SourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!CaptureElement.HasProp("__ICaptureElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CaptureElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICaptureElementStatics.IID)
            CaptureElement.__ICaptureElementStatics := ICaptureElementStatics(factoryPtr)
        }

        return CaptureElement.__ICaptureElementStatics.get_StretchProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the source [MediaCapture](../windows.media.capture/mediacapture.md) that this [CaptureElement](captureelement.md) represents.
     * @remarks
     * This property should not be set in XAML, because XAML represents initial state, and there is no good way to reference a [MediaCapture](../windows.media.capture/mediacapture.md) through XAML resources. Initializing a [MediaCapture](../windows.media.capture/mediacapture.md) is typically done by async operations or only when a capture is about to begin.
     * 
     * > [!IMPORTANT]
     * > You should always set the Source property to null when you are shutting down media capture in your app. For more information on properly cleaning up media capture resources, see [Capture photos and video with MediaCapture](/windows/uwp/audio-video-camera/capture-photos-and-video-with-mediacapture).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.captureelement.source
     * @type {MediaCapture} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets how content from [Source](captureelement_source.md) is resized to fill its allocated space, as declared by the [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md) properties of the [CaptureElement](captureelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.captureelement.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CaptureElement](captureelement.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CaptureElement")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaCapture} 
     */
    get_Source() {
        if (!this.HasProp("__ICaptureElement")) {
            if ((queryResult := this.QueryInterface(ICaptureElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICaptureElement := ICaptureElement(outPtr)
        }

        return this.__ICaptureElement.get_Source()
    }

    /**
     * 
     * @param {MediaCapture} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__ICaptureElement")) {
            if ((queryResult := this.QueryInterface(ICaptureElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICaptureElement := ICaptureElement(outPtr)
        }

        return this.__ICaptureElement.put_Source(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__ICaptureElement")) {
            if ((queryResult := this.QueryInterface(ICaptureElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICaptureElement := ICaptureElement(outPtr)
        }

        return this.__ICaptureElement.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__ICaptureElement")) {
            if ((queryResult := this.QueryInterface(ICaptureElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICaptureElement := ICaptureElement(outPtr)
        }

        return this.__ICaptureElement.put_Stretch(value)
    }

;@endregion Instance Methods
}
