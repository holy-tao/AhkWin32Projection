#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IDrillInThemeAnimation.ahk
#Include .\IDrillInThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a preconfigured animation that runs when a user navigates forward in a logical hierarchy, like from a master page to a detail page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DrillInThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDrillInThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDrillInThemeAnimation.IID

    /**
     * Identifies the [EntranceTargetName](drillinthemeanimation_entrancetargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.entrancetargetnameproperty
     * @type {DependencyProperty} 
     */
    static EntranceTargetNameProperty {
        get => DrillInThemeAnimation.get_EntranceTargetNameProperty()
    }

    /**
     * Identifies the [EntranceTarget](drillinthemeanimation_entrancetarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.entrancetargetproperty
     * @type {DependencyProperty} 
     */
    static EntranceTargetProperty {
        get => DrillInThemeAnimation.get_EntranceTargetProperty()
    }

    /**
     * Identifies the [ExitTargetName](drillinthemeanimation_exittargetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.exittargetnameproperty
     * @type {DependencyProperty} 
     */
    static ExitTargetNameProperty {
        get => DrillInThemeAnimation.get_ExitTargetNameProperty()
    }

    /**
     * Identifies the [ExitTarget](drillinthemeanimation_exittarget.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.exittargetproperty
     * @type {DependencyProperty} 
     */
    static ExitTargetProperty {
        get => DrillInThemeAnimation.get_ExitTargetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EntranceTargetNameProperty() {
        if (!DrillInThemeAnimation.HasProp("__IDrillInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillInThemeAnimationStatics.IID)
            DrillInThemeAnimation.__IDrillInThemeAnimationStatics := IDrillInThemeAnimationStatics(factoryPtr)
        }

        return DrillInThemeAnimation.__IDrillInThemeAnimationStatics.get_EntranceTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EntranceTargetProperty() {
        if (!DrillInThemeAnimation.HasProp("__IDrillInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillInThemeAnimationStatics.IID)
            DrillInThemeAnimation.__IDrillInThemeAnimationStatics := IDrillInThemeAnimationStatics(factoryPtr)
        }

        return DrillInThemeAnimation.__IDrillInThemeAnimationStatics.get_EntranceTargetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitTargetNameProperty() {
        if (!DrillInThemeAnimation.HasProp("__IDrillInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillInThemeAnimationStatics.IID)
            DrillInThemeAnimation.__IDrillInThemeAnimationStatics := IDrillInThemeAnimationStatics(factoryPtr)
        }

        return DrillInThemeAnimation.__IDrillInThemeAnimationStatics.get_ExitTargetNameProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ExitTargetProperty() {
        if (!DrillInThemeAnimation.HasProp("__IDrillInThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDrillInThemeAnimationStatics.IID)
            DrillInThemeAnimation.__IDrillInThemeAnimationStatics := IDrillInThemeAnimationStatics(factoryPtr)
        }

        return DrillInThemeAnimation.__IDrillInThemeAnimationStatics.get_ExitTargetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name of the element that is animating into view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.entrancetargetname
     * @type {HSTRING} 
     */
    EntranceTargetName {
        get => this.get_EntranceTargetName()
        set => this.put_EntranceTargetName(value)
    }

    /**
     * Gets or sets the element that is animating into view, such as a detail page.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.entrancetarget
     * @type {DependencyObject} 
     */
    EntranceTarget {
        get => this.get_EntranceTarget()
        set => this.put_EntranceTarget(value)
    }

    /**
     * Gets of sets the name of the element that is animating out of view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.exittargetname
     * @type {HSTRING} 
     */
    ExitTargetName {
        get => this.get_ExitTargetName()
        set => this.put_ExitTargetName(value)
    }

    /**
     * Gets or sets the element that is animating out of view, such as a master page.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.drillinthemeanimation.exittarget
     * @type {DependencyObject} 
     */
    ExitTarget {
        get => this.get_ExitTarget()
        set => this.put_ExitTarget(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DrillInThemeAnimation](drillinthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DrillInThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EntranceTargetName() {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.get_EntranceTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EntranceTargetName(value) {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.put_EntranceTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_EntranceTarget() {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.get_EntranceTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_EntranceTarget(value) {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.put_EntranceTarget(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExitTargetName() {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.get_ExitTargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExitTargetName(value) {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.put_ExitTargetName(value)
    }

    /**
     * 
     * @returns {DependencyObject} 
     */
    get_ExitTarget() {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.get_ExitTarget()
    }

    /**
     * 
     * @param {DependencyObject} value 
     * @returns {HRESULT} 
     */
    put_ExitTarget(value) {
        if (!this.HasProp("__IDrillInThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDrillInThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDrillInThemeAnimation := IDrillInThemeAnimation(outPtr)
        }

        return this.__IDrillInThemeAnimation.put_ExitTarget(value)
    }

;@endregion Instance Methods
}
