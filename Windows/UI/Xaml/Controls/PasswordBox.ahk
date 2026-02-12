#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IPasswordBox.ahk
#Include .\IPasswordBox2.ahk
#Include .\IPasswordBox3.ahk
#Include .\IPasswordBox4.ahk
#Include .\IPasswordBox5.ahk
#Include .\IPasswordBoxStatics3.ahk
#Include .\IPasswordBoxStatics2.ahk
#Include .\IPasswordBoxStatics5.ahk
#Include .\IPasswordBoxStatics.ahk
#Include ..\RoutedEventHandler.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ContextMenuOpeningEventHandler.ahk
#Include .\ContextMenuEventArgs.ahk
#Include .\TextControlPasteEventHandler.ahk
#Include .\TextControlPasteEventArgs.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\PasswordBox.ahk
#Include .\PasswordBoxPasswordChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control for entering passwords.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Password box](/windows/uwp/design/controls-and-patterns/password-box).
 * 
 * PasswordBox lets a user enter a masked password.
 * 
 * <img alt="Password box control" src="images/controls/PasswordBox.png" />
 * 
 * The user can enter a single line of non-wrapping text in a PasswordBox control. The text is not displayed while it is entered; only password characters that mask the text are displayed. You can specify this password character by setting the [PasswordChar](passwordbox_passwordchar.md) property.
 * 
 * Use the [Password](passwordbox_password.md) property to get or set the content of the PasswordBox. Handle the [PasswordChanged](passwordbox_passwordchanged.md) event to get the [Password](passwordbox_password.md) value while the user enters it.
 * 
 * For more info, see [PasswordBox control guide](/windows/uwp/design/controls-and-patterns/password-box).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PasswordBox extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPasswordBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPasswordBox.IID

    /**
     * Identifies the [PasswordRevealMode](passwordbox_passwordrevealmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.passwordrevealmodeproperty
     * @type {DependencyProperty} 
     */
    static PasswordRevealModeProperty {
        get => PasswordBox.get_PasswordRevealModeProperty()
    }

    /**
     * Identifies the [TextReadingOrder](passwordbox_textreadingorder.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.textreadingorderproperty
     * @type {DependencyProperty} 
     */
    static TextReadingOrderProperty {
        get => PasswordBox.get_TextReadingOrderProperty()
    }

    /**
     * Identifies the [InputScope](passwordbox_inputscope.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.inputscopeproperty
     * @type {DependencyProperty} 
     */
    static InputScopeProperty {
        get => PasswordBox.get_InputScopeProperty()
    }

    /**
     * Identifies the [Header](passwordbox_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => PasswordBox.get_HeaderProperty()
    }

    /**
     * Identifies the [HeaderTemplate](passwordbox_headertemplate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.headertemplateproperty
     * @type {DependencyProperty} 
     */
    static HeaderTemplateProperty {
        get => PasswordBox.get_HeaderTemplateProperty()
    }

    /**
     * Identifies the [PlaceholderText](passwordbox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => PasswordBox.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the [SelectionHighlightColor](passwordbox_selectionhighlightcolor.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.selectionhighlightcolorproperty
     * @type {DependencyProperty} 
     */
    static SelectionHighlightColorProperty {
        get => PasswordBox.get_SelectionHighlightColorProperty()
    }

    /**
     * Identifies the [PreventKeyboardDisplayOnProgrammaticFocus](passwordbox_preventkeyboarddisplayonprogrammaticfocus.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.preventkeyboarddisplayonprogrammaticfocusproperty
     * @type {DependencyProperty} 
     */
    static PreventKeyboardDisplayOnProgrammaticFocusProperty {
        get => PasswordBox.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * Identifies the CanPasteClipboardContent dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.canpasteclipboardcontentproperty
     * @type {DependencyProperty} 
     */
    static CanPasteClipboardContentProperty {
        get => PasswordBox.get_CanPasteClipboardContentProperty()
    }

    /**
     * Identifies the SelectionFlyout dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.selectionflyoutproperty
     * @type {DependencyProperty} 
     */
    static SelectionFlyoutProperty {
        get => PasswordBox.get_SelectionFlyoutProperty()
    }

    /**
     * Identifies the [Description](passwordbox_description.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.descriptionproperty
     * @type {DependencyProperty} 
     */
    static DescriptionProperty {
        get => PasswordBox.get_DescriptionProperty()
    }

    /**
     * Identifies the [Password](passwordbox_password.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.passwordproperty
     * @type {DependencyProperty} 
     */
    static PasswordProperty {
        get => PasswordBox.get_PasswordProperty()
    }

    /**
     * Identifies the [PasswordChar](passwordbox_passwordchar.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.passwordcharproperty
     * @type {DependencyProperty} 
     */
    static PasswordCharProperty {
        get => PasswordBox.get_PasswordCharProperty()
    }

    /**
     * Identifies the [IsPasswordRevealButtonEnabled](passwordbox_ispasswordrevealbuttonenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.ispasswordrevealbuttonenabledproperty
     * @type {DependencyProperty} 
     */
    static IsPasswordRevealButtonEnabledProperty {
        get => PasswordBox.get_IsPasswordRevealButtonEnabledProperty()
    }

    /**
     * Identifies the [MaxLength](passwordbox_maxlength.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.maxlengthproperty
     * @type {DependencyProperty} 
     */
    static MaxLengthProperty {
        get => PasswordBox.get_MaxLengthProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PasswordRevealModeProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics3.IID)
            PasswordBox.__IPasswordBoxStatics3 := IPasswordBoxStatics3(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics3.get_PasswordRevealModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TextReadingOrderProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics3.IID)
            PasswordBox.__IPasswordBoxStatics3 := IPasswordBoxStatics3(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics3.get_TextReadingOrderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_InputScopeProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics3.IID)
            PasswordBox.__IPasswordBoxStatics3 := IPasswordBoxStatics3(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics3.get_InputScopeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics2.IID)
            PasswordBox.__IPasswordBoxStatics2 := IPasswordBoxStatics2(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics2.get_HeaderProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderTemplateProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics2.IID)
            PasswordBox.__IPasswordBoxStatics2 := IPasswordBoxStatics2(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics2.get_HeaderTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics2.IID)
            PasswordBox.__IPasswordBoxStatics2 := IPasswordBoxStatics2(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics2.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionHighlightColorProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics2.IID)
            PasswordBox.__IPasswordBoxStatics2 := IPasswordBoxStatics2(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics2.get_SelectionHighlightColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PreventKeyboardDisplayOnProgrammaticFocusProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics2.IID)
            PasswordBox.__IPasswordBoxStatics2 := IPasswordBoxStatics2(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics2.get_PreventKeyboardDisplayOnProgrammaticFocusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanPasteClipboardContentProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics5.IID)
            PasswordBox.__IPasswordBoxStatics5 := IPasswordBoxStatics5(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics5.get_CanPasteClipboardContentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SelectionFlyoutProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics5.IID)
            PasswordBox.__IPasswordBoxStatics5 := IPasswordBoxStatics5(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics5.get_SelectionFlyoutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DescriptionProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics5.IID)
            PasswordBox.__IPasswordBoxStatics5 := IPasswordBoxStatics5(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics5.get_DescriptionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PasswordProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics.IID)
            PasswordBox.__IPasswordBoxStatics := IPasswordBoxStatics(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics.get_PasswordProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PasswordCharProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics.IID)
            PasswordBox.__IPasswordBoxStatics := IPasswordBoxStatics(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics.get_PasswordCharProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPasswordRevealButtonEnabledProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics.IID)
            PasswordBox.__IPasswordBoxStatics := IPasswordBoxStatics(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics.get_IsPasswordRevealButtonEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxLengthProperty() {
        if (!PasswordBox.HasProp("__IPasswordBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPasswordBoxStatics.IID)
            PasswordBox.__IPasswordBoxStatics := IPasswordBoxStatics(factoryPtr)
        }

        return PasswordBox.__IPasswordBoxStatics.get_MaxLengthProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the password currently held by the [PasswordBox](passwordbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.password
     * @type {HSTRING} 
     */
    Password {
        get => this.get_Password()
        set => this.put_Password(value)
    }

    /**
     * Gets or sets the masking character for the [PasswordBox](passwordbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.passwordchar
     * @type {HSTRING} 
     */
    PasswordChar {
        get => this.get_PasswordChar()
        set => this.put_PasswordChar(value)
    }

    /**
     * Gets or sets a value that specifies whether the visual UI of the [PasswordBox](passwordbox.md) includes a button element that toggles showing or hiding the typed characters. In Windows 10 and later, use [PasswordRevealMode](passwordbox_passwordrevealmode.md) instead.
     * @remarks
     * > **Windows 10**
     * > [PasswordRevealMode](passwordbox_passwordrevealmode.md) replaces IsPasswordRevealButtonEnabled to give you more options for how the user is able to view their password. The IsPasswordRevealButtonEnabled property is ignored.
     * 
     * The value of this property is not the only factor that determines whether a password reveal button is visible to the user. Other factors include whether the control is displayed above a minimum width, whether the [PasswordBox](passwordbox.md) has focus, and whether the text entry field contains at least one character.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.ispasswordrevealbuttonenabled
     * @type {Boolean} 
     */
    IsPasswordRevealButtonEnabled {
        get => this.get_IsPasswordRevealButtonEnabled()
        set => this.put_IsPasswordRevealButtonEnabled(value)
    }

    /**
     * Gets or sets the maximum length for passwords to be handled by this [PasswordBox](passwordbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.maxlength
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
        set => this.put_MaxLength(value)
    }

    /**
     * Gets or sets the content for the control's header.
     * @remarks
     * You can set a data template for the Header value by using the [HeaderTemplate](passwordbox_headertemplate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

    /**
     * Gets or sets the [DataTemplate](../windows.ui.xaml/datatemplate.md) used to display the content of the control's header.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.headertemplate
     * @type {DataTemplate} 
     */
    HeaderTemplate {
        get => this.get_HeaderTemplate()
        set => this.put_HeaderTemplate(value)
    }

    /**
     * Gets or sets the text that is displayed in the control until the value is changed by a user action or some other operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets the brush used to highlight the selected text.
     * @remarks
     * The control template sets the default selection highlight color to the system resource **TextSelectionHighlightColorThemeBrush**. To change the selection highlight color for all editable text controls in your app, you can override the **TextSelectionHighlightColorThemeBrush** system resource in App.xaml. This will affect [PasswordBox](passwordbox.md), [TextBox](textbox.md), and [RichEditBox](richeditbox.md) controls. For more info, see [XAML theme resources](/windows/apps/design/style/xaml-theme-resources).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.selectionhighlightcolor
     * @type {SolidColorBrush} 
     */
    SelectionHighlightColor {
        get => this.get_SelectionHighlightColor()
        set => this.put_SelectionHighlightColor(value)
    }

    /**
     * Gets or sets a value that indicates whether the on-screen keyboard is shown when the control receives focus programmatically.
     * @remarks
     * Set this property to **true** to prevent the onscreen touch keyboard from showing when focus is programmatically set on a text box. By default, the onscreen touch keyboard is displayed whenever focus moves to an editable text box and the most recent input was generated by touch. This happens whether focus is set programmatically or by user interaction. In some situations, you might not want the keyboard to show when focus is set programmatically. For example, you might want to prevent the keyboard from covering part of your UI until the user is ready to continue their interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.preventkeyboarddisplayonprogrammaticfocus
     * @type {Boolean} 
     */
    PreventKeyboardDisplayOnProgrammaticFocus {
        get => this.get_PreventKeyboardDisplayOnProgrammaticFocus()
        set => this.put_PreventKeyboardDisplayOnProgrammaticFocus(value)
    }

    /**
     * Gets or sets a value that specifies whether the password is always, never, or optionally obscured.
     * @remarks
     * PasswordRevealMode replaces [IsPasswordRevealButtonEnabled](passwordbox_ispasswordrevealbuttonenabled.md) to give you more options for how the user is able to view their password. The [IsPasswordRevealButtonEnabled](passwordbox_ispasswordrevealbuttonenabled.md) property is ignored.
     * 
     * To change the character used to obscure the password, set the [PasswordChar](passwordbox_passwordchar.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.passwordrevealmode
     * @type {Integer} 
     */
    PasswordRevealMode {
        get => this.get_PasswordRevealMode()
        set => this.put_PasswordRevealMode(value)
    }

    /**
     * Gets or sets a value that indicates how the reading order is determined for the [PasswordBox](passwordbox.md).
     * @remarks
     * This property can be useful when the base direction of the text is unknown, and may not match the user's language or direction. For more info, see the Remarks section of the [TextReadingOrder](../windows.ui.xaml/textreadingorder.md) enumeration or [How to support bidirectional UI](/previous-versions/windows/apps/jj712703(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.textreadingorder
     * @type {Integer} 
     */
    TextReadingOrder {
        get => this.get_TextReadingOrder()
        set => this.put_TextReadingOrder(value)
    }

    /**
     * Gets or sets the context for input used by this [PasswordBox](passwordbox.md).
     * @remarks
     * The `InputScope` property on [PasswordBox](passwordbox.md) supports only the [Password](../windows.ui.xaml.input/inputscopenamevalue.md) and [NumericPin](../windows.ui.xaml.input/inputscopenamevalue.md) values. Any other value is ignored.
     * 
     * The input scope provides a hint at the type of text input expected by the control. Various elements of the system can respond to the hint provided by the input scope and provide a specialized UI for the input type. For example, the soft keyboard might show a number pad for text input when the control has its `InputScope` set to **NumericPin**.
     * 
     * The input scope does not perform any validation, and does not prevent the user from providing any input through a hardware keyboard or other input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.inputscope
     * @type {InputScope} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * Gets a value that indicates whether clipboard content can be pasted into the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.canpasteclipboardcontent
     * @type {Boolean} 
     */
    CanPasteClipboardContent {
        get => this.get_CanPasteClipboardContent()
    }

    /**
     * Gets or sets the flyout that is shown when text is selected, or **null** if no flyout is shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.selectionflyout
     * @type {FlyoutBase} 
     */
    SelectionFlyout {
        get => this.get_SelectionFlyout()
        set => this.put_SelectionFlyout(value)
    }

    /**
     * Gets or sets content that is shown below the control. The content should provide guidance about the input expected by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.description
     * @type {IInspectable} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Occurs when the value of the [Password](passwordbox_password.md) property changes.
     * @type {RoutedEventHandler}
    */
    OnPasswordChanged {
        get {
            if(!this.HasProp("__OnPasswordChanged")){
                this.__OnPasswordChanged := WinRTEventHandler(
                    RoutedEventHandler,
                    RoutedEventHandler.IID,
                    IInspectable,
                    RoutedEventArgs
                )
                this.__OnPasswordChangedToken := this.add_PasswordChanged(this.__OnPasswordChanged.iface)
            }
            return this.__OnPasswordChanged
        }
    }

    /**
     * Occurs when the system processes an interaction that displays a context menu.
     * @type {ContextMenuOpeningEventHandler}
    */
    OnContextMenuOpening {
        get {
            if(!this.HasProp("__OnContextMenuOpening")){
                this.__OnContextMenuOpening := WinRTEventHandler(
                    ContextMenuOpeningEventHandler,
                    ContextMenuOpeningEventHandler.IID,
                    IInspectable,
                    ContextMenuEventArgs
                )
                this.__OnContextMenuOpeningToken := this.add_ContextMenuOpening(this.__OnContextMenuOpening.iface)
            }
            return this.__OnContextMenuOpening
        }
    }

    /**
     * Occurs when text is pasted into the control.
     * @remarks
     * The Paste event occurs before any content is inserted into the control. You can handle this event to check the contents of the clipboard and perform any actions on the content before it's inserted. If you perform any action, set the handled property to true; otherwise, the default paste action is performed. If you set the handled property to true, then it's assumed the app has handled the insertion, and no default action is performed. You are responsible for determining the insertion point and clipboard content to insert, and inserting the content.
     * @type {TextControlPasteEventHandler}
    */
    OnPaste {
        get {
            if(!this.HasProp("__OnPaste")){
                this.__OnPaste := WinRTEventHandler(
                    TextControlPasteEventHandler,
                    TextControlPasteEventHandler.IID,
                    IInspectable,
                    TextControlPasteEventArgs
                )
                this.__OnPasteToken := this.add_Paste(this.__OnPaste.iface)
            }
            return this.__OnPaste
        }
    }

    /**
     * Occurs synchronously when the text in the password box starts to change, but before it is rendered.
     * @type {TypedEventHandler<PasswordBox, PasswordBoxPasswordChangingEventArgs>}
    */
    OnPasswordChanging {
        get {
            if(!this.HasProp("__OnPasswordChanging")){
                this.__OnPasswordChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c3bc2f43-1d73-5aac-aed4-b4e08603e9f0}"),
                    PasswordBox,
                    PasswordBoxPasswordChangingEventArgs
                )
                this.__OnPasswordChangingToken := this.add_PasswordChanging(this.__OnPasswordChanging.iface)
            }
            return this.__OnPasswordChanging
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PasswordBox](passwordbox.md) class
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PasswordBox")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPasswordChangedToken")) {
            this.remove_PasswordChanged(this.__OnPasswordChangedToken)
            this.__OnPasswordChanged.iface.Dispose()
        }

        if(this.HasProp("__OnContextMenuOpeningToken")) {
            this.remove_ContextMenuOpening(this.__OnContextMenuOpeningToken)
            this.__OnContextMenuOpening.iface.Dispose()
        }

        if(this.HasProp("__OnPasteToken")) {
            this.remove_Paste(this.__OnPasteToken)
            this.__OnPaste.iface.Dispose()
        }

        if(this.HasProp("__OnPasswordChangingToken")) {
            this.remove_PasswordChanging(this.__OnPasswordChangingToken)
            this.__OnPasswordChanging.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Password() {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.get_Password()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Password(value) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.put_Password(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PasswordChar() {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.get_PasswordChar()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PasswordChar(value) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.put_PasswordChar(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPasswordRevealButtonEnabled() {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.get_IsPasswordRevealButtonEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPasswordRevealButtonEnabled(value) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.put_IsPasswordRevealButtonEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.get_MaxLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxLength(value) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.put_MaxLength(value)
    }

    /**
     * 
     * @param {RoutedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PasswordChanged(handler) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.add_PasswordChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PasswordChanged(token) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.remove_PasswordChanged(token)
    }

    /**
     * 
     * @param {ContextMenuOpeningEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContextMenuOpening(handler) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.add_ContextMenuOpening(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContextMenuOpening(token) {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.remove_ContextMenuOpening(token)
    }

    /**
     * Selects all the characters in the [PasswordBox](passwordbox.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.selectall
     */
    SelectAll() {
        if (!this.HasProp("__IPasswordBox")) {
            if ((queryResult := this.QueryInterface(IPasswordBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox := IPasswordBox(outPtr)
        }

        return this.__IPasswordBox.SelectAll()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.put_Header(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_HeaderTemplate() {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.get_HeaderTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_HeaderTemplate(value) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.put_HeaderTemplate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {SolidColorBrush} 
     */
    get_SelectionHighlightColor() {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.get_SelectionHighlightColor()
    }

    /**
     * 
     * @param {SolidColorBrush} value 
     * @returns {HRESULT} 
     */
    put_SelectionHighlightColor(value) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.put_SelectionHighlightColor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PreventKeyboardDisplayOnProgrammaticFocus() {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.get_PreventKeyboardDisplayOnProgrammaticFocus()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PreventKeyboardDisplayOnProgrammaticFocus(value) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.put_PreventKeyboardDisplayOnProgrammaticFocus(value)
    }

    /**
     * 
     * @param {TextControlPasteEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Paste(handler) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.add_Paste(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Paste(token) {
        if (!this.HasProp("__IPasswordBox2")) {
            if ((queryResult := this.QueryInterface(IPasswordBox2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox2 := IPasswordBox2(outPtr)
        }

        return this.__IPasswordBox2.remove_Paste(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordRevealMode() {
        if (!this.HasProp("__IPasswordBox3")) {
            if ((queryResult := this.QueryInterface(IPasswordBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox3 := IPasswordBox3(outPtr)
        }

        return this.__IPasswordBox3.get_PasswordRevealMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PasswordRevealMode(value) {
        if (!this.HasProp("__IPasswordBox3")) {
            if ((queryResult := this.QueryInterface(IPasswordBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox3 := IPasswordBox3(outPtr)
        }

        return this.__IPasswordBox3.put_PasswordRevealMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        if (!this.HasProp("__IPasswordBox3")) {
            if ((queryResult := this.QueryInterface(IPasswordBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox3 := IPasswordBox3(outPtr)
        }

        return this.__IPasswordBox3.get_TextReadingOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TextReadingOrder(value) {
        if (!this.HasProp("__IPasswordBox3")) {
            if ((queryResult := this.QueryInterface(IPasswordBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox3 := IPasswordBox3(outPtr)
        }

        return this.__IPasswordBox3.put_TextReadingOrder(value)
    }

    /**
     * 
     * @returns {InputScope} 
     */
    get_InputScope() {
        if (!this.HasProp("__IPasswordBox3")) {
            if ((queryResult := this.QueryInterface(IPasswordBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox3 := IPasswordBox3(outPtr)
        }

        return this.__IPasswordBox3.get_InputScope()
    }

    /**
     * 
     * @param {InputScope} value 
     * @returns {HRESULT} 
     */
    put_InputScope(value) {
        if (!this.HasProp("__IPasswordBox3")) {
            if ((queryResult := this.QueryInterface(IPasswordBox3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox3 := IPasswordBox3(outPtr)
        }

        return this.__IPasswordBox3.put_InputScope(value)
    }

    /**
     * 
     * @param {TypedEventHandler<PasswordBox, PasswordBoxPasswordChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PasswordChanging(handler) {
        if (!this.HasProp("__IPasswordBox4")) {
            if ((queryResult := this.QueryInterface(IPasswordBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox4 := IPasswordBox4(outPtr)
        }

        return this.__IPasswordBox4.add_PasswordChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PasswordChanging(token) {
        if (!this.HasProp("__IPasswordBox4")) {
            if ((queryResult := this.QueryInterface(IPasswordBox4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox4 := IPasswordBox4(outPtr)
        }

        return this.__IPasswordBox4.remove_PasswordChanging(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPasteClipboardContent() {
        if (!this.HasProp("__IPasswordBox5")) {
            if ((queryResult := this.QueryInterface(IPasswordBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox5 := IPasswordBox5(outPtr)
        }

        return this.__IPasswordBox5.get_CanPasteClipboardContent()
    }

    /**
     * 
     * @returns {FlyoutBase} 
     */
    get_SelectionFlyout() {
        if (!this.HasProp("__IPasswordBox5")) {
            if ((queryResult := this.QueryInterface(IPasswordBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox5 := IPasswordBox5(outPtr)
        }

        return this.__IPasswordBox5.get_SelectionFlyout()
    }

    /**
     * 
     * @param {FlyoutBase} value 
     * @returns {HRESULT} 
     */
    put_SelectionFlyout(value) {
        if (!this.HasProp("__IPasswordBox5")) {
            if ((queryResult := this.QueryInterface(IPasswordBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox5 := IPasswordBox5(outPtr)
        }

        return this.__IPasswordBox5.put_SelectionFlyout(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Description() {
        if (!this.HasProp("__IPasswordBox5")) {
            if ((queryResult := this.QueryInterface(IPasswordBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox5 := IPasswordBox5(outPtr)
        }

        return this.__IPasswordBox5.get_Description()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IPasswordBox5")) {
            if ((queryResult := this.QueryInterface(IPasswordBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox5 := IPasswordBox5(outPtr)
        }

        return this.__IPasswordBox5.put_Description(value)
    }

    /**
     * Copies content from the Windows clipboard into the text control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.passwordbox.pastefromclipboard
     */
    PasteFromClipboard() {
        if (!this.HasProp("__IPasswordBox5")) {
            if ((queryResult := this.QueryInterface(IPasswordBox5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPasswordBox5 := IPasswordBox5(outPtr)
        }

        return this.__IPasswordBox5.PasteFromClipboard()
    }

;@endregion Instance Methods
}
