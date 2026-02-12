#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IRepositionThemeAnimation.ahk
#Include .\IRepositionThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Use to animate an object that is being repositioned.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class RepositionThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRepositionThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRepositionThemeAnimation.IID

    /**
     * Identifies the [TargetName](repositionthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => RepositionThemeAnimation.get_TargetNameProperty()
    }

    /**
     * Identifies the [FromHorizontalOffset](repositionthemeanimation_fromhorizontaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation.fromhorizontaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromHorizontalOffsetProperty {
        get => RepositionThemeAnimation.get_FromHorizontalOffsetProperty()
    }

    /**
     * Identifies the [FromVerticalOffset](repositionthemeanimation_fromverticaloffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation.fromverticaloffsetproperty
     * @type {DependencyProperty} 
     */
    static FromVerticalOffsetProperty {
        get => RepositionThemeAnimation.get_FromVerticalOffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!RepositionThemeAnimation.HasProp("__IRepositionThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepositionThemeAnimationStatics.IID)
            RepositionThemeAnimation.__IRepositionThemeAnimationStatics := IRepositionThemeAnimationStatics(factoryPtr)
        }

        return RepositionThemeAnimation.__IRepositionThemeAnimationStatics.get_TargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromHorizontalOffsetProperty() {
        if (!RepositionThemeAnimation.HasProp("__IRepositionThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepositionThemeAnimationStatics.IID)
            RepositionThemeAnimation.__IRepositionThemeAnimationStatics := IRepositionThemeAnimationStatics(factoryPtr)
        }

        return RepositionThemeAnimation.__IRepositionThemeAnimationStatics.get_FromHorizontalOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FromVerticalOffsetProperty() {
        if (!RepositionThemeAnimation.HasProp("__IRepositionThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepositionThemeAnimationStatics.IID)
            RepositionThemeAnimation.__IRepositionThemeAnimationStatics := IRepositionThemeAnimationStatics(factoryPtr)
        }

        return RepositionThemeAnimation.__IRepositionThemeAnimationStatics.get_FromVerticalOffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the horizontal direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation.fromhorizontaloffset
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
        set => this.put_FromHorizontalOffset(value)
    }

    /**
     * Gets or sets the distance by which the target is translated in the vertical direction when the animation is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.repositionthemeanimation.fromverticaloffset
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
        set => this.put_FromVerticalOffset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RepositionThemeAnimation](repositionthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.RepositionThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IRepositionThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeAnimation := IRepositionThemeAnimation(outPtr)
        }

        return this.__IRepositionThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IRepositionThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeAnimation := IRepositionThemeAnimation(outPtr)
        }

        return this.__IRepositionThemeAnimation.put_TargetName(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromHorizontalOffset() {
        if (!this.HasProp("__IRepositionThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeAnimation := IRepositionThemeAnimation(outPtr)
        }

        return this.__IRepositionThemeAnimation.get_FromHorizontalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromHorizontalOffset(value) {
        if (!this.HasProp("__IRepositionThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeAnimation := IRepositionThemeAnimation(outPtr)
        }

        return this.__IRepositionThemeAnimation.put_FromHorizontalOffset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromVerticalOffset() {
        if (!this.HasProp("__IRepositionThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeAnimation := IRepositionThemeAnimation(outPtr)
        }

        return this.__IRepositionThemeAnimation.get_FromVerticalOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_FromVerticalOffset(value) {
        if (!this.HasProp("__IRepositionThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IRepositionThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRepositionThemeAnimation := IRepositionThemeAnimation(outPtr)
        }

        return this.__IRepositionThemeAnimation.put_FromVerticalOffset(value)
    }

;@endregion Instance Methods
}
