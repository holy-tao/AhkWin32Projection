#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\IBounceEase.ahk
#Include .\IBounceEaseStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animated bouncing effect.
 * @remarks
 * BounceEase has two controlling properties [Bounciness](bounceease_bounciness.md) and [Bounces](bounceease_bounces.md) that affect the behavior of the function.
 * 
 * [ElasticEase](elasticease.md) is a similar easing function that works well for physics emulation in animations. The difference with BounceEase is that an [ElasticEase](elasticease.md) can go outside the **From*/*To** range. Another way to conceptualize the two easing functions is that [ElasticEase](elasticease.md) is what you might use to animate the plucking of a string, whereas BounceEase is what you might use to show the bounce of a ball against a line or plane.
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.bounceease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class BounceEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBounceEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBounceEase.IID

    /**
     * Identifies the [Bounces](bounceease_bounces.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.bounceease.bouncesproperty
     * @type {DependencyProperty} 
     */
    static BouncesProperty {
        get => BounceEase.get_BouncesProperty()
    }

    /**
     * Identifies the [Bounciness](bounceease_bounciness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.bounceease.bouncinessproperty
     * @type {DependencyProperty} 
     */
    static BouncinessProperty {
        get => BounceEase.get_BouncinessProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BouncesProperty() {
        if (!BounceEase.HasProp("__IBounceEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BounceEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBounceEaseStatics.IID)
            BounceEase.__IBounceEaseStatics := IBounceEaseStatics(factoryPtr)
        }

        return BounceEase.__IBounceEaseStatics.get_BouncesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BouncinessProperty() {
        if (!BounceEase.HasProp("__IBounceEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BounceEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBounceEaseStatics.IID)
            BounceEase.__IBounceEaseStatics := IBounceEaseStatics(factoryPtr)
        }

        return BounceEase.__IBounceEaseStatics.get_BouncinessProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the number of bounces.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.bounceease.bounces
     * @type {Integer} 
     */
    Bounces {
        get => this.get_Bounces()
        set => this.put_Bounces(value)
    }

    /**
     * Gets or sets a value that specifies how bouncy the bounce animation is. Low values of this property result in bounces with little loss of height between bounces (more bouncy) while high values result in dampened bounces (less bouncy).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.bounceease.bounciness
     * @type {Float} 
     */
    Bounciness {
        get => this.get_Bounciness()
        set => this.put_Bounciness(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BounceEase](bounceease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.BounceEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bounces() {
        if (!this.HasProp("__IBounceEase")) {
            if ((queryResult := this.QueryInterface(IBounceEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEase := IBounceEase(outPtr)
        }

        return this.__IBounceEase.get_Bounces()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Bounces(value) {
        if (!this.HasProp("__IBounceEase")) {
            if ((queryResult := this.QueryInterface(IBounceEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEase := IBounceEase(outPtr)
        }

        return this.__IBounceEase.put_Bounces(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Bounciness() {
        if (!this.HasProp("__IBounceEase")) {
            if ((queryResult := this.QueryInterface(IBounceEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEase := IBounceEase(outPtr)
        }

        return this.__IBounceEase.get_Bounciness()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Bounciness(value) {
        if (!this.HasProp("__IBounceEase")) {
            if ((queryResult := this.QueryInterface(IBounceEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBounceEase := IBounceEase(outPtr)
        }

        return this.__IBounceEase.put_Bounciness(value)
    }

;@endregion Instance Methods
}
