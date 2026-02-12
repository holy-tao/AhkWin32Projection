#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IVisualState.ahk
#Include .\IVisualState2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the visual appearance of a UI element when it is in a specific state. Visual states use [Setters](visualstate_setters.md) or a [Storyboard](visualstate_storyboard.md) to set UI properties within pages or control templates where the VisualState is defined.
 * @remarks
 * A VisualState element must always be contained within a [VisualStateGroup](visualstategroup.md) parent in the XAML markup. The [VisualStateGroup](visualstategroup.md) has an implicit collection property [States](visualstategroup_states.md), so you can put each VisualState as an immediate child element of the [VisualStateGroup](visualstategroup.md) parent. For example:
 * 
 * ```xaml
 * 
 * <VisualStateGroup x:Name="CommonStates">
 *    <VisualState x:Name="Normal"/>
 *    <VisualState x:Name="PointerOver">...</VisualState>
 * <!-- do not need explicit VisualStateGroups.States property element, States is the XAML content property-->
 * </VisualStateGroup>
 * 
 * ```
 * 
 * When you use [StateTriggers](visualstate_statetriggers.md), ensure that the [VisualStateGroup](visualstategroup.md) is declared under the first child of the root in order for the triggers to take effect automatically.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstate
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class VisualState extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [VisualState](visualstate.md).
     * @remarks
     * Name is a read-only property that you can check with code at run-time to read the value of the [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) that was applied to a [VisualState](visualstate.md) in a XAML control template. You can't literally set Name because it's read-only, and [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) can only be set in XAML. The value is available as soon as the XAML that contains the control template and the [VisualState](visualstate.md) definition is loaded.
     * 
     * The need to check the Name of a [VisualState](visualstate.md) at run-time is anticipated to be relatively uncommon, and would only be relevant to advanced scenarios. For the most part, the definition of a [VisualState](visualstate.md) in XAML combined with using [VisualStateManager](visualstatemanager.md) and [VisualStateGroup](visualstategroup.md) events in code provides you all that you need to define and invoke visual states for a custom or Windows Runtime-defined control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstate.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets or sets a [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) that defines state-specific property values and appearance of the control when it is using this visual state.
     * @remarks
     * The value of the [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) property is either **null** or a single [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) object. A [Storyboard](../windows.ui.xaml.media.animation/storyboard.md) is like a container for animations; it can contain one or more animation definitions. Each such animation can target a specific dependency property on a specific named target. The named target must be an element in the control template that has a [Name](frameworkelement_name.md) or [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) value defined in the template itself. The dependency property must be a property that exists in that object's object model, or an attached property. To target animations, you use the [Storyboard.TargetName](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetname) and [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) attached properties. For more info on how to define animations with XAML syntax, and the types of animations you can use, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
     * 
     * Animations that affect layout are potentially dependent animations, which can have performance consequences for users of your control when the control loads a [VisualState](visualstate.md). For more info, see [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstate.storyboard
     * @type {Storyboard} 
     */
    Storyboard {
        get => this.get_Storyboard()
        set => this.put_Storyboard(value)
    }

    /**
     * Gets a collection of [Setter](setter.md) objects that define discrete property values that control the appearance of [UIElement](uielement.md)s when this [VisualState](visualstate.md) is applied.
     * @remarks
     * Use this property to make discrete property value changes on multiple UI elements at one time when a [VisualState](visualstate.md) is applied.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstate.setters
     * @type {SetterBaseCollection} 
     */
    Setters {
        get => this.get_Setters()
    }

    /**
     * Gets a collection of [StateTriggerBase](statetriggerbase.md) objects that indicate when this [VisualState](visualstate.md) should be applied. If any (not all) of the triggers are active, the VisualState will be applied.
     * @remarks
     * Use this property to create rules in XAML that specify when a particular [VisualState](visualstate.md) is to be applied. You use StateTriggers directly in your XAML markup instead of calling [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md) in your code.
     * 
     * You can use the built-in [AdaptiveTrigger](adaptivetrigger.md) to create rules based on window size, which is useful for creating responsive UI. You can also extend [StateTriggerBase](statetriggerbase.md) to create your own custom triggers and use them within the StateTriggers property.
     * 
     * For more examples, see the [XAML Responsive Techniques sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlResponsiveTechniques?amp;amp;clcid=0x409) and the [State Triggers sample](https://go.microsoft.com/fwlink/p/?LinkId=620025&amp;amp;clcid=0x409).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstate.statetriggers
     * @type {IVector<StateTriggerBase>} 
     */
    StateTriggers {
        get => this.get_StateTriggers()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VisualState](visualstate.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualState")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IVisualState")) {
            if ((queryResult := this.QueryInterface(IVisualState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualState := IVisualState(outPtr)
        }

        return this.__IVisualState.get_Name()
    }

    /**
     * 
     * @returns {Storyboard} 
     */
    get_Storyboard() {
        if (!this.HasProp("__IVisualState")) {
            if ((queryResult := this.QueryInterface(IVisualState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualState := IVisualState(outPtr)
        }

        return this.__IVisualState.get_Storyboard()
    }

    /**
     * 
     * @param {Storyboard} value 
     * @returns {HRESULT} 
     */
    put_Storyboard(value) {
        if (!this.HasProp("__IVisualState")) {
            if ((queryResult := this.QueryInterface(IVisualState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualState := IVisualState(outPtr)
        }

        return this.__IVisualState.put_Storyboard(value)
    }

    /**
     * 
     * @returns {SetterBaseCollection} 
     */
    get_Setters() {
        if (!this.HasProp("__IVisualState2")) {
            if ((queryResult := this.QueryInterface(IVisualState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualState2 := IVisualState2(outPtr)
        }

        return this.__IVisualState2.get_Setters()
    }

    /**
     * 
     * @returns {IVector<StateTriggerBase>} 
     */
    get_StateTriggers() {
        if (!this.HasProp("__IVisualState2")) {
            if ((queryResult := this.QueryInterface(IVisualState2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualState2 := IVisualState2(outPtr)
        }

        return this.__IVisualState2.get_StateTriggers()
    }

;@endregion Instance Methods
}
