#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Timeline.ahk
#Include .\IDropTargetItemThemeAnimation.ahk
#Include .\IDropTargetItemThemeAnimationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the preconfigured animation that applies to potential drop target elements.
 * @remarks
 * Note that setting the [Duration](timeline_duration.md) property has no effect on this object since the duration is preconfigured.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.droptargetitemthemeanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class DropTargetItemThemeAnimation extends Timeline {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDropTargetItemThemeAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDropTargetItemThemeAnimation.IID

    /**
     * Identifies the [TargetName](droptargetitemthemeanimation_targetname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.droptargetitemthemeanimation.targetnameproperty
     * @type {DependencyProperty} 
     */
    static TargetNameProperty {
        get => DropTargetItemThemeAnimation.get_TargetNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TargetNameProperty() {
        if (!DropTargetItemThemeAnimation.HasProp("__IDropTargetItemThemeAnimationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DropTargetItemThemeAnimation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDropTargetItemThemeAnimationStatics.IID)
            DropTargetItemThemeAnimation.__IDropTargetItemThemeAnimationStatics := IDropTargetItemThemeAnimationStatics(factoryPtr)
        }

        return DropTargetItemThemeAnimation.__IDropTargetItemThemeAnimationStatics.get_TargetNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the reference name of the control element being targeted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.droptargetitemthemeanimation.targetname
     * @type {HSTRING} 
     */
    TargetName {
        get => this.get_TargetName()
        set => this.put_TargetName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DropTargetItemThemeAnimation](droptargetitemthemeanimation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.DropTargetItemThemeAnimation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TargetName() {
        if (!this.HasProp("__IDropTargetItemThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDropTargetItemThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropTargetItemThemeAnimation := IDropTargetItemThemeAnimation(outPtr)
        }

        return this.__IDropTargetItemThemeAnimation.get_TargetName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TargetName(value) {
        if (!this.HasProp("__IDropTargetItemThemeAnimation")) {
            if ((queryResult := this.QueryInterface(IDropTargetItemThemeAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropTargetItemThemeAnimation := IDropTargetItemThemeAnimation(outPtr)
        }

        return this.__IDropTargetItemThemeAnimation.put_TargetName(value)
    }

;@endregion Instance Methods
}
