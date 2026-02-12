#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\Selector.ahk
#Include .\IComboBox.ahk
#Include .\IComboBox2.ahk
#Include .\IComboBox3.ahk
#Include .\IComboBox4.ahk
#Include .\IComboBox5.ahk
#Include .\IComboBox6.ahk
#Include .\IComboBoxOverrides.ahk
#Include .\IComboBoxFactory.ahk
#Include .\IComboBoxStatics.ahk
#Include .\IComboBoxStatics2.ahk
#Include .\IComboBoxStatics6.ahk
#Include .\IComboBoxStatics3.ahk
#Include .\IComboBoxStatics5.ahk
#Include .\IComboBoxStatics4.ahk
#Include ..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ComboBox.ahk
#Include .\ComboBoxTextSubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a selection control that combines a non-editable text box and a drop-down list box that allows users to select an item from a list.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Combo box](/windows/uwp/design/controls-and-patterns/combo-box).
 * 
 * ComboBox presents a drop-down list of items a user can select from.
 * 
 * <img alt="Open combo box" src="images/controls/ComboBoxBasicOpen.png" />
 * 
 * Use a ComboBox to present a list of items that a user can select from. When the ComboBox is closed, it either displays the current selection or is empty if there is no selected item. When the ComboBox is open, it displays the list of selectable items. You can get or set the combo box's selected item by using the [SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) property, and get or set the index of the selected item by using the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) property.
 * 
 * You populate the ComboBox by adding objects directly to the [Items](itemscontrol_items.md) collection or by binding the [ItemsSource](itemscontrol_itemssource.md) property to a data source. Items added to the ComboBox are wrapped in [ComboBoxItem](comboboxitem.md) containers.
 * 
 * > [!NOTE]
 * > ComboBox uses a [CarouselPanel](../windows.ui.xaml.controls.primitives/carouselpanel.md) as its [ItemsPanel](itemscontrol_itemspanel.md). Using a different panel as the [ItemsPanel](itemscontrol_itemspanel.md) is not supported and might result in undesired behavior.
 * 
 * If you need to handle pointer events for a [UIElement](../windows.ui.xaml/uielement.md) in a scrollable view (such as a ScrollViewer), you must explicitly disable support for manipulation events on the element in the view by calling [UIElement.CancelDirectmanipulation()](../windows.ui.xaml/uielement_canceldirectmanipulations_1164631120.md). To re-enable manipulation events in the view, call [UIElement.TryStartDirectManipulation()](../windows.ui.xaml/uielement_trystartdirectmanipulation_1983346775.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ComboBox extends Selector {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBox.IID

    /**
     * Identifies the [IsDropDownOpen](combobox_isdropdownopen.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.isdropdownopenproperty
     * @type {DependencyProperty} 
     */
    static IsDropDownOpenProperty {
        get => ComboBox.get_IsDropDownOpenProperty()
    }

    /**
     * Identifies the [MaxDropDownHeight](combobox_maxdropdownheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.maxdropdownheightproperty
     * @type {DependencyProperty} 
     */
    static MaxDropDownHeightProperty {
        get => ComboBox.get_MaxDropDownHeightProperty()
    }

    /**
     * Identifies the [Header](combobox_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => ComboBox.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](combobox_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => ComboBox.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [PlaceholderText](combobox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => ComboBox.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the IsEditable dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.iseditableproperty
     * @type {DependencyProperty} 
     */
    static IsEditableProperty {
        get => ComboBox.get_IsEditableProperty()
    }

    /**
     * Identifies the Text dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.textproperty
     * @type {DependencyProperty} 
     */
    static TextProperty {
        get => ComboBox.get_TextProperty()
    }

    /**
     * Identifies the TextBoxStyle dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.textboxstyleproperty
     * @type {DependencyProperty} 
     */
    static TextBoxStyleProperty {
        get => ComboBox.get_TextBoxStyleProperty()
    }

    /**
     * Identifies the [Description](combobox_description.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => ComboBox.get_DescriptionProperty()
    }

    /**
     * Identifies the [LightDismissOverlayMode](combobox_lightdismissoverlaymode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.lightdismissoverlaymodeproperty
     * @type {DependencyProperty} 
     */
    static LightDismissOverlayModeProperty {
        get => ComboBox.get_LightDismissOverlayModeProperty()
    }

    /**
     * Identifies the [IsTextSearchEnabled](combobox_istextsearchenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.istextsearchenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTextSearchEnabledProperty {
        get => ComboBox.get_IsTextSearchEnabledProperty()
    }

    /**
     * Identifies the PlaceholderForeground dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.placeholderforegroundproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderForegroundProperty {
        get => ComboBox.get_PlaceholderForegroundProperty()
    }

    /**
     * Identifies the [SelectionChangedTrigger](combobox_selectionchangedtrigger.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.selectionchangedtriggerproperty
     * @type {DependencyProperty} 
     */
    static SelectionChangedTriggerProperty {
        get => ComboBox.get_SelectionChangedTriggerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ComboBox} 
     */
    static CreateInstance() {
        if (!ComboBox.HasProp("__IComboBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxFactory.IID)
            ComboBox.__IComboBoxFactory := IComboBoxFactory(factoryPtr)
        }

        return ComboBox.__IComboBoxFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDropDownOpenProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics.IID)
            ComboBox.__IComboBoxStatics := IComboBoxStatics(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics.get_IsDropDownOpenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxDropDownHeightProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics.IID)
            ComboBox.__IComboBoxStatics := IComboBoxStatics(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics.get_MaxDropDownHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics2.IID)
            ComboBox.__IComboBoxStatics2 := IComboBoxStatics2(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics2.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics2.IID)
            ComboBox.__IComboBoxStatics2 := IComboBoxStatics2(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics2.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics2.IID)
            ComboBox.__IComboBoxStatics2 := IComboBoxStatics2(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics2.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsEditableProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics6.IID)
            ComboBox.__IComboBoxStatics6 := IComboBoxStatics6(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics6.get_IsEditableProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics6.IID)
            ComboBox.__IComboBoxStatics6 := IComboBoxStatics6(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics6.get_TextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextBoxStyleProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics6.IID)
            ComboBox.__IComboBoxStatics6 := IComboBoxStatics6(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics6.get_TextBoxStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics6.IID)
            ComboBox.__IComboBoxStatics6 := IComboBoxStatics6(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics6.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LightDismissOverlayModeProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics3.IID)
            ComboBox.__IComboBoxStatics3 := IComboBoxStatics3(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics3.get_LightDismissOverlayModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTextSearchEnabledProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics3.IID)
            ComboBox.__IComboBoxStatics3 := IComboBoxStatics3(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics3.get_IsTextSearchEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderForegroundProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics5.IID)
            ComboBox.__IComboBoxStatics5 := IComboBoxStatics5(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics5.get_PlaceholderForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionChangedTriggerProperty() {
        if (!ComboBox.HasProp("__IComboBoxStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxStatics4.IID)
            ComboBox.__IComboBoxStatics4 := IComboBoxStatics4(factoryPtr)
        }

        return ComboBox.__IComboBoxStatics4.get_SelectionChangedTriggerProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the drop-down portion of the [ComboBox](combobox.md) is currently open.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.isdropdownopen
     * @type {Boolean} 
     */
    IsDropDownOpen {
        get => this.get_IsDropDownOpen()
        set => this.put_IsDropDownOpen(value)
    }

    /**
     * Gets or sets a value that indicates whether the user can edit text in the text box portion of the [ComboBox](combobox.md). See remarks.
     * @remarks
     * > [!IMPORTANT]
     * > The behavior of this property is changed in Windows 10, version 1809 (SDK 17763). In earlier versions of Windows, this property is read-only and always returns **false**.
     * 
     * For more info, see [Make a combo box editable](/windows/uwp/design/controls-and-patterns/combo-box#make-a-combo-box-editable).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.iseditable
     * @type {Boolean} 
     */
    IsEditable {
        get => this.get_IsEditable()
        set => this.put_IsEditable(value)
    }

    /**
     * Gets a value that indicates whether the [SelectionBoxItem](combobox_selectionboxitem.md) component is highlighted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.isselectionboxhighlighted
     * @type {Boolean} 
     */
    IsSelectionBoxHighlighted {
        get => this.get_IsSelectionBoxHighlighted()
    }

    /**
     * Gets or sets the maximum height for a combo box drop-down.
     * @remarks
     * > [!NOTE]
     * > In Windows 8, this property is ignored. If this property is set incorrectly (set to 0, for example) in an app that's compiled for Windows 8, the app might behave incorrectly or crash when it's run in Windows 8.1. You should set this property to a value of 76 or greater to make sure the scroll buttons show and behave correctly when the [ComboBox](combobox.md) is open.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.maxdropdownheight
     * @type {Float} 
     */
    MaxDropDownHeight {
        get => this.get_MaxDropDownHeight()
        set => this.put_MaxDropDownHeight(value)
    }

    /**
     * Gets the item shown when the [ComboBox](combobox.md) is closed.
     * @remarks
     * The selection box is the text box that's shown when the [ComboBox](combobox.md) is closed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.selectionboxitem
     * @type {IInspectable} 
     */
    SelectionBoxItem {
        get => this.get_SelectionBoxItem()
    }

    /**
     * Gets the template applied to the selection box content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.selectionboxitemtemplate
     * @type {DataTemplate} 
     */
    SelectionBoxItemTemplate {
        get => this.get_SelectionBoxItemTemplate()
    }

    /**
     * Gets an object that provides calculated values that can be referenced as **TemplateBinding** sources when defining templates for a [ComboBox](combobox.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.templatesettings
     * @type {ComboBoxTemplateSettings} 
     */
    TemplateSettings {
        get => this.get_TemplateSettings()
    }

    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header by using the [HeaderTemplate](combobox_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the text that is displayed in the control until the value is changed by a user action or some other operation.
     * @remarks
     * The placeholder text is shown when the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) is -1 and the [SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) is **null**. (These two properties are kept in sync.) A user can't display the placeholder text once an item has been selected. However, you can programmatically set either the [SelectedIndex](../windows.ui.xaml.controls.primitives/selector_selectedindex.md) to -1 or the [SelectedItem](../windows.ui.xaml.controls.primitives/selector_selecteditem.md) to **null** to cause the placeholder text to be shown again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets a value that specifies whether the area outside of a *light-dismiss* UI is darkened.
     * @remarks
     * Transient UI, such as the open drop-down of a [ComboBox](combobox.md), closes when you click or tap outside of it. This is called light-dismiss. "Overlay" refers to the area outside of a light-dismiss UI.
     * 
     * By default, the "overlay" is darkened on the Xbox, and not darkened on other devices families. You can set LightDismissOverlayMode to **On** to make your app darken the "overlay" area on all device families, or set it to **Off** to not darken the "overlay" area on all device families.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.lightdismissoverlaymode
     * @type {Integer} 
     */
    LightDismissOverlayMode {
        get => this.get_LightDismissOverlayMode()
        set => this.put_LightDismissOverlayMode(value)
    }

    /**
     * Gets or sets a value that specifies whether a user can jump to a value by typing.
     * @remarks
     * Starting in Windows 10, version 1607, [ComboBox](combobox.md) introduces a text search feature. By default, the [ComboBox](combobox.md) jumps to a relevant value as the user types. You can set the IsTextSearchEnabled property to **false** to disable this behavior. This is useful, for example, if you have extended [ComboBox](combobox.md) with custom text search.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.istextsearchenabled
     * @type {Boolean} 
     */
    IsTextSearchEnabled {
        get => this.get_IsTextSearchEnabled()
        set => this.put_IsTextSearchEnabled(value)
    }

    /**
     * Gets or sets a value that indicates what action causes a SelectionChanged event to occur.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.selectionchangedtrigger
     * @type {Integer} 
     */
    SelectionChangedTrigger {
        get => this.get_SelectionChangedTrigger()
        set => this.put_SelectionChangedTrigger(value)
    }

    /**
     * Gets or sets a brush that describes the color of placeholder text.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.placeholderforeground
     * @type {Brush} 
     */
    PlaceholderForeground {
        get => this.get_PlaceholderForeground()
        set => this.put_PlaceholderForeground(value)
    }

    /**
     * Gets or sets the text in the ComboBox.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets or sets the style of the TextBox in the ComboBox when the ComboBox is editable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.textboxstyle
     * @type {Style} 
     */
    TextBoxStyle {
        get => this.get_TextBoxStyle()
        set => this.put_TextBoxStyle(value)
    }

    /**
     * Gets or sets content that is shown below the control. The content should provide guidance about the input expected by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.description
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Occurs when the drop-down portion of the [ComboBox](combobox.md) closes.
     * @remarks
     * The drop-down portion of [ComboBox](combobox.md) is implemented basically as a [Popup](../windows.ui.xaml.controls.primitives/popup.md).
     * @type {EventHandler<IInspectable>}
    */
    OnDropDownClosed {
        get {
            if(!this.HasProp("__OnDropDownClosed")){
                this.__OnDropDownClosed := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnDropDownClosedToken := this.add_DropDownClosed(this.__OnDropDownClosed.iface)
            }
            return this.__OnDropDownClosed
        }
    }

    /**
     * Occurs when the drop-down portion of the [ComboBox](combobox.md) opens.
     * @type {EventHandler<IInspectable>}
    */
    OnDropDownOpened {
        get {
            if(!this.HasProp("__OnDropDownOpened")){
                this.__OnDropDownOpened := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnDropDownOpenedToken := this.add_DropDownOpened(this.__OnDropDownOpened.iface)
            }
            return this.__OnDropDownOpened
        }
    }

    /**
     * Occurs when the user submits some text that does not correspond to an item in the ComboBox dropdown list.
     * @type {TypedEventHandler<ComboBox, ComboBoxTextSubmittedEventArgs>}
    */
    OnTextSubmitted {
        get {
            if(!this.HasProp("__OnTextSubmitted")){
                this.__OnTextSubmitted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{df0bc94b-fec2-5efe-a29a-221c339e0fef}"),
                    ComboBox,
                    ComboBoxTextSubmittedEventArgs
                )
                this.__OnTextSubmittedToken := this.add_TextSubmitted(this.__OnTextSubmitted.iface)
            }
            return this.__OnTextSubmitted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDropDownClosedToken")) {
            this.remove_DropDownClosed(this.__OnDropDownClosedToken)
            this.__OnDropDownClosed.iface.Dispose()
        }

        if(this.HasProp("__OnDropDownOpenedToken")) {
            this.remove_DropDownOpened(this.__OnDropDownOpenedToken)
            this.__OnDropDownOpened.iface.Dispose()
        }

        if(this.HasProp("__OnTextSubmittedToken")) {
            this.remove_TextSubmitted(this.__OnTextSubmittedToken)
            this.__OnTextSubmitted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDropDownOpen() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_IsDropDownOpen()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDropDownOpen(value) {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.put_IsDropDownOpen(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEditable() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_IsEditable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelectionBoxHighlighted() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_IsSelectionBoxHighlighted()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxDropDownHeight() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_MaxDropDownHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxDropDownHeight(value) {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.put_MaxDropDownHeight(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectionBoxItem() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_SelectionBoxItem()
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_SelectionBoxItemTemplate() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_SelectionBoxItemTemplate()
    }

    /**
     * 
     * @returns {ComboBoxTemplateSettings} 
     */
    get_TemplateSettings() {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.get_TemplateSettings()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DropDownClosed(handler) {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.add_DropDownClosed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DropDownClosed(token) {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.remove_DropDownClosed(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DropDownOpened(handler) {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.add_DropDownOpened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DropDownOpened(token) {
        if (!this.HasProp("__IComboBox")) {
            if ((queryResult := this.QueryInterface(IComboBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox := IComboBox(outPtr)
        }

        return this.__IComboBox.remove_DropDownOpened(token)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IComboBox2")) {
            if ((queryResult := this.QueryInterface(IComboBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox2 := IComboBox2(outPtr)
        }

        return this.__IComboBox2.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IComboBox2")) {
            if ((queryResult := this.QueryInterface(IComboBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox2 := IComboBox2(outPtr)
        }

        return this.__IComboBox2.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IComboBox2")) {
            if ((queryResult := this.QueryInterface(IComboBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox2 := IComboBox2(outPtr)
        }

        return this.__IComboBox2.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IComboBox2")) {
            if ((queryResult := this.QueryInterface(IComboBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox2 := IComboBox2(outPtr)
        }

        return this.__IComboBox2.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__IComboBox2")) {
            if ((queryResult := this.QueryInterface(IComboBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox2 := IComboBox2(outPtr)
        }

        return this.__IComboBox2.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__IComboBox2")) {
            if ((queryResult := this.QueryInterface(IComboBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox2 := IComboBox2(outPtr)
        }

        return this.__IComboBox2.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LightDismissOverlayMode() {
        if (!this.HasProp("__IComboBox3")) {
            if ((queryResult := this.QueryInterface(IComboBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox3 := IComboBox3(outPtr)
        }

        return this.__IComboBox3.get_LightDismissOverlayMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_LightDismissOverlayMode(value) {
        if (!this.HasProp("__IComboBox3")) {
            if ((queryResult := this.QueryInterface(IComboBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox3 := IComboBox3(outPtr)
        }

        return this.__IComboBox3.put_LightDismissOverlayMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTextSearchEnabled() {
        if (!this.HasProp("__IComboBox3")) {
            if ((queryResult := this.QueryInterface(IComboBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox3 := IComboBox3(outPtr)
        }

        return this.__IComboBox3.get_IsTextSearchEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTextSearchEnabled(value) {
        if (!this.HasProp("__IComboBox3")) {
            if ((queryResult := this.QueryInterface(IComboBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox3 := IComboBox3(outPtr)
        }

        return this.__IComboBox3.put_IsTextSearchEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionChangedTrigger() {
        if (!this.HasProp("__IComboBox4")) {
            if ((queryResult := this.QueryInterface(IComboBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox4 := IComboBox4(outPtr)
        }

        return this.__IComboBox4.get_SelectionChangedTrigger()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionChangedTrigger(value) {
        if (!this.HasProp("__IComboBox4")) {
            if ((queryResult := this.QueryInterface(IComboBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox4 := IComboBox4(outPtr)
        }

        return this.__IComboBox4.put_SelectionChangedTrigger(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_PlaceholderForeground() {
        if (!this.HasProp("__IComboBox5")) {
            if ((queryResult := this.QueryInterface(IComboBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox5 := IComboBox5(outPtr)
        }

        return this.__IComboBox5.get_PlaceholderForeground()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderForeground(value) {
        if (!this.HasProp("__IComboBox5")) {
            if ((queryResult := this.QueryInterface(IComboBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox5 := IComboBox5(outPtr)
        }

        return this.__IComboBox5.put_PlaceholderForeground(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEditable(value) {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.put_IsEditable(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.put_Text(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_TextBoxStyle() {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.get_TextBoxStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_TextBoxStyle(value) {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.put_TextBoxStyle(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.get_Description()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.put_Description(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ComboBox, ComboBoxTextSubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextSubmitted(handler) {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.add_TextSubmitted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextSubmitted(token) {
        if (!this.HasProp("__IComboBox6")) {
            if ((queryResult := this.QueryInterface(IComboBox6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBox6 := IComboBox6(outPtr)
        }

        return this.__IComboBox6.remove_TextSubmitted(token)
    }

    /**
     * Invoked when the [DropDownClosed](combobox_dropdownclosed.md) event is raised.
     * @param {IInspectable} e Event data for the event. 
     * <!--Why is this not strong typed?-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.ondropdownclosed
     */
    OnDropDownClosed(e) {
        if (!this.HasProp("__IComboBoxOverrides")) {
            if ((queryResult := this.QueryInterface(IComboBoxOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxOverrides := IComboBoxOverrides(outPtr)
        }

        return this.__IComboBoxOverrides.OnDropDownClosed(e)
    }

    /**
     * Invoked when the [DropDownOpened](combobox_dropdownopened.md) event is raised.
     * @param {IInspectable} e Event data for the event. 
     * <!--Why is this not strong typed?-->
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.combobox.ondropdownopened
     */
    OnDropDownOpened(e) {
        if (!this.HasProp("__IComboBoxOverrides")) {
            if ((queryResult := this.QueryInterface(IComboBoxOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IComboBoxOverrides := IComboBoxOverrides(outPtr)
        }

        return this.__IComboBoxOverrides.OnDropDownOpened(e)
    }

;@endregion Instance Methods
}
