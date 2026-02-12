#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IDrillOutThemeAnimation.ahk
#Include .\IDrillOutThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a preconfigured animation that runs when a user navigates backward in a logical hierarchy, like from a detail page to a master page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DrillOutThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDrillOutThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDrillOutThemeAnimation.IID

    /**
     * Identifies the [EntranceTargetName](drilloutthemeanimation_entrancetargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.entrancetargetnameproperty
     * @type {DependencyProperty} 
     */
    static EntranceTargetNameProperty {
        get => DrillOutThemeAnimation.get_EntranceTargetNameProperty()
    }

    /**
     * Identifies the [EntranceTarget](drilloutthemeanimation_entrancetarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.entrancetargetproperty
     * @type {DependencyProperty} 
     */
    static EntranceTargetProperty {
        get => DrillOutThemeAnimation.get_EntranceTargetProperty()
    }

    /**
     * Identifies the [ExitTargetName](drilloutthemeanimation_exittargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.exittargetnameproperty
     * @type {DependencyProperty} 
     */
    static ExitTargetNameProperty {
        get => DrillOutThemeAnimation.get_ExitTargetNameProperty()
    }

    /**
     * Identifies the [ExitTarget](drilloutthemeanimation_exittarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.exittargetproperty
     * @type {DependencyProperty} 
     */
    static ExitTargetProperty {
        get => DrillOutThemeAnimation.get_ExitTargetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EntranceTargetNameProperty() {
        if (!DrillOutThemeAnimation.HasProp("__IDrillOutThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillOutThemeAnimationStatics.IID)
            DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics := IDrillOutThemeAnimationStatics(factoryPtr)
        }

        return DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics.get_EntranceTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EntranceTargetProperty() {
        if (!DrillOutThemeAnimation.HasProp("__IDrillOutThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillOutThemeAnimationStatics.IID)
            DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics := IDrillOutThemeAnimationStatics(factoryPtr)
        }

        return DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics.get_EntranceTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitTargetNameProperty() {
        if (!DrillOutThemeAnimation.HasProp("__IDrillOutThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillOutThemeAnimationStatics.IID)
            DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics := IDrillOutThemeAnimationStatics(factoryPtr)
        }

        return DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics.get_ExitTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitTargetProperty() {
        if (!DrillOutThemeAnimation.HasProp("__IDrillOutThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillOutThemeAnimationStatics.IID)
            DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics := IDrillOutThemeAnimationStatics(factoryPtr)
        }

        return DrillOutThemeAnimation.__IDrillOutThemeAnimationStatics.get_ExitTargetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name of the element that is animating into view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.entrancetargetname
     * @type {HSTRING} 
     */
    EntranceTargetName {
        get => this.get_EntranceTargetName()
        set => this.put_EntranceTargetName(value)
    }

    /**
     * Gets or sets the element that is animating into view, such as a master page.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.entrancetarget
     * @type {DependencyObject} 
     */
    EntranceTarget {
        get => this.get_EntranceTarget()
        set => this.put_EntranceTarget(value)
    }

    /**
     * Gets of sets the name of the element that is animating out of view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.exittargetname
     * @type {HSTRING} 
     */
    ExitTargetName {
        get => this.get_ExitTargetName()
        set => this.put_ExitTargetName(value)
    }

    /**
     * Gets or sets the element that is animating out of view, such as a detail page.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drilloutthemeanimation.exittarget
     * @type {DependencyObject} 
     */
    ExitTarget {
        get => this.get_ExitTarget()
        set => this.put_ExitTarget(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DrillOutThemeAnimation](drilloutthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillOutThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EntranceTargetName() {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.get_EntranceTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EntranceTargetName(value) {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.put_EntranceTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_EntranceTarget() {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.get_EntranceTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_EntranceTarget(value) {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.put_EntranceTarget(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExitTargetName() {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.get_ExitTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExitTargetName(value) {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.put_ExitTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ExitTarget() {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.get_ExitTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ExitTarget(value) {
        if (!this.HasProp("__IDrillOutThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillOutThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillOutThemeAnimation := IDrillOutThemeAnimation(outPtr)
        }

        return this.__IDrillOutThemeAnimation.put_ExitTarget(value)
    }

;@endregion Instance Methods
}
