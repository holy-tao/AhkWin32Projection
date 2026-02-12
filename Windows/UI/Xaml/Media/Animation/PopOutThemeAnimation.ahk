#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IPopOutThemeAnimation.ahk
#Include .\IPopOutThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that applies to pop-in components of controls (for example, tooltip-like UI on an object) as they are closed/removed. This animation combines opacity and translation.
 * @remarks
 * This animation does not move or change the object or its neighbors. This animation is meant to be applied to overlay content (like tooltips) when that content is closed/removed. When the content first appears, you should use a [PopOutThemeAnimation](popinthemeanimation.md).
 * 
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popoutthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PopOutThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPopOutThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPopOutThemeAnimation.IID

    /**
     * Identifies the [TargetName](popoutthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popoutthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => PopOutThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!PopOutThemeAnimation.HasProp("__IPopOutThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopOutThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopOutThemeAnimationStatics.IID)
            PopOutThemeAnimation.__IPopOutThemeAnimationStatics := IPopOutThemeAnimationStatics(factoryPtr)
        }

        return PopOutThemeAnimation.__IPopOutThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popoutthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PopOutThemeAnimation](popoutthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopOutThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IPopOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopOutThemeAnimation := IPopOutThemeAnimation(outPtr)
        }

        return this.__IPopOutThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IPopOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopOutThemeAnimation := IPopOutThemeAnimation(outPtr)
        }

        return this.__IPopOutThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
