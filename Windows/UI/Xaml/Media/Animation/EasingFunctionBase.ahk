#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IEasingFunctionBase.ahk
#Include .\IEasingFunctionBaseStatics.ahk
#Include .\IEasingFunctionBaseFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the base class for all the easing functions.
 * @remarks
 * EasingFunctionBase is not extensible. It provides base class support for the Windows Runtime easing function classes, for example [ExponentialEase](exponentialease.md). When you call [Ease](easingfunctionbase_ease_1478003980.md) on a Windows Runtime easing function class, you get the specific easing behavior of that easing function class. There may also be properties of the class other than [EasingMode](easingfunctionbase_easingmode.md) that modify the [Ease](easingfunctionbase_ease_1478003980.md) behavior.
 * 
 * Easing functions allow you to apply custom mathematical formulas to your animations. Mathematical operations are often useful to produce animations that simulate real-world physics in a 2-D coordinate system. For example, you may want an object to realistically bounce or behave as though it were on a spring. For a list of easing functions and info on how to use them, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingfunctionbase
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EasingFunctionBase extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasingFunctionBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasingFunctionBase.IID

    /**
     * Identifies the [EasingMode](easingfunctionbase_easingmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingfunctionbase.easingmodeproperty
     * @type {DependencyProperty} 
     */
    static EasingModeProperty {
        get => EasingFunctionBase.get_EasingModeProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingModeProperty() {
        if (!EasingFunctionBase.HasProp("__IEasingFunctionBaseStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingFunctionBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEasingFunctionBaseStatics.IID)
            EasingFunctionBase.__IEasingFunctionBaseStatics := IEasingFunctionBaseStatics(factoryPtr)
        }

        return EasingFunctionBase.__IEasingFunctionBaseStatics.get_EasingModeProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that specifies how the animation interpolates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingfunctionbase.easingmode
     * @type {Integer} 
     */
    EasingMode {
        get => this.get_EasingMode()
        set => this.put_EasingMode(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EasingMode() {
        if (!this.HasProp("__IEasingFunctionBase")) {
            if ((queryResult := this.QueryInterface(IEasingFunctionBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingFunctionBase := IEasingFunctionBase(outPtr)
        }

        return this.__IEasingFunctionBase.get_EasingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EasingMode(value) {
        if (!this.HasProp("__IEasingFunctionBase")) {
            if ((queryResult := this.QueryInterface(IEasingFunctionBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingFunctionBase := IEasingFunctionBase(outPtr)
        }

        return this.__IEasingFunctionBase.put_EasingMode(value)
    }

    /**
     * Transforms normalized time to control the pace of an animation.
     * @param {Float} normalizedTime Normalized time (progress) of the animation.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingfunctionbase.ease
     */
    Ease(normalizedTime) {
        if (!this.HasProp("__IEasingFunctionBase")) {
            if ((queryResult := this.QueryInterface(IEasingFunctionBase.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingFunctionBase := IEasingFunctionBase(outPtr)
        }

        return this.__IEasingFunctionBase.Ease(normalizedTime)
    }

;@endregion Instance Methods
}
