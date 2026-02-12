#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IPopInThemeAnimation.ahk
#Include .\IPopInThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that applies to pop-in components of controls (for example, tooltip-like UI on an object) as they appear. This animation combines opacity and translation.
 * @remarks
 * This animation does not move or change the object or its neighbors. This animation is meant to be applied to overlay content (like tooltips) when that content first appears. When the content dissapears, you should use a [PopOutThemeAnimation](popoutthemeanimation.md).
 * 
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class PopInThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPopInThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPopInThemeAnimation.IID

    /**
     * Identifies the [TargetName](popinthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => PopInThemeAnimation.get_TargetNameProperty()
    }

    /**
     * Identifies the [FromHorizontalOffset](popinthemeanimation_fromhorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation.fromhorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromHorizontalOffsetProperty {
        get => PopInThemeAnimation.get_FromHorizontalOffsetProperty()
    }

    /**
     * Identifies the [FromVerticalOffset](popinthemeanimation_fromverticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation.fromverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromVerticalOffsetProperty {
        get => PopInThemeAnimation.get_FromVerticalOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!PopInThemeAnimation.HasProp("__IPopInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopInThemeAnimationStatics.IID)
            PopInThemeAnimation.__IPopInThemeAnimationStatics := IPopInThemeAnimationStatics(factoryPtr)
        }

        return PopInThemeAnimation.__IPopInThemeAnimationStatics.get_TargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromHorizontalOffsetProperty() {
        if (!PopInThemeAnimation.HasProp("__IPopInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopInThemeAnimationStatics.IID)
            PopInThemeAnimation.__IPopInThemeAnimationStatics := IPopInThemeAnimationStatics(factoryPtr)
        }

        return PopInThemeAnimation.__IPopInThemeAnimationStatics.get_FromHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromVerticalOffsetProperty() {
        if (!PopInThemeAnimation.HasProp("__IPopInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPopInThemeAnimationStatics.IID)
            PopInThemeAnimation.__IPopInThemeAnimationStatics := IPopInThemeAnimationStatics(factoryPtr)
        }

        return PopInThemeAnimation.__IPopInThemeAnimationStatics.get_FromVerticalOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation.fromhorizontaloffset
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
        set => this.put_FromHorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.popinthemeanimation.fromverticaloffset
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
        set => this.put_FromVerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PopInThemeAnimation](popinthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.PopInThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IPopInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopInThemeAnimation := IPopInThemeAnimation(outPtr)
        }

        return this.__IPopInThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IPopInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopInThemeAnimation := IPopInThemeAnimation(outPtr)
        }

        return this.__IPopInThemeAnimation.put_TargetName(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromHorizontalOffset() {
        if (!this.HasProp("__IPopInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopInThemeAnimation := IPopInThemeAnimation(outPtr)
        }

        return this.__IPopInThemeAnimation.get_FromHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromHorizontalOffset(value) {
        if (!this.HasProp("__IPopInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopInThemeAnimation := IPopInThemeAnimation(outPtr)
        }

        return this.__IPopInThemeAnimation.put_FromHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromVerticalOffset() {
        if (!this.HasProp("__IPopInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopInThemeAnimation := IPopInThemeAnimation(outPtr)
        }

        return this.__IPopInThemeAnimation.get_FromVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromVerticalOffset(value) {
        if (!this.HasProp("__IPopInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IPopInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPopInThemeAnimation := IPopInThemeAnimation(outPtr)
        }

        return this.__IPopInThemeAnimation.put_FromVerticalOffset(value)
    }

;@endregion Instance Methods
}
