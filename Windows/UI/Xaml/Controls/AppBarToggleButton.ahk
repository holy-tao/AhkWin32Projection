#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ToggleButton.ahk
#Include .\IAppBarToggleButton.ahk
#Include .\IAppBarToggleButton3.ahk
#Include .\IAppBarToggleButton4.ahk
#Include .\IAppBarToggleButton5.ahk
#Include .\ICommandBarElement.ahk
#Include .\ICommandBarElement2.ahk
#Include .\IAppBarToggleButtonStatics.ahk
#Include .\IAppBarToggleButtonFactory.ahk
#Include .\IAppBarToggleButtonStatics4.ahk
#Include .\IAppBarToggleButtonStatics3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a button control that can switch states and be displayed in an [AppBar](appbar.md).
 * @remarks
 * An AppBarToggleButton is similar to an [AppBarButton](appbarbutton.md) with an additional toggle state. When used inside a [CommandBar](commandbar.md). the visual appearance changes based on whether the control appears in the primary commands or the overflow menu. Here is an example of a toggled button as both a primary command and secondary command.
 * 
 * <img src="images/AppBarToggleButton_TwoModes.png" alt="App bar button icon examples." />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AppBarToggleButton extends ToggleButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarToggleButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarToggleButton.IID

    /**
     * Identifies the [Label](appbartogglebutton_label.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.labelproperty
     * @type {DependencyProperty} 
     */
    static LabelProperty {
        get => AppBarToggleButton.get_LabelProperty()
    }

    /**
     * Identifies the [Icon](appbartogglebutton_icon.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.iconproperty
     * @type {DependencyProperty} 
     */
    static IconProperty {
        get => AppBarToggleButton.get_IconProperty()
    }

    /**
     * Identifies the [IsCompact](appbartogglebutton_iscompact.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.iscompactproperty
     * @type {DependencyProperty} 
     */
    static IsCompactProperty {
        get => AppBarToggleButton.get_IsCompactProperty()
    }

    /**
     * Identifies the [AppBarToggleButton.KeyboardAcceleratorTextOverride](appbartogglebutton_keyboardacceleratortextoverride.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.keyboardacceleratortextoverrideproperty
     * @type {DependencyProperty} 
     */
    static KeyboardAcceleratorTextOverrideProperty {
        get => AppBarToggleButton.get_KeyboardAcceleratorTextOverrideProperty()
    }

    /**
     * Identifies the [LabelPosition](appbartogglebutton_labelposition.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.labelpositionproperty
     * @type {DependencyProperty} 
     */
    static LabelPositionProperty {
        get => AppBarToggleButton.get_LabelPositionProperty()
    }

    /**
     * Identifies the [IsInOverflow](appbartogglebutton_isinoverflow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.isinoverflowproperty
     * @type {DependencyProperty} 
     */
    static IsInOverflowProperty {
        get => AppBarToggleButton.get_IsInOverflowProperty()
    }

    /**
     * Identifies the [DynamicOverflowOrder](appbartogglebutton_dynamicoverfloworder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.dynamicoverfloworderproperty
     * @type {DependencyProperty} 
     */
    static DynamicOverflowOrderProperty {
        get => AppBarToggleButton.get_DynamicOverflowOrderProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LabelProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics := IAppBarToggleButtonStatics(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics.get_LabelProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics := IAppBarToggleButtonStatics(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics.get_IconProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics := IAppBarToggleButtonStatics(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics.get_IsCompactProperty()
    }

    /**
     * 
     * @returns {AppBarToggleButton} 
     */
    static CreateInstance() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonFactory.IID)
            AppBarToggleButton.__IAppBarToggleButtonFactory := IAppBarToggleButtonFactory(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyboardAcceleratorTextOverrideProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics4.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics4 := IAppBarToggleButtonStatics4(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics4.get_KeyboardAcceleratorTextOverrideProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LabelPositionProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics3.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics3 := IAppBarToggleButtonStatics3(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics3.get_LabelPositionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsInOverflowProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics3.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics3 := IAppBarToggleButtonStatics3(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics3.get_IsInOverflowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DynamicOverflowOrderProperty() {
        if (!AppBarToggleButton.HasProp("__IAppBarToggleButtonStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarToggleButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarToggleButtonStatics3.IID)
            AppBarToggleButton.__IAppBarToggleButtonStatics3 := IAppBarToggleButtonStatics3(factoryPtr)
        }

        return AppBarToggleButton.__IAppBarToggleButtonStatics3.get_DynamicOverflowOrderProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text description displayed on the app bar toggle button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the graphic content of the app bar toggle button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.icon
     * @type {IconElement} 
     */
    Icon {
        get => this.get_Icon()
        set => this.put_Icon(value)
    }

    /**
     * Gets or sets a value that indicates the placement and visibility of the button's label.
     * @remarks
     * By default, the app bar button's label is displayed in the position specified by the [CommandBar.DefaultLabelPosition](commandbar_defaultlabelposition.md) property. You can set the LabelPosition property to override this value and make the label always collapsed for a specific app bar button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.labelposition
     * @type {Integer} 
     */
    LabelPosition {
        get => this.get_LabelPosition()
        set => this.put_LabelPosition(value)
    }

    /**
     * Gets or sets a string that overrides the default key combination string associated with a [keyboard accelerator](../windows.ui.xaml/uielement_keyboardaccelerators.md).
     * 
     * ![Example of a menu showing keyboard accelerators for various menu items](images/keyboard-accelerators.png)  
     * *Example of a menu showing keyboard accelerators for various menu items*
     * @remarks
     * Windows 10, version 1703, introduced [keyboard accelerator](../windows.ui.xaml/uielement_keyboardaccelerators.md) shortcuts. However, these shortcuts were not displayed with the UI of their corresponding controls.
     * 
     * Starting with Windows 10, version 1803, when [KeyboardAccelerators](../windows.ui.xaml/uielement_keyboardaccelerators.md) are declared, controls display the corresponding key combinations by default.
     * 
     * The override text is not be presented if the system cannot detect an attached keyboard (you can check this yourself through the [KeyboardPresent](../windows.devices.input/keyboardcapabilities_keyboardpresent.md) property).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.keyboardacceleratortextoverride
     * @type {HSTRING} 
     */
    KeyboardAcceleratorTextOverride {
        get => this.get_KeyboardAcceleratorTextOverride()
        set => this.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for an AppBarToggleButton control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.templatesettings
     * @type {AppBarToggleButtonTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets a value that indicates whether the button is shown with no label and reduced padding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.iscompact
     * @type {Boolean} 
     */
    IsCompact {
        get => this.get_IsCompact()
        set => this.put_IsCompact(value)
    }

    /**
     * Gets a value that indicates whether this item is in the overflow menu.
     * @remarks
     * For more info and guidelines, see the [App bar and command bar](/windows/uwp/controls-and-patterns/app-bars) article.
     * 
     * Starting in Windows 10, version 1607, [CommandBar](commandbar.md) introduces a dynamic overflow feature. By default, [PrimaryCommands](commandbar_primarycommands.md) automatically move in or out of the overflow area as the command bar width changes, for example, when users resize their app window. You can set the [IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) property to **false** to disable this behavior.
     * 
     * Dynamic overflow affects only the UI presentation of the commands, it doesn’t move commands from the [PrimaryCommands](commandbar_primarycommands.md) collection to [SecondaryCommands](commandbar_secondarycommands.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.isinoverflow
     * @type {Boolean} 
     */
    IsInOverflow {
        get => this.get_IsInOverflow()
    }

    /**
     * Gets or sets the order in which this item is moved to the [CommandBar](commandbar.md) overflow menu.
     * @remarks
     * For more info and guidelines, see the [App bar and command bar](/windows/uwp/controls-and-patterns/app-bars) article.
     * 
     * Starting in Windows 10, version 1607, [CommandBar](commandbar.md) introduces a dynamic overflow feature. By default, [PrimaryCommands](commandbar_primarycommands.md) automatically move in or out of the overflow area as the command bar width changes, for example, when users resize their app window. You can set the [IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) property to **false** to disable this behavior.
     * 
     * Dynamic overflow affects only the UI presentation of the commands, it doesn’t move commands from the [PrimaryCommands](commandbar_primarycommands.md) collection to [SecondaryCommands](commandbar_secondarycommands.md).
     * 
     * This property has an effect only when this element is in the [CommandBar.PrimaryCommands](commandbar_primarycommands.md) collection and [CommandBar.IsDynamicOverflowEnabled](commandbar_isdynamicoverflowenabled.md) is **true**.
     * 
     * You can assign the same DynamicOverflowOrder value to more than one element. Elements with the same value move in and out of the overflow area at the same time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbartogglebutton.dynamicoverfloworder
     * @type {Integer} 
     */
    DynamicOverflowOrder {
        get => this.get_DynamicOverflowOrder()
        set => this.put_DynamicOverflowOrder(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IAppBarToggleButton")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton := IAppBarToggleButton(outPtr)
        }

        return this.__IAppBarToggleButton.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IAppBarToggleButton")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton := IAppBarToggleButton(outPtr)
        }

        return this.__IAppBarToggleButton.put_Label(value)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_Icon() {
        if (!this.HasProp("__IAppBarToggleButton")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton := IAppBarToggleButton(outPtr)
        }

        return this.__IAppBarToggleButton.get_Icon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IAppBarToggleButton")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton := IAppBarToggleButton(outPtr)
        }

        return this.__IAppBarToggleButton.put_Icon(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LabelPosition() {
        if (!this.HasProp("__IAppBarToggleButton3")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton3 := IAppBarToggleButton3(outPtr)
        }

        return this.__IAppBarToggleButton3.get_LabelPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LabelPosition(value) {
        if (!this.HasProp("__IAppBarToggleButton3")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton3 := IAppBarToggleButton3(outPtr)
        }

        return this.__IAppBarToggleButton3.put_LabelPosition(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyboardAcceleratorTextOverride() {
        if (!this.HasProp("__IAppBarToggleButton4")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton4 := IAppBarToggleButton4(outPtr)
        }

        return this.__IAppBarToggleButton4.get_KeyboardAcceleratorTextOverride()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorTextOverride(value) {
        if (!this.HasProp("__IAppBarToggleButton4")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton4 := IAppBarToggleButton4(outPtr)
        }

        return this.__IAppBarToggleButton4.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * 
     * @returns {AppBarToggleButtonTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IAppBarToggleButton5")) {
            if ((queryResult := this.QueryInterface(IAppBarToggleButton5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarToggleButton5 := IAppBarToggleButton5(outPtr)
        }

        return this.__IAppBarToggleButton5.get_TemplateSettings()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCompact() {
        if (!this.HasProp("__ICommandBarElement")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement := ICommandBarElement(outPtr)
        }

        return this.__ICommandBarElement.get_IsCompact()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsCompact(value) {
        if (!this.HasProp("__ICommandBarElement")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement := ICommandBarElement(outPtr)
        }

        return this.__ICommandBarElement.put_IsCompact(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInOverflow() {
        if (!this.HasProp("__ICommandBarElement2")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement2 := ICommandBarElement2(outPtr)
        }

        return this.__ICommandBarElement2.get_IsInOverflow()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DynamicOverflowOrder() {
        if (!this.HasProp("__ICommandBarElement2")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement2 := ICommandBarElement2(outPtr)
        }

        return this.__ICommandBarElement2.get_DynamicOverflowOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DynamicOverflowOrder(value) {
        if (!this.HasProp("__ICommandBarElement2")) {
            if ((queryResult := this.QueryInterface(ICommandBarElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarElement2 := ICommandBarElement2(outPtr)
        }

        return this.__ICommandBarElement2.put_DynamicOverflowOrder(value)
    }

;@endregion Instance Methods
}
