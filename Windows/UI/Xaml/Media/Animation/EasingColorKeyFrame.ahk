#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ColorKeyFrame.ahk
#Include .\IEasingColorKeyFrame.ahk
#Include .\IEasingColorKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Associates easing functions with a [ColorAnimationUsingKeyFrames](coloranimationusingkeyframes.md) key-frame animation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingcolorkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EasingColorKeyFrame extends ColorKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasingColorKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasingColorKeyFrame.IID

    /**
     * Identifies the EasingFunction dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingcolorkeyframe.easingfunctionproperty
     * @type {DependencyProperty} 
     */
    static EasingFunctionProperty {
        get => EasingColorKeyFrame.get_EasingFunctionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingFunctionProperty() {
        if (!EasingColorKeyFrame.HasProp("__IEasingColorKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingColorKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEasingColorKeyFrameStatics.IID)
            EasingColorKeyFrame.__IEasingColorKeyFrameStatics := IEasingColorKeyFrameStatics(factoryPtr)
        }

        return EasingColorKeyFrame.__IEasingColorKeyFrameStatics.get_EasingFunctionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the easing function that is applied to the key frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingcolorkeyframe.easingfunction
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EasingColorKeyFrame](easingcolorkeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingColorKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        if (!this.HasProp("__IEasingColorKeyFrame")) {
            if ((queryResult := this.QueryInterface(IEasingColorKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingColorKeyFrame := IEasingColorKeyFrame(outPtr)
        }

        return this.__IEasingColorKeyFrame.get_EasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        if (!this.HasProp("__IEasingColorKeyFrame")) {
            if ((queryResult := this.QueryInterface(IEasingColorKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingColorKeyFrame := IEasingColorKeyFrame(outPtr)
        }

        return this.__IEasingColorKeyFrame.put_EasingFunction(value)
    }

;@endregion Instance Methods
}
