#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\EasingFunctionBase.ahk
#Include .\IPowerEase.ahk
#Include .\IPowerEaseStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an easing function that creates an animation that accelerates and/or decelerates using the formula *f* (*t*) = *t**<sup>p</sup>* where *p* is equal to the [Power](powerease_power.md) property.
 * @remarks
 * A PowerEase can be used to produce the same results as some of the other easing functions, depending on how [Power](powerease_power.md) is set. For example, a [CubicEase](cubicease.md) is the same as a PowerEase with [Power](powerease_power.md) of 3.
 * 
 * [Power](powerease_power.md) is a **Double** value so can be used to set non-integer values. For example you could use a [Power](powerease_power.md) of 2.5 to produce an easing function has a sharper curve than [QuadraticEase](quadraticease.md) but not as sharp as [CubicEase](cubicease.md).
 * 
 * An easing function can be applied to the **EasingFunction** properties of **From*/*To*/*By** animations, or to the **EasingFunction** properties of key-frame types used for the **Easing** variants of key-frame animations. For more info, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.powerease
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PowerEase extends EasingFunctionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPowerEase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPowerEase.IID

    /**
     * Identifies the [Power](powerease_power.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.powerease.powerproperty
     * @type {DependencyProperty} 
     */
    static PowerProperty {
        get => PowerEase.get_PowerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PowerProperty() {
        if (!PowerEase.HasProp("__IPowerEaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PowerEase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPowerEaseStatics.IID)
            PowerEase.__IPowerEaseStatics := IPowerEaseStatics(factoryPtr)
        }

        return PowerEase.__IPowerEaseStatics.get_PowerProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the exponential power of the animation interpolation. For example, a value of 7 creates an animation interpolation curve that follows the formula *f* (*t*) = *t*<sup>7</sup>.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.powerease.power
     * @type {Float} 
     */
    Power {
        get => this.get_Power()
        set => this.put_Power(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PowerEase](powerease.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PowerEase")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Power() {
        if (!this.HasProp("__IPowerEase")) {
            if ((queryResult := this.QueryInterface(IPowerEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerEase := IPowerEase(outPtr)
        }

        return this.__IPowerEase.get_Power()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Power(value) {
        if (!this.HasProp("__IPowerEase")) {
            if ((queryResult := this.QueryInterface(IPowerEase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPowerEase := IPowerEase(outPtr)
        }

        return this.__IPowerEase.put_Power(value)
    }

;@endregion Instance Methods
}
