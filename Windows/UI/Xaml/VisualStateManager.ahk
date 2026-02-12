#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IVisualStateManager.ahk
#Include .\IVisualStateManagerProtected.ahk
#Include .\IVisualStateManagerOverrides.ahk
#Include .\IVisualStateManagerStatics.ahk
#Include .\IVisualStateManagerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages visual states and the logic for transitions between visual states for controls. Also provides the attached property support for VisualStateManager.VisualStateGroups, which is how you define visual states in XAML for a control template.
 * @remarks
 * VisualStateManager supports two important features for control authors, and for app developers who are applying a custom template to a control:
 * 
 * + Control authors or app developers add [VisualStateGroup](visualstategroup.md) object elements to the root element of a control template definition in XAML, using the **VisualStateManager.VisualStateGroups** attached property. Within a VisualStateGroup element, each [VisualState](visualstate.md) represents a discrete visual state of a control. Each VisualState has a name that is representative of a UI state that can be changed by the user, or changed by control logic. A VisualState consists mainly of a [Storyboard](visualstate_storyboard.md). This Storyboard targets individual dependency property value changes that should be applied whenever the control is in that visual state. For more info on how to write visual states in XAML, including example code, see [Storyboarded animations for visual states](/previous-versions/windows/apps/jj819808(v=win.10)).
 * + Control authors or app developers transition between these states by calling the static [GoToState](visualstatemanager_gotostate_443481648.md) method of VisualStateManager. Control authors do this whenever the control logic handles events that indicate a change of state, or control logic initiates a state change by itself. It's more common for control definition code to do this rather than app code, so that all the possible visual states and their transitions and trigger conditions are there by default for app code, and the logic is encapsulated by the control.
 * 
 * Most developers will use just two of the VisualStateManager APIs: VisualStateManager.VisualStateGroups, and [GoToState](visualstatemanager_gotostate_443481648.md), as described above. The remaining APIs are all for extension support and creating a custom VisualStateManager. For more info see the "Custom VisualStateManager" section in this topic.
 * 
 * When you edit copies of styles as enabled by the XAML design surface of Microsoft Visual Studio, the visual states from the default template are defined in the XAML you are editing. Make sure you don't delete these states or change their names, because the control logic is expecting that these visual states exist in the template.
 * 
 * In addition to the visual states, the visual state model also includes transitions. Transitions are animation actions controlled by a [Storyboard](visualtransition_storyboard.md) that occur between each visual state when the state is changed. The transition can be defined differently for each combination of starting state and ending state as defined by your control's set of visual states. Transitions are defined by the [Transitions](visualstategroup_transitions.md) property of VisualStateGroup, in XAML using property element syntax. Most default control templates don't define transitions. In absence of specifically defined transitions, the transitions between states happen instantaneously (zero-duration). For more info, see [VisualTransition](visualtransition.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class VisualStateManager extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualStateManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualStateManager.IID

    /**
     * Identifies the [VisualStateManager.CustomVisualStateManager](visualstatemanager_customvisualstatemanager.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.customvisualstatemanagerproperty
     * @type {DependencyProperty} 
     */
    static CustomVisualStateManagerProperty {
        get => VisualStateManager.get_CustomVisualStateManagerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the collection of [VisualStateGroup](visualstategroup.md) objects associated with the specified [FrameworkElement](frameworkelement.md).
     * @remarks
     * This API provides attached property support for XAML usages, and doesn't need to be changed in a custom [VisualStateManager](visualstatemanager.md) scenario.
     * @param {FrameworkElement} obj The object to get the value from.
     * @returns {IVector<VisualStateGroup>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.getvisualstategroups
     */
    static GetVisualStateGroups(obj) {
        if (!VisualStateManager.HasProp("__IVisualStateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualStateManagerStatics.IID)
            VisualStateManager.__IVisualStateManagerStatics := IVisualStateManagerStatics(factoryPtr)
        }

        return VisualStateManager.__IVisualStateManagerStatics.GetVisualStateGroups(obj)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CustomVisualStateManagerProperty() {
        if (!VisualStateManager.HasProp("__IVisualStateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualStateManagerStatics.IID)
            VisualStateManager.__IVisualStateManagerStatics := IVisualStateManagerStatics(factoryPtr)
        }

        return VisualStateManager.__IVisualStateManagerStatics.get_CustomVisualStateManagerProperty()
    }

    /**
     * Gets the value of the [VisualStateManager.CustomVisualStateManager](visualstatemanager_customvisualstatemanager.md) attached property.
     * @remarks
     * This API provides attached property support for XAML usages, and doesn't need to be changed in a custom [VisualStateManager](visualstatemanager.md) scenario.
     * @param {FrameworkElement} obj The object to get the value from.
     * @returns {VisualStateManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.getcustomvisualstatemanager
     */
    static GetCustomVisualStateManager(obj) {
        if (!VisualStateManager.HasProp("__IVisualStateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualStateManagerStatics.IID)
            VisualStateManager.__IVisualStateManagerStatics := IVisualStateManagerStatics(factoryPtr)
        }

        return VisualStateManager.__IVisualStateManagerStatics.GetCustomVisualStateManager(obj)
    }

    /**
     * Sets the value of the [VisualStateManager.CustomVisualStateManager](visualstatemanager_customvisualstatemanager.md) attached property.
     * @remarks
     * This API provides attached property support for XAML usages, and doesn't need to be changed in a custom [VisualStateManager](visualstatemanager.md) scenario.
     * @param {FrameworkElement} obj The target element where the property is set.
     * @param {VisualStateManager} value The [VisualStateManager](visualstatemanager.md) that transitions between the states of a control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.setcustomvisualstatemanager
     */
    static SetCustomVisualStateManager(obj, value) {
        if (!VisualStateManager.HasProp("__IVisualStateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualStateManagerStatics.IID)
            VisualStateManager.__IVisualStateManagerStatics := IVisualStateManagerStatics(factoryPtr)
        }

        return VisualStateManager.__IVisualStateManagerStatics.SetCustomVisualStateManager(obj, value)
    }

    /**
     * Transitions a control between two states, by requesting a new [VisualState](visualstate.md) by name.
     * @remarks
     * This method is used by control logic. You typically only need it if you are writing a custom control, or if you are using app-level logic for view states (such as refreshing your app content for changes in app window size or orientation).
     * 
     * When you call this method, there is expected to be a [VisualState](visualstate.md) with an **x:Name** value that matches your *stateName* value, somewhere in the control template for the control identified by *control*, or as a resource for your app. If there isn't, you don't get exceptions, but the return value will be **false**. The state named by *stateName* can be in any of the [VisualStateGroup](visualstategroup.md) elements in the template for the specified [Control](../windows.ui.xaml.controls/control.md). It's up to you to keep track of which states are in which [VisualStateGroup](visualstategroup.md) and knowing which state gets unloaded when you specify a new state from that group.
     * 
     * Typically the [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) that contains the visual states as referenced by name when using GoToState is not specifically defined for that control instance. Instead the visual states are from the default control style that's loaded as the implicit style for all instances of that control. For more info on the implicit style concept, see [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)).
     * 
     * [VisualStateManager](visualstatemanager.md) supports two important features for control authors, and for app developers who are applying a custom template to a control:
     * + Control authors or app developers add [VisualStateGroup](visualstategroup.md) object elements to the root element of a control template definition in XAML, using the [VisualStateManager.VisualStateGroups](/dotnet/api/system.windows.visualstatemanager.visualstategroups) attached property. Within a [VisualStateGroup](visualstategroup.md) element, each [VisualState](visualstate.md) represents a discrete visual state of a control. Each [VisualState](visualstate.md) has a name that is representative of a UI state that can be changed by the user, or changed by control logic. A [VisualState](visualstate.md) consists mainly of a [Storyboard](visualstate_storyboard.md). This [Storyboard](visualstate_storyboard.md) targets individual dependency property values that should be applied whenever the control is in that visual state.
     * + Control authors or app developers transition between these states by calling the static GoToState method of [VisualStateManager](visualstatemanager.md). Control authors do this whenever the control logic handles events that indicate a change of state, or control logic initiates a state change by itself. It's more common for control definition code to do this rather than app code, so that all the possible visual states and their transitions and trigger conditions are there by default for app code. Or, it's the app code that is changing visual states, to manage app-level view states in response to user-driven changes to the size or orientation of the main app window.
     * 
     * 
     * When you call GoToState to change the visual state of a control, the [VisualStateManager](visualstatemanager.md) performs these actions:
     * + First it's determined whether a state that matches *stateName* exists. If not, nothing happens and the method returns **false**.
     * + If the [VisualState](visualstate.md) as named by *stateName* exists, and has a [Storyboard](visualstate_storyboard.md), the storyboard begins.
     * + If the [VisualState](visualstate.md) that the control was using from that same [VisualStateGroup](visualstategroup.md) prior to the newly requested state has a [Storyboard](visualstate_storyboard.md), that storyboard stops. Other than the specific properties that the new [VisualState](visualstate.md) applies an animation to, the control reverts to the initially loaded states from the control template and its composition.
     * 
     * 
     * If the control is already in the [VisualState](visualstate.md) requested as *stateName*, GoToState returns **true**, but there is otherwise no action (the storyboard won't be restarted).
     * 
     * A common control implementation pattern is to define a single private method of the control class that takes care of all possible [VisualState](visualstate.md) changes for the control. Which visual state to use is determined by checking the control's properties. These properties might be public or private. Values of properties are adjusted by handlers in control logic for events such as [OnGotFocus](../windows.ui.xaml.controls/control_ongotfocus_1398920478.md), and are checked just-in-time immediately before setting the visual state. The code example in this topic uses this implementation pattern. Alternatively, you can call GoToState for individual states from within event handlers, from control event handler overrides (the **On**_Event_ methods), or from helper methods that are called by all possible impetus for changing states (user-driven events, automation events, initialization logic).
     * 
     * You might also call GoToState from within the [PropertyChangedCallback](propertychangedcallback.md) implementation for a custom dependency property.
     * @param {Control} control_ The control to transition between states.
     * @param {HSTRING} stateName The state to transition to.
     * @param {Boolean} useTransitions **true** to use a [VisualTransition](visualtransition.md) to transition between states. **false** to skip using transitions and go directly to the requested state. The default is **false**.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.gotostate
     */
    static GoToState(control_, stateName, useTransitions) {
        if (!VisualStateManager.HasProp("__IVisualStateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualStateManagerStatics.IID)
            VisualStateManager.__IVisualStateManagerStatics := IVisualStateManagerStatics(factoryPtr)
        }

        return VisualStateManager.__IVisualStateManagerStatics.GoToState(control_, stateName, useTransitions)
    }

    /**
     * 
     * @returns {VisualStateManager} 
     */
    static CreateInstance() {
        if (!VisualStateManager.HasProp("__IVisualStateManagerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualStateManagerFactory.IID)
            VisualStateManager.__IVisualStateManagerFactory := IVisualStateManagerFactory(factoryPtr)
        }

        return VisualStateManager.__IVisualStateManagerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * When overridden in a derived class, fires the [CurrentStateChanging](visualstategroup_currentstatechanging.md) event on the specified [VisualStateGroup](visualstategroup.md).
     * @remarks
     * This API is part of the scenario of defining a custom [VisualStateManager](visualstatemanager.md) behavior. The most important method to override in this scenario is [GoToStateCore](visualstatemanager_gotostatecore_681569745.md), because it's that method that changes the state behavior in your custom class behavior. Overriding the behavior of [RaiseCurrentStateChanged](visualstatemanager_raisecurrentstatechanged_506662503.md) and RaiseCurrentStateChanging is optional: how and when the events are raised by the default implementation might be adequate for your custom class.
     * @param {VisualStateGroup} stateGroup The object that the [CurrentStateChanging](visualstategroup_currentstatechanging.md) event occurred on.
     * @param {VisualState} oldState The state that the control is transitioning from.
     * @param {VisualState} newState The state that the control should transition to.
     * @param {Control} control_ The control where the transition animation between states is applied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.raisecurrentstatechanging
     */
    RaiseCurrentStateChanging(stateGroup, oldState, newState, control_) {
        if (!this.HasProp("__IVisualStateManagerProtected")) {
            if ((queryResult := this.QueryInterface(IVisualStateManagerProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateManagerProtected := IVisualStateManagerProtected(outPtr)
        }

        return this.__IVisualStateManagerProtected.RaiseCurrentStateChanging(stateGroup, oldState, newState, control_)
    }

    /**
     * When overridden in a derived class, fires the [CurrentStateChanged](visualstategroup_currentstatechanged.md) event on the specified [VisualStateGroup](visualstategroup.md).
     * @remarks
     * This API is part of the scenario of defining a custom [VisualStateManager](visualstatemanager.md) behavior. The most important method to override in this scenario is [GoToStateCore](visualstatemanager_gotostatecore_681569745.md), because it's that method that changes the state behavior in your custom class behavior. Overriding the behavior of RaiseCurrentStateChanged and [RaiseCurrentStateChanging](visualstatemanager_raisecurrentstatechanging_642620570.md) is optional: how and when the events are raised by the default implementation might be adequate for your custom class.
     * @param {VisualStateGroup} stateGroup The object on which the [CurrentStateChanging](visualstategroup_currentstatechanging.md) event occurred.
     * @param {VisualState} oldState The state that the control transitions from.
     * @param {VisualState} newState The state that the control transitions to.
     * @param {Control} control_ The control that transitioned states.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.raisecurrentstatechanged
     */
    RaiseCurrentStateChanged(stateGroup, oldState, newState, control_) {
        if (!this.HasProp("__IVisualStateManagerProtected")) {
            if ((queryResult := this.QueryInterface(IVisualStateManagerProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateManagerProtected := IVisualStateManagerProtected(outPtr)
        }

        return this.__IVisualStateManagerProtected.RaiseCurrentStateChanged(stateGroup, oldState, newState, control_)
    }

    /**
     * When overridden in a derived class, transitions a control between states.
     * @remarks
     * This API is part of the scenario of defining a custom [VisualStateManager](visualstatemanager.md) behavior. Overriding GoToStateCore changes the state behavior in your custom class behavior. 
     * 
     * To reference your custom [VisualStateManager](visualstatemanager.md) class, set the value of the [VisualStateManager.CustomVisualStateManager](/uwp/api/windows.ui.xaml.visualstatemanager.customvisualstatemanager) attached property within any control template where you want to use the custom [VisualStateManager](visualstatemanager.md) class behavior. You typically create an instance of the custom [VisualStateManager](visualstatemanager.md) class through default XAML construction in [Application.Resources](application_resources.md). Then the [VisualStateManager.CustomVisualStateManager](/uwp/api/windows.ui.xaml.visualstatemanager.customvisualstatemanager) attached property is set using a [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) reference to the key of the custom [VisualStateManager](visualstatemanager.md) resource.
     * @param {Control} control_ The control to transition between states.
     * @param {FrameworkElement} templateRoot The root element of the control's [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md).
     * @param {HSTRING} stateName The name of the state to transition to.
     * @param {VisualStateGroup} group The [VisualStateGroup](visualstategroup.md) that the state belongs to.
     * @param {VisualState} state The representation of the state to transition to.
     * @param {Boolean} useTransitions **true** to use a [VisualTransition](visualtransition.md) to transition between states; otherwise, **false**.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstatemanager.gotostatecore
     */
    GoToStateCore(control_, templateRoot, stateName, group, state, useTransitions) {
        if (!this.HasProp("__IVisualStateManagerOverrides")) {
            if ((queryResult := this.QueryInterface(IVisualStateManagerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateManagerOverrides := IVisualStateManagerOverrides(outPtr)
        }

        return this.__IVisualStateManagerOverrides.GoToStateCore(control_, templateRoot, stateName, group, state, useTransitions)
    }

;@endregion Instance Methods
}
