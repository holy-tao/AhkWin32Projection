#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\IExponentialEase.ahk
#Include .\IExponentialEaseStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using an exponential formula.
 * @remarks
 * ExponentialEase is an easing function that has a function-over-time formula that uses an [Exponent](exponentialease_exponent.md) value to shape the function-over-time curve. The value used for [Exponent](exponentialease_exponent.md) changes the shape of the curve quite a bit. [Exponent](exponentialease_exponent.md) can be negative, if so the function acts a bit like changing the [EasingMode](easingfunctionbase_easingmode.md) to **EaseOut** with a positive value. You might want to experiment with different values for [Exponent](exponentialease_exponent.md) and [EasingMode](easingfunctionbase_easingmode.md) when using this easing function.
 * 
 * 
 * <!--The IMG for the Silverlight topic is wrong cannot use it here.-->
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.exponentialease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ExponentialEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IExponentialEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IExponentialEase.IID

    /**
     * Identifies the [Exponent](exponentialease_exponent.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.exponentialease.exponentproperty
     * @type {DependencyProperty} 
     */
    static ExponentProperty {
        get => ExponentialEase.get_ExponentProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExponentProperty() {
        if (!ExponentialEase.HasProp("__IExponentialEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ExponentialEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IExponentialEaseStatics.IID)
            ExponentialEase.__IExponentialEaseStatics := IExponentialEaseStatics(factoryPtr)
        }

        return ExponentialEase.__IExponentialEaseStatics.get_ExponentProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the exponent used to determine the interpolation of the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.exponentialease.exponent
     * @type {Float} 
     */
    Exponent {
        get => this.get_Exponent()
        set => this.put_Exponent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ExponentialEase](exponentialease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ExponentialEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Exponent() {
        if (!this.HasProp("__IExponentialEase")) {
            if ((queryResult := this.QueryInterface(IExponentialEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExponentialEase := IExponentialEase(outPtr)
        }

        return this.__IExponentialEase.get_Exponent()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Exponent(value) {
        if (!this.HasProp("__IExponentialEase")) {
            if ((queryResult := this.QueryInterface(IExponentialEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExponentialEase := IExponentialEase(outPtr)
        }

        return this.__IExponentialEase.put_Exponent(value)
    }

;@endregion Instance Methods
}
