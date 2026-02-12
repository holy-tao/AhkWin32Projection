#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ButtonBase.ahk
#Include .\IToggleButton.ahk
#Include .\IToggleButtonOverrides.ahk
#Include .\IToggleButtonFactory.ahk
#Include .\IToggleButtonStatics.ahk
#Include ..\..\RoutedEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that a user can select (check) or clear (uncheck). Base class for controls that can switch states, such as [CheckBox](../windows.ui.xaml.controls/checkbox.md) and [RadioButton](../windows.ui.xaml.controls/radiobutton.md).
 * @remarks
 * ToggleButton can have three states:
 * 
 * | State | Property | Value |
 * |-------|----------|-------|
 * | checked | [IsChecked](togglebutton_ischecked.md) | **true** |
 * | unchecked | [IsChecked](togglebutton_ischecked.md) | **false** |
 * | indeterminate | [IsChecked](togglebutton_ischecked.md) | **null** |
 * 
 *  For the ToggleButton to report the indeterminate state, you must set the [IsThreeState](togglebutton_isthreestate.md) property to **true**.
 * 
 * > [!NOTE]
 * > ToggleButton has the same visual state for the indeterminate and unchecked states. Derived controls, like [CheckBox](../windows.ui.xaml.controls/checkbox.md), may define different visual states for each state.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.togglebutton
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ToggleButton extends ButtonBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleButton.IID

    /**
     * Identifies the [IsChecked](togglebutton_ischecked.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.togglebutton.ischeckedproperty
     * @type {DependencyProperty} 
     */
    static IsCheckedProperty {
        get => ToggleButton.get_IsCheckedProperty()
    }

    /**
     * Identifies the [IsThreeState](togglebutton_isthreestate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.togglebutton.isthreestateproperty
     * @type {DependencyProperty} 
     */
    static IsThreeStateProperty {
        get => ToggleButton.get_IsThreeStateProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ToggleButton} 
     */
    static CreateInstance() {
        if (!ToggleButton.HasProp("__IToggleButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleButtonFactory.IID)
            ToggleButton.__IToggleButtonFactory := IToggleButtonFactory(factoryPtr)
        }

        return ToggleButton.__IToggleButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCheckedProperty() {
        if (!ToggleButton.HasProp("__IToggleButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleButtonStatics.IID)
            ToggleButton.__IToggleButtonStatics := IToggleButtonStatics(factoryPtr)
        }

        return ToggleButton.__IToggleButtonStatics.get_IsCheckedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsThreeStateProperty() {
        if (!ToggleButton.HasProp("__IToggleButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleButtonStatics.IID)
            ToggleButton.__IToggleButtonStatics := IToggleButtonStatics(factoryPtr)
        }

        return ToggleButton.__IToggleButtonStatics.get_IsThreeStateProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets whether the [ToggleButton](togglebutton.md) is checked.
     * @remarks
     * [ToggleButton](togglebutton.md) and can have three states: <table>
     *    <tr><th>State</th><th>Property</th><th>Value</th></tr>
     *    <tr><td>checked</td><td>IsChecked</td><td><b>true</b></td></tr>
     *    <tr><td>unchecked</td><td>IsChecked</td><td><b>false</b></td></tr>
     *    <tr><td>indeterminate</td><td>IsChecked</td><td><b>null</b></td></tr>
     * </table>
     * 
     *  For the [ToggleButton](togglebutton.md) to report the indeterminate state, you must set the [IsThreeState](togglebutton_isthreestate.md) property to **true**.
     * 
     * > [!NOTE]
     * > [ToggleButton](togglebutton.md) has the same visual state for the indeterminate and unchecked states. Derived controls, like [CheckBox](../windows.ui.xaml.controls/checkbox.md), may define different visual states for each state.
     * 
     * To set the value to **null** in XAML, use the [{x:Null} markup extension](/windows/uwp/xaml-platform/x-null-markup-extension).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.togglebutton.ischecked
     * @type {IReference<Boolean>} 
     */
    IsChecked {
        get => this.get_IsChecked()
        set => this.put_IsChecked(value)
    }

    /**
     * Gets or sets a value that indicates whether the control supports three states.
     * @remarks
     * [ToggleButton](togglebutton.md) and can have three states:
     * 
     * | State | Property | Value |
     * |---|---|---|
     * | checked | [IsChecked](togglebutton_ischecked.md) | **true** |
     * | unchecked | [IsChecked](togglebutton_ischecked.md) | **false** |
     * | indeterminate | [IsChecked](togglebutton_ischecked.md) | **null** |
     * 
     * For the [ToggleButton](togglebutton.md) to report the indeterminate state, you must set the IsThreeState property to **true**.
     * 
     * > [!NOTE]
     * > [ToggleButton](togglebutton.md) has the same visual state for the indeterminate and unchecked states. Derived controls, like [CheckBox](../windows.ui.xaml.controls/checkbox.md), may define different visual states for each state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.togglebutton.isthreestate
     * @type {Boolean} 
     */
    IsThreeState {
        get => this.get_IsThreeState()
        set => this.put_IsThreeState(value)
    }

    /**
     * Fires when a [ToggleButton](togglebutton.md) is checked.
     * @type {RoutedEventHandler}
    */
    OnChecked {
        get {
            if(!this.HasProp("__OnChecked")){
                this.__OnChecked := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnCheckedToken := this.add_Checked(this.__OnChecked.iface)
            }
            return this.__OnChecked
        }
    }

    /**
     * Occurs when a [ToggleButton](togglebutton.md) is unchecked.
     * @type {RoutedEventHandler}
    */
    OnUnchecked {
        get {
            if(!this.HasProp("__OnUnchecked")){
                this.__OnUnchecked := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnUncheckedToken := this.add_Unchecked(this.__OnUnchecked.iface)
            }
            return this.__OnUnchecked
        }
    }

    /**
     * Fires when the state of a [ToggleButton](togglebutton.md) is switched to the indeterminate state.
     * @type {RoutedEventHandler}
    */
    OnIndeterminate {
        get {
            if(!this.HasProp("__OnIndeterminate")){
                this.__OnIndeterminate := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnIndeterminateToken := this.add_Indeterminate(this.__OnIndeterminate.iface)
            }
            return this.__OnIndeterminate
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCheckedToken")) {
            this.remove_Checked(this.__OnCheckedToken)
            this.__OnChecked.iface.Dispose()
        }

        if(this.HasProp("__OnUncheckedToken")) {
            this.remove_Unchecked(this.__OnUncheckedToken)
            this.__OnUnchecked.iface.Dispose()
        }

        if(this.HasProp("__OnIndeterminateToken")) {
            this.remove_Indeterminate(this.__OnIndeterminateToken)
            this.__OnIndeterminate.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_IsChecked() {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.get_IsChecked()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_IsChecked(value) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.put_IsChecked(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThreeState() {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.get_IsThreeState()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsThreeState(value) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.put_IsThreeState(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Checked(handler) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.add_Checked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Checked(token) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.remove_Checked(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Unchecked(handler) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.add_Unchecked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Unchecked(token) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.remove_Unchecked(token)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Indeterminate(handler) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.add_Indeterminate(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Indeterminate(token) {
        if (!this.HasProp("__IToggleButton")) {
            if ((queryResult := this.QueryInterface(IToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButton := IToggleButton(outPtr)
        }

        return this.__IToggleButton.remove_Indeterminate(token)
    }

    /**
     * Called when the [ToggleButton](togglebutton.md) receives toggle stimulus.
     * @remarks
     * The default implementation raises a [Click](buttonbase_click.md) event in response to the stimulus.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.togglebutton.ontoggle
     */
    OnToggle() {
        if (!this.HasProp("__IToggleButtonOverrides")) {
            if ((queryResult := this.QueryInterface(IToggleButtonOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleButtonOverrides := IToggleButtonOverrides(outPtr)
        }

        return this.__IToggleButtonOverrides.OnToggle()
    }

;@endregion Instance Methods
}
