#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DoubleKeyFrame.ahk
#Include .\IEasingDoubleKeyFrame.ahk
#Include .\IEasingDoubleKeyFrameStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Associates an easing function with a [DoubleAnimationUsingKeyFrames](doubleanimationusingkeyframes.md) key-frame animation.
 * @remarks
 * Easing functions allow you to apply custom mathematical formulas to your animations. Mathematical operations are often useful to produce animations that simulate real-world physics in a 2-D coordinate system. For example, you may want an object to realistically bounce or behave as though it were on a spring. For a list of easing functions and info on how to use them, see [Key-frame animations and easing function animations](/windows/uwp/graphics/key-frame-and-easing-function-animations).
 * 
 * If no easing function is set, the default easing function will be linear.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingdoublekeyframe
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class EasingDoubleKeyFrame extends DoubleKeyFrame {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasingDoubleKeyFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasingDoubleKeyFrame.IID

    /**
     * Identifies the [EasingFunction](easingdoublekeyframe_easingfunction.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingdoublekeyframe.easingfunctionproperty
     * @type {DependencyProperty} 
     */
    static EasingFunctionProperty {
        get => EasingDoubleKeyFrame.get_EasingFunctionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EasingFunctionProperty() {
        if (!EasingDoubleKeyFrame.HasProp("__IEasingDoubleKeyFrameStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingDoubleKeyFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEasingDoubleKeyFrameStatics.IID)
            EasingDoubleKeyFrame.__IEasingDoubleKeyFrameStatics := IEasingDoubleKeyFrameStatics(factoryPtr)
        }

        return EasingDoubleKeyFrame.__IEasingDoubleKeyFrameStatics.get_EasingFunctionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the easing function that is applied to the key frame.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.easingdoublekeyframe.easingfunction
     * @type {EasingFunctionBase} 
     */
    EasingFunction {
        get => this.get_EasingFunction()
        set => this.put_EasingFunction(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EasingDoubleKeyFrame](easingdoublekeyframe.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.EasingDoubleKeyFrame")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {EasingFunctionBase} 
     */
    get_EasingFunction() {
        if (!this.HasProp("__IEasingDoubleKeyFrame")) {
            if ((queryResult := this.QueryInterface(IEasingDoubleKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingDoubleKeyFrame := IEasingDoubleKeyFrame(outPtr)
        }

        return this.__IEasingDoubleKeyFrame.get_EasingFunction()
    }

    /**
     * 
     * @param {EasingFunctionBase} value 
     * @returns {HRESULT} 
     */
    put_EasingFunction(value) {
        if (!this.HasProp("__IEasingDoubleKeyFrame")) {
            if ((queryResult := this.QueryInterface(IEasingDoubleKeyFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasingDoubleKeyFrame := IEasingDoubleKeyFrame(outPtr)
        }

        return this.__IEasingDoubleKeyFrame.put_EasingFunction(value)
    }

;@endregion Instance Methods
}
