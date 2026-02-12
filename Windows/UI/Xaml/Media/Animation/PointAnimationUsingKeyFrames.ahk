#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IPointAnimationUsingKeyFrames.ahk
#Include .\IPointAnimationUsingKeyFramesStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates the value of a [Point](../windows.foundation/point.md) property along a set of [KeyFrames](pointanimationusingkeyframes_keyframes.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimationusingkeyframes
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PointAnimationUsingKeyFrames extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointAnimationUsingKeyFrames

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointAnimationUsingKeyFrames.IID

    /**
     * Identifies the [EnableDependentAnimation](pointanimationusingkeyframes_enabledependentanimation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimationusingkeyframes.enabledependentanimationproperty
     * @type {DependencyProperty} 
     */
    static EnableDependentAnimationProperty {
        get => PointAnimationUsingKeyFrames.get_EnableDependentAnimationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnableDependentAnimationProperty() {
        if (!PointAnimationUsingKeyFrames.HasProp("__IPointAnimationUsingKeyFramesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimationUsingKeyFrames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointAnimationUsingKeyFramesStatics.IID)
            PointAnimationUsingKeyFrames.__IPointAnimationUsingKeyFramesStatics := IPointAnimationUsingKeyFramesStatics(factoryPtr)
        }

        return PointAnimationUsingKeyFrames.__IPointAnimationUsingKeyFramesStatics.get_EnableDependentAnimationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of [PointKeyFrame](pointkeyframe.md) objects that define the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimationusingkeyframes.keyframes
     * @type {PointKeyFrameCollection} 
     */
    KeyFrames {
        get => this.get_KeyFrames()
    }

    /**
     * Gets or sets a value that declares whether animated properties that are considered dependent animations should be permitted to use this animation declaration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.pointanimationusingkeyframes.enabledependentanimation
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PointAnimationUsingKeyFrames](pointanimationusingkeyframes.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PointAnimationUsingKeyFrames")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PointKeyFrameCollection} 
     */
    get_KeyFrames() {
        if (!this.HasProp("__IPointAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IPointAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimationUsingKeyFrames := IPointAnimationUsingKeyFrames(outPtr)
        }

        return this.__IPointAnimationUsingKeyFrames.get_KeyFrames()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        if (!this.HasProp("__IPointAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IPointAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimationUsingKeyFrames := IPointAnimationUsingKeyFrames(outPtr)
        }

        return this.__IPointAnimationUsingKeyFrames.get_EnableDependentAnimation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        if (!this.HasProp("__IPointAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IPointAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointAnimationUsingKeyFrames := IPointAnimationUsingKeyFrames(outPtr)
        }

        return this.__IPointAnimationUsingKeyFrames.put_EnableDependentAnimation(value)
    }

;@endregion Instance Methods
}
