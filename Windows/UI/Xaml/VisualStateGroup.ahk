#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IVisualStateGroup.ahk
#Include .\VisualStateChangedEventHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\VisualStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains mutually exclusive [VisualState](visualstate.md) objects and [VisualTransition](visualtransition.md) objects that are used to go from one state to another.
 * @remarks
 * Each VisualStateGroup declared in XAML as part of a control template should always have an [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) set on it. Each name string used in the set of [VisualStateGroups](/dotnet/api/system.windows.visualstatemanager.visualstategroups) in a control template must be unique in that template. It's common to use the same group names for different controls though. For example, almost all existing control templates have a VisualStateGroup with [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) of "CommonStates".
 * 
 * The set of visual states within each VisualStateGroup should be mutually exclusive in the group. In other words, the control should be using exactly one of the visual states from each of its defined VisualStateGroup groups at all times. Whenever there's a case where a control is intended to be simultaneously in two states, make sure that the two states are in different groups. For example, it's possible for a drop-down control to simultaneously be focused and have its drop-down open. In a correct visual state design, you'd have a separate VisualStateGroup for each state so they can both be active at once. Such groups might have names like "FocusStates" and "DropDownStates".
 * 
 * Whenever you define a VisualStateGroup that enables a temporary storyboarded behavior in one of its [VisualState](visualstate.md) elements, make sure that group also contains a second [VisualState](visualstate.md) that can be called to cancel the previous state. This can be as simple as declaring the second [VisualState](visualstate.md) with no [Storyboard](visualstate_storyboard.md) at all, just an [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute).
 * 
 * The [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) value you set for a VisualStateGroup is not used for a call to [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md); instead it's the [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) of a [VisualState](visualstate.md) that is used for [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md). Anyone that uses [VisualStateManager.GoToState](visualstatemanager_gotostate_443481648.md) should be aware of all the groups and states available, so that each call correctly transitions from old states to new states within a group.
 * 
 * In addition to a set of [VisualState](visualstate.md) elements, a VisualStateGroup can also define a set of [VisualTransition](visualtransition.md) elements, where each [VisualTransition](visualtransition.md) pertains to at least one of the named [VisualState](visualstate.md) elements defined in the group. In XAML, the set of [VisualState](visualstate.md) elements can be declared as immediate object element child elements of the VisualStateGroup. This is possible because the [States](visualstategroup_states.md) property, which is the collection of visual states, is the XAML content property for VisualStateGroup. In contrast, to set the collection of visual transitions, you must declare that collection within a [VisualStateGroup.Transitions](visualstategroup_transitions.md) property element in XAML. For more info on XAML content properties, see [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide).
 * 
 * When using [StateTriggers](visualstate_statetriggers.md) to control visual states, the trigger engine uses the following precedence rules to score triggers and determine which trigger, and the corresponding [VisualState](visualstate.md), will be active:
 * 1. Custom trigger that derives from [StateTriggerBase](statetriggerbase.md)
 * 2. [AdaptiveTrigger](adaptivetrigger.md) activated due to [MinWindowWidth](adaptivetrigger_minwindowwidth.md)
 * 3. [AdaptiveTrigger](adaptivetrigger.md) activated due to [MinWindowHeight](adaptivetrigger_minwindowheight.md)
 * 
 * If there are multiple active triggers at a time that have a conflict in scoring (i.e. two active custom triggers), then the first one declared in the markup file takes precedence.
 * 
 * Note: While [AdaptiveTrigger](adaptivetrigger.md) does derive from [StateTriggerBase](statetriggerbase.md), it can only be activated through setting [MinWindowWidth](adaptivetrigger_minwindowwidth.md) and/or [MinWindowHeight](adaptivetrigger_minwindowheight.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstategroup
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class VisualStateGroup extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualStateGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualStateGroup.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the [VisualStateGroup](visualstategroup.md).
     * @remarks
     * Name is a read-only property that you can check with code at run-time to read the value of the [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) that was applied to a [VisualStateGroup](visualstategroup.md) in a XAML control template. You can't literally set Name because it's read-only, and [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) can only be set in XAML. The value is available as soon as the XAML that contains the control template and the [VisualStateGroup](visualstategroup.md) definition is loaded.
     * 
     * The need to check the [Name](visualstate_name.md) of a [VisualStateGroup](visualstategroup.md) at run-time is anticipated to be relatively uncommon, and would only be relevant to advanced scenarios. For the most part, the definition of a [VisualStateGroup](visualstategroup.md) in XAML combined with using [VisualStateManager](visualstatemanager.md) and [VisualStateGroup](visualstategroup.md) events in code provides you all that you need to define and invoke visual states for a custom or Windows Runtime-defined control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstategroup.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the collection of [VisualTransition](visualtransition.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstategroup.transitions
     * @type {IVector<VisualTransition>} 
     */
    Transitions {
        get => this.get_Transitions()
    }

    /**
     * Gets the collection of mutually exclusive [VisualState](visualstate.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstategroup.states
     * @type {IVector<VisualState>} 
     */
    States {
        get => this.get_States()
    }

    /**
     * Gets the most recently set [VisualState](visualstate.md) from a successful call to the [GoToState](visualstatemanager_gotostate_443481648.md) method.
     * @remarks
     * If [GoToState](visualstatemanager_gotostate_443481648.md) has never been called for the states in a particular [VisualStateGroup](visualstategroup.md), CurrentState is **null**. With correct design of controls and visual state, this shouldn't happen. The control logic for a control should always be able to select one state from a given [VisualStateGroup](visualstategroup.md), even if that state is a named state with no specific storyboarded behavior.
     * 
     * Because there are potentially multiple [VisualStateGroup](visualstategroup.md) sets of visual states for a control, each such [VisualStateGroup](visualstategroup.md) can report a CurrentState. For example, if you click on a [Button](../windows.ui.xaml.controls/button.md) with a default control template, the "CommonStates"  [VisualStateGroup](visualstategroup.md) reports a CurrentState of "Pressed", and the "FocusStates"  [VisualStateGroup](visualstategroup.md) reports a CurrentState of "PointerFocused".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.visualstategroup.currentstate
     * @type {VisualState} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * Occurs after a control changes into a different state.
     * @type {VisualStateChangedEventHandler}
    */
    OnCurrentStateChanged {
        get {
            if(!this.HasProp("__OnCurrentStateChanged")){
                this.__OnCurrentStateChanged := WinRTEventHandler(
                    VisualStateChangedEventHandler,
                    VisualStateChangedEventHandler.IID,
                    IInspectable,
                    VisualStateChangedEventArgs
                )
                this.__OnCurrentStateChangedToken := this.add_CurrentStateChanged(this.__OnCurrentStateChanged.iface)
            }
            return this.__OnCurrentStateChanged
        }
    }

    /**
     * Occurs when a control begins changing into a different state.
     * @type {VisualStateChangedEventHandler}
    */
    OnCurrentStateChanging {
        get {
            if(!this.HasProp("__OnCurrentStateChanging")){
                this.__OnCurrentStateChanging := WinRTEventHandler(
                    VisualStateChangedEventHandler,
                    VisualStateChangedEventHandler.IID,
                    IInspectable,
                    VisualStateChangedEventArgs
                )
                this.__OnCurrentStateChangingToken := this.add_CurrentStateChanging(this.__OnCurrentStateChanging.iface)
            }
            return this.__OnCurrentStateChanging
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [VisualStateGroup](visualstategroup.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.VisualStateGroup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCurrentStateChangedToken")) {
            this.remove_CurrentStateChanged(this.__OnCurrentStateChangedToken)
            this.__OnCurrentStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCurrentStateChangingToken")) {
            this.remove_CurrentStateChanging(this.__OnCurrentStateChangingToken)
            this.__OnCurrentStateChanging.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.get_Name()
    }

    /**
     * 
     * @returns {IVector<VisualTransition>} 
     */
    get_Transitions() {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.get_Transitions()
    }

    /**
     * 
     * @returns {IVector<VisualState>} 
     */
    get_States() {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.get_States()
    }

    /**
     * 
     * @returns {VisualState} 
     */
    get_CurrentState() {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.get_CurrentState()
    }

    /**
     * 
     * @param {VisualStateChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanged(handler) {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.add_CurrentStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentStateChanged(token) {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.remove_CurrentStateChanged(token)
    }

    /**
     * 
     * @param {VisualStateChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanging(handler) {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.add_CurrentStateChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentStateChanging(token) {
        if (!this.HasProp("__IVisualStateGroup")) {
            if ((queryResult := this.QueryInterface(IVisualStateGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualStateGroup := IVisualStateGroup(outPtr)
        }

        return this.__IVisualStateGroup.remove_CurrentStateChanging(token)
    }

;@endregion Instance Methods
}
