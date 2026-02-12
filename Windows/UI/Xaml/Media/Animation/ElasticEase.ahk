#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\IElasticEase.ahk
#Include .\IElasticEaseStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that resembles a spring oscillating back and forth until it comes to rest.
 * @remarks
 * ElasticEase is one of the two easing functions that can produce a value outside of the normal **From*/*To** range. (The other is [BackEase](backease.md).) As the easing function begins, the value oscillates positive and negative around the **From** value until it reaches an eventual positive amplitude that is the **To** value. The [Springiness](elasticease_springiness.md) property modifies the sinusoidal character of this oscillation. With [Springiness](elasticease_springiness.md) of 0, the oscillation is basically sinusoidal and resembles a typical diagram of a spring's motion. With larger [Springiness](elasticease_springiness.md) values, it's like dampening the spring's motion.
 * 
 * The [Oscillations](elasticease_oscillations.md) property declares how many times the function oscillates and crosses into values that are actually below the starting **From** value.
 * 
 * You might get best results by just experimenting with the [Springiness](elasticease_springiness.md), [Oscillations](elasticease_oscillations.md) and [EasingMode](easingfunctionbase_easingmode.md) properties until the animation is visually doing what you want for your animated property value scenario.
 * 
 * [BounceEase](bounceease.md) is a similar easing function that works well for physics emulation in animations. The difference with ElasticEase is that a [BounceEase](bounceease.md) won't ever go outside the **From*/*To** range. Another way to conceptualize the two easing functions is that ElasticEase is what you might use to animate the plucking of a string, whereas [BounceEase](bounceease.md) is what you might use to show the bounce of a ball against a line or plane.
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.elasticease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ElasticEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IElasticEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IElasticEase.IID

    /**
     * Identifies the [Oscillations](elasticease_oscillations.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.elasticease.oscillationsproperty
     * @type {DependencyProperty} 
     */
    static OscillationsProperty {
        get => ElasticEase.get_OscillationsProperty()
    }

    /**
     * Identifies the [Springiness](elasticease_springiness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.elasticease.springinessproperty
     * @type {DependencyProperty} 
     */
    static SpringinessProperty {
        get => ElasticEase.get_SpringinessProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OscillationsProperty() {
        if (!ElasticEase.HasProp("__IElasticEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ElasticEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElasticEaseStatics.IID)
            ElasticEase.__IElasticEaseStatics := IElasticEaseStatics(factoryPtr)
        }

        return ElasticEase.__IElasticEaseStatics.get_OscillationsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SpringinessProperty() {
        if (!ElasticEase.HasProp("__IElasticEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ElasticEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElasticEaseStatics.IID)
            ElasticEase.__IElasticEaseStatics := IElasticEaseStatics(factoryPtr)
        }

        return ElasticEase.__IElasticEaseStatics.get_SpringinessProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the number of times the target slides back and forth over the animation destination.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.elasticease.oscillations
     * @type {Integer} 
     */
    Oscillations {
        get => this.get_Oscillations()
        set => this.put_Oscillations(value)
    }

    /**
     * Gets or sets the stiffness of the spring. The smaller the Springiness value is, the stiffer the spring and the faster the elasticity decreases in intensity over each oscillation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.elasticease.springiness
     * @type {Float} 
     */
    Springiness {
        get => this.get_Springiness()
        set => this.put_Springiness(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ElasticEase](elasticease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ElasticEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Oscillations() {
        if (!this.HasProp("__IElasticEase")) {
            if ((queryResult := this.QueryInterface(IElasticEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEase := IElasticEase(outPtr)
        }

        return this.__IElasticEase.get_Oscillations()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Oscillations(value) {
        if (!this.HasProp("__IElasticEase")) {
            if ((queryResult := this.QueryInterface(IElasticEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEase := IElasticEase(outPtr)
        }

        return this.__IElasticEase.put_Oscillations(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Springiness() {
        if (!this.HasProp("__IElasticEase")) {
            if ((queryResult := this.QueryInterface(IElasticEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEase := IElasticEase(outPtr)
        }

        return this.__IElasticEase.get_Springiness()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Springiness(value) {
        if (!this.HasProp("__IElasticEase")) {
            if ((queryResult := this.QueryInterface(IElasticEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElasticEase := IElasticEase(outPtr)
        }

        return this.__IElasticEase.put_Springiness(value)
    }

;@endregion Instance Methods
}
