#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IFadeInThemeAnimation.ahk
#Include .\IFadeInThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured opacity animation that applies to controls when they are first shown.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fadeinthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class FadeInThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFadeInThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFadeInThemeAnimation.IID

    /**
     * Identifies the [TargetName](fadeinthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fadeinthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => FadeInThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!FadeInThemeAnimation.HasProp("__IFadeInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.FadeInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFadeInThemeAnimationStatics.IID)
            FadeInThemeAnimation.__IFadeInThemeAnimationStatics := IFadeInThemeAnimationStatics(factoryPtr)
        }

        return FadeInThemeAnimation.__IFadeInThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fadeinthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FadeInThemeAnimation](fadeinthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.FadeInThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IFadeInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IFadeInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFadeInThemeAnimation := IFadeInThemeAnimation(outPtr)
        }

        return this.__IFadeInThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IFadeInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IFadeInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFadeInThemeAnimation := IFadeInThemeAnimation(outPtr)
        }

        return this.__IFadeInThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
