#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IColorAnimationUsingKeyFrames.ahk
#Include .\IColorAnimationUsingKeyFramesStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates the value of a [Color](../windows.ui/color.md) property along a set of key frames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimationusingkeyframes
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ColorAnimationUsingKeyFrames extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorAnimationUsingKeyFrames

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorAnimationUsingKeyFrames.IID

    /**
     * Identifies the [EnableDependentAnimation](coloranimationusingkeyframes_enabledependentanimation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimationusingkeyframes.enabledependentanimationproperty
     * @type {DependencyProperty} 
     */
    static EnableDependentAnimationProperty {
        get => ColorAnimationUsingKeyFrames.get_EnableDependentAnimationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnableDependentAnimationProperty() {
        if (!ColorAnimationUsingKeyFrames.HasProp("__IColorAnimationUsingKeyFramesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimationUsingKeyFrames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorAnimationUsingKeyFramesStatics.IID)
            ColorAnimationUsingKeyFrames.__IColorAnimationUsingKeyFramesStatics := IColorAnimationUsingKeyFramesStatics(factoryPtr)
        }

        return ColorAnimationUsingKeyFrames.__IColorAnimationUsingKeyFramesStatics.get_EnableDependentAnimationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of [ColorKeyFrame](colorkeyframe.md) objects that define the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimationusingkeyframes.keyframes
     * @type {ColorKeyFrameCollection} 
     */
    KeyFrames {
        get => this.get_KeyFrames()
    }

    /**
     * Gets or sets a value that declares whether animated properties that are considered dependent animations should be permitted to use this animation declaration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.coloranimationusingkeyframes.enabledependentanimation
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ColorAnimationUsingKeyFrames](coloranimationusingkeyframes.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ColorAnimationUsingKeyFrames")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ColorKeyFrameCollection} 
     */
    get_KeyFrames() {
        if (!this.HasProp("__IColorAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IColorAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimationUsingKeyFrames := IColorAnimationUsingKeyFrames(outPtr)
        }

        return this.__IColorAnimationUsingKeyFrames.get_KeyFrames()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        if (!this.HasProp("__IColorAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IColorAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimationUsingKeyFrames := IColorAnimationUsingKeyFrames(outPtr)
        }

        return this.__IColorAnimationUsingKeyFrames.get_EnableDependentAnimation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        if (!this.HasProp("__IColorAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IColorAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorAnimationUsingKeyFrames := IColorAnimationUsingKeyFrames(outPtr)
        }

        return this.__IColorAnimationUsingKeyFrames.put_EnableDependentAnimation(value)
    }

;@endregion Instance Methods
}
