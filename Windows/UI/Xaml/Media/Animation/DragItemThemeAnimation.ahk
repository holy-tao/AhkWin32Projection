#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IDragItemThemeAnimation.ahk
#Include .\IDragItemThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that applies to item elements being dragged.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragitemthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DragItemThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDragItemThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDragItemThemeAnimation.IID

    /**
     * Identifies the [TargetName](dragitemthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragitemthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => DragItemThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!DragItemThemeAnimation.HasProp("__IDragItemThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DragItemThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDragItemThemeAnimationStatics.IID)
            DragItemThemeAnimation.__IDragItemThemeAnimationStatics := IDragItemThemeAnimationStatics(factoryPtr)
        }

        return DragItemThemeAnimation.__IDragItemThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.dragitemthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DragItemThemeAnimation](dragitemthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DragItemThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IDragItemThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragItemThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemThemeAnimation := IDragItemThemeAnimation(outPtr)
        }

        return this.__IDragItemThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IDragItemThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDragItemThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDragItemThemeAnimation := IDragItemThemeAnimation(outPtr)
        }

        return this.__IDragItemThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
