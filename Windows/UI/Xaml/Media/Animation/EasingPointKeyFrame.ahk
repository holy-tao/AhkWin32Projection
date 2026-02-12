#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PointKeyFrame.ahk
#Include .\IEasingPointKeyFrame.ahk
#Include .\IEasingPointKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Associates an easing function with a [PointAnimationUsingKeyFrames](pointanimationusingkeyframes.md) key-frame animation.
 * @remarks
 * Easing functions allow you to apply custom mathematical formulas to your animations. Mathematical operations are often useful to produce animations that simulate real-world physics in a 2-D coordinate system. For example, you may want an object to realistically bounce or behave as though it were on a spring. For a list of easing functions and info on how to use them, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingpointkeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EasingPointKeyFrame extends PointKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasingPointKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasingPointKeyFrame.IID

    /**
     * Identifies the [EasingFunction](easingpointkeyframe_easingfunction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingpointkeyframe.easingfunctionproperty
     * @type {DependencyProperty} 
     */
    static EasingFunctionProperty {
        get => EasingPointKeyFrame.get_EasingFunctionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingFunctionProperty() {
        if (!EasingPointKeyFrame.HasProp("__IEasingPointKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingPointKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEasingPointKeyFrameStatics.IID)
            EasingPointKeyFrame.__IEasingPointKeyFrameStatics := IEasingPointKeyFrameStatics(factoryPtr)
        }

        return EasingPointKeyFrame.__IEasingPointKeyFrameStatics.get_EasingFunctionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the easing function that is applied to the key frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingpointkeyframe.easingfunction
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EasingPointKeyFrame](easingpointkeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingPointKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        if (!this.HasProp("__IEasingPointKeyFrame")) {
            if ((queryResult := this.QueryInterface(IEasingPointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingPointKeyFrame := IEasingPointKeyFrame(outPtr)
        }

        return this.__IEasingPointKeyFrame.get_EasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        if (!this.HasProp("__IEasingPointKeyFrame")) {
            if ((queryResult := this.QueryInterface(IEasingPointKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingPointKeyFrame := IEasingPointKeyFrame(outPtr)
        }

        return this.__IEasingPointKeyFrame.put_EasingFunction(value)
    }

;@endregion Instance Methods
}
