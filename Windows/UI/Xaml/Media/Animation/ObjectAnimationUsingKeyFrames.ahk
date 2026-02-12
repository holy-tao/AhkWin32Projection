#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IObjectAnimationUsingKeyFrames.ahk
#Include .\IObjectAnimationUsingKeyFramesStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Animates the value of an [Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true) property along a set of [KeyFrames](objectanimationusingkeyframes_keyframes.md) over a specified [Duration](../windows.ui.xaml/duration.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectanimationusingkeyframes
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ObjectAnimationUsingKeyFrames extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IObjectAnimationUsingKeyFrames

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IObjectAnimationUsingKeyFrames.IID

    /**
     * Identifies the [EnableDependentAnimation](objectanimationusingkeyframes_enabledependentanimation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectanimationusingkeyframes.enabledependentanimationproperty
     * @type {DependencyProperty} 
     */
    static EnableDependentAnimationProperty {
        get => ObjectAnimationUsingKeyFrames.get_EnableDependentAnimationProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnableDependentAnimationProperty() {
        if (!ObjectAnimationUsingKeyFrames.HasProp("__IObjectAnimationUsingKeyFramesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ObjectAnimationUsingKeyFrames")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IObjectAnimationUsingKeyFramesStatics.IID)
            ObjectAnimationUsingKeyFrames.__IObjectAnimationUsingKeyFramesStatics := IObjectAnimationUsingKeyFramesStatics(factoryPtr)
        }

        return ObjectAnimationUsingKeyFrames.__IObjectAnimationUsingKeyFramesStatics.get_EnableDependentAnimationProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of [ObjectKeyFrame](objectkeyframe.md) objects that define the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectanimationusingkeyframes.keyframes
     * @type {ObjectKeyFrameCollection} 
     */
    KeyFrames {
        get => this.get_KeyFrames()
    }

    /**
     * Gets or sets a value that declares whether animated properties that are considered dependent animations should be permitted to use this animation declaration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.objectanimationusingkeyframes.enabledependentanimation
     * @type {Boolean} 
     */
    EnableDependentAnimation {
        get => this.get_EnableDependentAnimation()
        set => this.put_EnableDependentAnimation(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ObjectAnimationUsingKeyFrames](objectanimationusingkeyframes.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ObjectAnimationUsingKeyFrames")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {ObjectKeyFrameCollection} 
     */
    get_KeyFrames() {
        if (!this.HasProp("__IObjectAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IObjectAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectAnimationUsingKeyFrames := IObjectAnimationUsingKeyFrames(outPtr)
        }

        return this.__IObjectAnimationUsingKeyFrames.get_KeyFrames()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_EnableDependentAnimation() {
        if (!this.HasProp("__IObjectAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IObjectAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectAnimationUsingKeyFrames := IObjectAnimationUsingKeyFrames(outPtr)
        }

        return this.__IObjectAnimationUsingKeyFrames.get_EnableDependentAnimation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_EnableDependentAnimation(value) {
        if (!this.HasProp("__IObjectAnimationUsingKeyFrames")) {
            if ((queryResult := this.QueryInterface(IObjectAnimationUsingKeyFrames.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IObjectAnimationUsingKeyFrames := IObjectAnimationUsingKeyFrames(outPtr)
        }

        return this.__IObjectAnimationUsingKeyFrames.put_EnableDependentAnimation(value)
    }

;@endregion Instance Methods
}
