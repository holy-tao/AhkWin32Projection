#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\IBackEase.ahk
#Include .\IBackEaseStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that changes a value in the opposite direction of the main function during part of a duration, then reverses and finishes the function-over-time behavior in a conventional way.
 * @remarks
 * BackEase is one of the two easing functions that can produce a value outside of the normal **From*/*To** range. (The other is [ElasticEase](elasticease.md).)
 * + If [EasingMode](easingmode.md) is **EaseIn** (the default) then the function starts by changing the value in the opposite direction of the value change that **From** and **To** indicate, in other words it initially produces a value that's less than the **From** value.
 * + If [EasingMode](easingmode.md) is **EaseOut** then the function starts in a typical way, but near the end will exceed the **To** value and then come back to the **To** value at the end.
 * + If [EasingMode](easingmode.md) is **EaseInOut** then the function gives values that are less than **From** at the beginning and greater than **To** near the end.
 *  This illustration shows a function-over-time graph approximation for a BackEase for each of the three possible [EasingMode](easingmode.md) values, with [Amplitude](backease_amplitude.md) as its default value.<img src="images/backease_concept.png" alt="Illustration of function-over-time graph for the BackEase easing function. The graph shows curves where the x axis is time t and the y axis is function-over-time f(t)" />
 * 
 * You might get best results by just experimenting with the [Springiness](elasticease_springiness.md) and [EasingMode](easingfunctionbase_easingmode.md) properties until the animation is visually doing what you want for your animated property value scenario.
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.backease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class BackEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackEase.IID

    /**
     * Identifies the [Amplitude](backease_amplitude.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.backease.amplitudeproperty
     * @type {DependencyProperty} 
     */
    static AmplitudeProperty {
        get => BackEase.get_AmplitudeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AmplitudeProperty() {
        if (!BackEase.HasProp("__IBackEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BackEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackEaseStatics.IID)
            BackEase.__IBackEaseStatics := IBackEaseStatics(factoryPtr)
        }

        return BackEase.__IBackEaseStatics.get_AmplitudeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the amplitude of retraction associated with a [BackEase](backease.md) animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.backease.amplitude
     * @type {Float} 
     */
    Amplitude {
        get => this.get_Amplitude()
        set => this.put_Amplitude(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BackEase](backease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BackEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Amplitude() {
        if (!this.HasProp("__IBackEase")) {
            if ((queryResult := this.QueryInterface(IBackEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackEase := IBackEase(outPtr)
        }

        return this.__IBackEase.get_Amplitude()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Amplitude(value) {
        if (!this.HasProp("__IBackEase")) {
            if ((queryResult := this.QueryInterface(IBackEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackEase := IBackEase(outPtr)
        }

        return this.__IBackEase.put_Amplitude(value)
    }

;@endregion Instance Methods
}
