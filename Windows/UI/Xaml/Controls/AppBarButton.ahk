#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Button.ahk
#Include .\IAppBarButton.ahk
#Include .\IAppBarButton3.ahk
#Include .\IAppBarButton4.ahk
#Include .\IAppBarButton5.ahk
#Include .\ICommandBarElement.ahk
#Include .\ICommandBarElement2.ahk
#Include .\IAppBarButtonStatics.ahk
#Include .\IAppBarButtonFactory.ahk
#Include .\IAppBarButtonStatics4.ahk
#Include .\IAppBarButtonStatics3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a templated button control to be displayed in an [AppBar](appbar.md).
 * @remarks
 * App bar buttons differ from standard buttons in several ways:
 * 
 * + The default appearance is a semi-transparent rectangle without a border.
 * + You use the [Label](appbarbutton_label.md) and [Icon](appbarbutton_icon.md) properties to set the content instead of the [Content](contentcontrol_content.md) property. The [Content](contentcontrol_content.md) property is ignored if the [Icon](appbarbutton_icon.md) is set.
 * + The button has the [IsCompact](appbarbutton_iscompact.md) property to control its size.
 * 
 * AppBarButton has two sizes; normal and compact. By default, it's shown with a text label and full padding. When the [IsCompact](appbarbutton_iscompact.md) property is set to **true**, the text label is hidden and the height of the button is reduced.
 * 
 * <p>Here are the same commands shown in their normal state,  and then in their compact state.</p>
 * <p>
 *     <img src="images/CommandBar_2Groups.png" alt="App bar buttons"></img>
 * </p>
 * <p>
 *     <img src="images/CommandBar_Compact.png" alt="Compact app bar buttons"></img>
 * </p>
 * 
 * When used in the [CommandBar](commandbar.md) control as part of the [PrimaryCommands](commandbar_primarycommands.md) collection, the [CommandBar](commandbar.md) sets the [IsCompact](appbarbutton_iscompact.md) property automatically as the control opens and closes. If you use an app bar button elsewhere, like in the [Content](contentcontrol_content.md) of a [CommandBar](commandbar.md), in an [AppBar](appbar.md), or the app canvas, you need to set the [IsCompact](appbarbutton_iscompact.md) property appropriately in your code. When used outside of an app bar, Windows guidelines indicate that the button should always be in its compact state. You should also include a [ToolTip](tooltip.md) to display the text label.
 * 
 * You use the [Label](appbarbutton_label.md) and [Icon](appbarbutton_icon.md) properties to define the content of the app bar buttons. Set the [Label](appbarbutton_label.md) property to a string to specify the text label. It’s shown by default, and is hidden when the button is in its compact state, so you also need to define a meaningful icon. To define the app bar button icon, set the [Icon](appbarbutton_icon.md) property to an element derived from the [IconElement](iconelement.md) class. There are four kinds of icon elements provided:
 * 
 * + [FontIcon](fonticon.md) - the icon is based on a glyph from the specified font family.
 * + [BitmapIcon](bitmapicon.md) - the icon is based on a bitmap image file with the specified **Uri**.
 * + [PathIcon](pathicon.md) - the icon is based on [Path](../windows.ui.xaml.shapes/path.md) data.
 * + [SymbolIcon](symbolicon.md) - the icon is based on a glyph from the Segoe MDL2 Assets font as listed in the [Symbol](symbol.md) enumeration.
 * 
 * AppBarButton icons have a default font size of 20px.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AppBarButton extends Button {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarButton.IID

    /**
     * Identifies the [Label](appbarbutton_label.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.labelproperty
     * @type {DependencyProperty} 
     */
    static LabelProperty {
        get => AppBarButton.get_LabelProperty()
    }

    /**
     * Identifies the [Icon](appbarbutton_icon.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.iconproperty
     * @type {DependencyProperty} 
     */
    static IconProperty {
        get => AppBarButton.get_IconProperty()
    }

    /**
     * Identifies the [IsCompact](appbarbutton_iscompact.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.iscompactproperty
     * @type {DependencyProperty} 
     */
    static IsCompactProperty {
        get => AppBarButton.get_IsCompactProperty()
    }

    /**
     * Identifies the [AppBarButton.KeyboardAcceleratorTextOverride](appbarbutton_keyboardacceleratortextoverride.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.keyboardacceleratortextoverrideproperty
     * @type {DependencyProperty} 
     */
    static KeyboardAcceleratorTextOverrideProperty {
        get => AppBarButton.get_KeyboardAcceleratorTextOverrideProperty()
    }

    /**
     * Identifies the [LabelPosition](appbarbutton_labelposition.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.labelpositionproperty
     * @type {DependencyProperty} 
     */
    static LabelPositionProperty {
        get => AppBarButton.get_LabelPositionProperty()
    }

    /**
     * Identifies the [IsInOverflow](appbarbutton_isinoverflow.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.isinoverflowproperty
     * @type {DependencyProperty} 
     */
    static IsInOverflowProperty {
        get => AppBarButton.get_IsInOverflowProperty()
    }

    /**
     * Identifies the [DynamicOverflowOrder](appbarbutton_dynamicoverfloworder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.dynamicoverfloworderproperty
     * @type {DependencyProperty} 
     */
    static DynamicOverflowOrderProperty {
        get => AppBarButton.get_DynamicOverflowOrderProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LabelProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics.IID)
            AppBarButton.__IAppBarButtonStatics := IAppBarButtonStatics(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics.get_LabelProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IconProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics.IID)
            AppBarButton.__IAppBarButtonStatics := IAppBarButtonStatics(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics.get_IconProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsCompactProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics.IID)
            AppBarButton.__IAppBarButtonStatics := IAppBarButtonStatics(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics.get_IsCompactProperty()
    }

    /**
     * 
     * @returns {AppBarButton} 
     */
    static CreateInstance() {
        if (!AppBarButton.HasProp("__IAppBarButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonFactory.IID)
            AppBarButton.__IAppBarButtonFactory := IAppBarButtonFactory(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_KeyboardAcceleratorTextOverrideProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics4.IID)
            AppBarButton.__IAppBarButtonStatics4 := IAppBarButtonStatics4(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics4.get_KeyboardAcceleratorTextOverrideProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LabelPositionProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics3.IID)
            AppBarButton.__IAppBarButtonStatics3 := IAppBarButtonStatics3(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics3.get_LabelPositionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsInOverflowProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics3.IID)
            AppBarButton.__IAppBarButtonStatics3 := IAppBarButtonStatics3(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics3.get_IsInOverflowProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DynamicOverflowOrderProperty() {
        if (!AppBarButton.HasProp("__IAppBarButtonStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AppBarButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarButtonStatics3.IID)
            AppBarButton.__IAppBarButtonStatics3 := IAppBarButtonStatics3(factoryPtr)
        }

        return AppBarButton.__IAppBarButtonStatics3.get_DynamicOverflowOrderProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the text description displayed on the app bar button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the graphic content of the app bar button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.icon
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.labelposition
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.keyboardacceleratortextoverride
     * @type {HSTRING} 
     */
    KeyboardAcceleratorTextOverride {
        get => this.get_KeyboardAcceleratorTextOverride()
        set => this.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for an AppBarButton control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.templatesettings
     * @type {AppBarButtonTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets a value that indicates whether the button is shown with no label and reduced padding.
     * @remarks
     * <!--describe differences between regular and compact state. add screenshots. guidelines: always use compact state if not used in a commandbar. CommandBar manages state. If used in an AppBar directly, dev has to manage state.-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.iscompact
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.isinoverflow
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.appbarbutton.dynamicoverfloworder
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
        if (!this.HasProp("__IAppBarButton")) {
            if ((queryResult := this.QueryInterface(IAppBarButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton := IAppBarButton(outPtr)
        }

        return this.__IAppBarButton.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IAppBarButton")) {
            if ((queryResult := this.QueryInterface(IAppBarButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton := IAppBarButton(outPtr)
        }

        return this.__IAppBarButton.put_Label(value)
    }

    /**
     * 
     * @returns {IconElement} 
     */
    get_Icon() {
        if (!this.HasProp("__IAppBarButton")) {
            if ((queryResult := this.QueryInterface(IAppBarButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton := IAppBarButton(outPtr)
        }

        return this.__IAppBarButton.get_Icon()
    }

    /**
     * 
     * @param {IconElement} value 
     * @returns {HRESULT} 
     */
    put_Icon(value) {
        if (!this.HasProp("__IAppBarButton")) {
            if ((queryResult := this.QueryInterface(IAppBarButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton := IAppBarButton(outPtr)
        }

        return this.__IAppBarButton.put_Icon(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LabelPosition() {
        if (!this.HasProp("__IAppBarButton3")) {
            if ((queryResult := this.QueryInterface(IAppBarButton3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton3 := IAppBarButton3(outPtr)
        }

        return this.__IAppBarButton3.get_LabelPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LabelPosition(value) {
        if (!this.HasProp("__IAppBarButton3")) {
            if ((queryResult := this.QueryInterface(IAppBarButton3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton3 := IAppBarButton3(outPtr)
        }

        return this.__IAppBarButton3.put_LabelPosition(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyboardAcceleratorTextOverride() {
        if (!this.HasProp("__IAppBarButton4")) {
            if ((queryResult := this.QueryInterface(IAppBarButton4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton4 := IAppBarButton4(outPtr)
        }

        return this.__IAppBarButton4.get_KeyboardAcceleratorTextOverride()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_KeyboardAcceleratorTextOverride(value) {
        if (!this.HasProp("__IAppBarButton4")) {
            if ((queryResult := this.QueryInterface(IAppBarButton4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton4 := IAppBarButton4(outPtr)
        }

        return this.__IAppBarButton4.put_KeyboardAcceleratorTextOverride(value)
    }

    /**
     * 
     * @returns {AppBarButtonTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IAppBarButton5")) {
            if ((queryResult := this.QueryInterface(IAppBarButton5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarButton5 := IAppBarButton5(outPtr)
        }

        return this.__IAppBarButton5.get_TemplateSettings()
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
