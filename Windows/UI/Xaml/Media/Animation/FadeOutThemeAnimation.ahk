#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IFadeOutThemeAnimation.ahk
#Include .\IFadeOutThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured opacity animation that applies to controls when they are removed from the UI or hidden.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fadeoutthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class FadeOutThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFadeOutThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFadeOutThemeAnimation.IID

    /**
     * Identifies the [TargetName](fadeoutthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fadeoutthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => FadeOutThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!FadeOutThemeAnimation.HasProp("__IFadeOutThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.FadeOutThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFadeOutThemeAnimationStatics.IID)
            FadeOutThemeAnimation.__IFadeOutThemeAnimationStatics := IFadeOutThemeAnimationStatics(factoryPtr)
        }

        return FadeOutThemeAnimation.__IFadeOutThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.fadeoutthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [FadeOutThemeAnimation](fadeoutthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.FadeOutThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IFadeOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IFadeOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFadeOutThemeAnimation := IFadeOutThemeAnimation(outPtr)
        }

        return this.__IFadeOutThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IFadeOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IFadeOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFadeOutThemeAnimation := IFadeOutThemeAnimation(outPtr)
        }

        return this.__IFadeOutThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
