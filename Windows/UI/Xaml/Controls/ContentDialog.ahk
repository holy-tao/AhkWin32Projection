#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IContentDialog.ahk
#Include .\IContentDialog2.ahk
#Include .\IContentDialog3.ahk
#Include .\IContentDialogStatics.ahk
#Include .\IContentDialogStatics2.ahk
#Include .\IContentDialogFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ContentDialog.ahk
#Include .\ContentDialogClosingEventArgs.ahk
#Include .\ContentDialogClosedEventArgs.ahk
#Include .\ContentDialogOpenedEventArgs.ahk
#Include .\ContentDialogButtonClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a dialog box that can be customized to contain checkboxes, hyperlinks, buttons and any other XAML content.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Dialog controls](/windows/uwp/design/controls-and-patterns/dialogs-and-flyouts/dialogs
 * ).
 * 
 * Use a ContentDialog to request input from the user, or to show information in a modal dialog. You can add a ContentDialog to an app page using code or XAML, or you can create a custom dialog class that's derived from ContentDialog. Both ways are shown in the examples section of this topic.
 * 
 * Use the [Title](contentdialog_title.md) property to put a title on the dialog. To add a complex title element with more than simple text, you can use the [TitleTemplate](contentdialog_titletemplate.md) property.
 * 
 * The ContentDialog has 3 built-in buttons that describe the actions that the user may take in response to the dialog's prompt. All dialogs should have a safe, non-destructive action. Dialogs may also optionally contain one or two specific "do it" actions in response to the prompt.  
 * 
 * Use the [CloseButtonText](contentdialog_closebuttontext.md) and property to set the display text for the safe, non-destructive button. The dialog's close button will also be invoked when the user performs a Cancel action, like pressing the ESC key or pressing the system back button.
 * Use the [PrimaryButtonText](contentdialog_primarybuttontext.md) and [SecondaryButtonText](contentdialog_secondarybuttontext.md) properties to display responses to the main question or action posed by the dialog.
 * 
 * The [CloseButtonText](contentdialog_closebuttontext.md) property is not available prior to Windows 10, version 1703. If your app's 'minimum platform version' setting in Microsoft Visual Studio is less than the 'introduced version' shown in the Requirements block later in this page, you should use the [SecondaryButtonText](contentdialog_secondarybuttontext.md) property instead. For more info, see [Version adaptive code](/windows/uwp/debug-test-perf/version-adaptive-code).
 * 
 * To show the dialog, call the [ShowAsync](contentdialog_showasync_1208475713.md) method. Use the result of this method to determine which of the buttons was clicked, if any button was clicked. If the user presses ESC, the system back arrow, or Gamepad B, the result of this method will be None.
 * 
 * You may optionally choose to differentiate one of the three buttons as the dialog's default button. Use the [DefaultButton](contentdialog_defaultbutton.md) property to differentiate one of the buttons. This button will receive the Accent Button visual treatment, respond to the ENTER key automatically, and receive focus when the Dialog is opened unless the dialog's content contains focusable elements.
 * 
 * You may wish to do some work before the dialog closes (for example, to verify that the user entered into form fields before submitting a request). You have two ways to do work before the dialog closes. You can handle the [PrimaryButtonClick](contentdialog_primarybuttonclick.md), [SecondaryButtonClick](contentdialog_secondarybuttonclick.md), or [CloseButtonClick](contentdialog_closebuttonclick.md) events to get the user's response when the user presses a button and verify the state of the dialog before it closes. You can also handle the [Closing](contentdialog_closing.md) event to do work before the dialog closes.
 * 
 * Only one ContentDialog can be shown at a time. To chain together more than one ContentDialog, handle the [Closing](contentdialog_closing.md) event of the first ContentDialog. In the [Closing](contentdialog_closing.md) event handler, call [ShowAsync](contentdialog_showasync_1208475713.md) on the second dialog to show it.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialog extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentDialog

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentDialog.IID

    /**
     * Gets the identifier of the Title dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.titleproperty
     * @type {DependencyProperty} 
     */
    static TitleProperty {
        get => ContentDialog.get_TitleProperty()
    }

    /**
     * Gets the identifier of the TitleTemplate dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.titletemplateproperty
     * @type {DependencyProperty} 
     */
    static TitleTemplateProperty {
        get => ContentDialog.get_TitleTemplateProperty()
    }

    /**
     * Gets the identifier of the FullSizeDesired dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.fullsizedesiredproperty
     * @type {DependencyProperty} 
     */
    static FullSizeDesiredProperty {
        get => ContentDialog.get_FullSizeDesiredProperty()
    }

    /**
     * Gets the identifier of the PrimaryButtonText dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttontextproperty
     * @type {DependencyProperty} 
     */
    static PrimaryButtonTextProperty {
        get => ContentDialog.get_PrimaryButtonTextProperty()
    }

    /**
     * Gets the identifier of the SecondaryButtonText dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttontextproperty
     * @type {DependencyProperty} 
     */
    static SecondaryButtonTextProperty {
        get => ContentDialog.get_SecondaryButtonTextProperty()
    }

    /**
     * Gets the identifier of the PrimaryButtonCommand dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttoncommandproperty
     * @type {DependencyProperty} 
     */
    static PrimaryButtonCommandProperty {
        get => ContentDialog.get_PrimaryButtonCommandProperty()
    }

    /**
     * Gets the identifier of the SecondaryButtonCommand dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttoncommandproperty
     * @type {DependencyProperty} 
     */
    static SecondaryButtonCommandProperty {
        get => ContentDialog.get_SecondaryButtonCommandProperty()
    }

    /**
     * Gets the identifier of the PrimaryButtonCommandParameter dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttoncommandparameterproperty
     * @type {DependencyProperty} 
     */
    static PrimaryButtonCommandParameterProperty {
        get => ContentDialog.get_PrimaryButtonCommandParameterProperty()
    }

    /**
     * Gets the identifier of the SecondaryButtonCommandParameter dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttoncommandparameterproperty
     * @type {DependencyProperty} 
     */
    static SecondaryButtonCommandParameterProperty {
        get => ContentDialog.get_SecondaryButtonCommandParameterProperty()
    }

    /**
     * Gets the identifier of the [IsPrimaryButtonEnabled](contentdialog_isprimarybuttonenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.isprimarybuttonenabledproperty
     * @type {DependencyProperty} 
     */
    static IsPrimaryButtonEnabledProperty {
        get => ContentDialog.get_IsPrimaryButtonEnabledProperty()
    }

    /**
     * Gets the identifier of the [IsSecondaryButtonEnabled](contentdialog_issecondarybuttonenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.issecondarybuttonenabledproperty
     * @type {DependencyProperty} 
     */
    static IsSecondaryButtonEnabledProperty {
        get => ContentDialog.get_IsSecondaryButtonEnabledProperty()
    }

    /**
     * Gets the identifier of the CloseButtonText dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttontextproperty
     * @type {DependencyProperty} 
     */
    static CloseButtonTextProperty {
        get => ContentDialog.get_CloseButtonTextProperty()
    }

    /**
     * Gets the identifier of the CloseButtonCommand dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttoncommandproperty
     * @type {DependencyProperty} 
     */
    static CloseButtonCommandProperty {
        get => ContentDialog.get_CloseButtonCommandProperty()
    }

    /**
     * Gets the identifier of the CloseButtonCommandParameter dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttoncommandparameterproperty
     * @type {DependencyProperty} 
     */
    static CloseButtonCommandParameterProperty {
        get => ContentDialog.get_CloseButtonCommandParameterProperty()
    }

    /**
     * Gets the identifier of the PrimaryButtonStyle dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttonstyleproperty
     * @type {DependencyProperty} 
     */
    static PrimaryButtonStyleProperty {
        get => ContentDialog.get_PrimaryButtonStyleProperty()
    }

    /**
     * Gets the identifier of the SecondaryButtonStyle dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttonstyleproperty
     * @type {DependencyProperty} 
     */
    static SecondaryButtonStyleProperty {
        get => ContentDialog.get_SecondaryButtonStyleProperty()
    }

    /**
     * Gets the identifier of the CloseButtonStyle dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttonstyleproperty
     * @type {DependencyProperty} 
     */
    static CloseButtonStyleProperty {
        get => ContentDialog.get_CloseButtonStyleProperty()
    }

    /**
     * Gets the identifier of the DefaultButton dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.defaultbuttonproperty
     * @type {DependencyProperty} 
     */
    static DefaultButtonProperty {
        get => ContentDialog.get_DefaultButtonProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_TitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleTemplateProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_TitleTemplateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FullSizeDesiredProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_FullSizeDesiredProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PrimaryButtonTextProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_PrimaryButtonTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SecondaryButtonTextProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_SecondaryButtonTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PrimaryButtonCommandProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_PrimaryButtonCommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SecondaryButtonCommandProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_SecondaryButtonCommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PrimaryButtonCommandParameterProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_PrimaryButtonCommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SecondaryButtonCommandParameterProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_SecondaryButtonCommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsPrimaryButtonEnabledProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_IsPrimaryButtonEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsSecondaryButtonEnabledProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics.IID)
            ContentDialog.__IContentDialogStatics := IContentDialogStatics(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics.get_IsSecondaryButtonEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CloseButtonTextProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_CloseButtonTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CloseButtonCommandProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_CloseButtonCommandProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CloseButtonCommandParameterProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_CloseButtonCommandParameterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PrimaryButtonStyleProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_PrimaryButtonStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SecondaryButtonStyleProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_SecondaryButtonStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CloseButtonStyleProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_CloseButtonStyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DefaultButtonProperty() {
        if (!ContentDialog.HasProp("__IContentDialogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogStatics2.IID)
            ContentDialog.__IContentDialogStatics2 := IContentDialogStatics2(factoryPtr)
        }

        return ContentDialog.__IContentDialogStatics2.get_DefaultButtonProperty()
    }

    /**
     * 
     * @returns {ContentDialog} 
     */
    static CreateInstance() {
        if (!ContentDialog.HasProp("__IContentDialogFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ContentDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentDialogFactory.IID)
            ContentDialog.__IContentDialogFactory := IContentDialogFactory(factoryPtr)
        }

        return ContentDialog.__IContentDialogFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the title of the dialog.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.title
     * @type {IInspectable} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the title template.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.titletemplate
     * @type {DataTemplate} 
     */
    TitleTemplate {
        get => this.get_TitleTemplate()
        set => this.put_TitleTemplate(value)
    }

    /**
     * Gets or sets a value that indicates whether a request is being made to display the dialog full screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.fullsizedesired
     * @type {Boolean} 
     */
    FullSizeDesired {
        get => this.get_FullSizeDesired()
        set => this.put_FullSizeDesired(value)
    }

    /**
     * Gets or sets the text to display on the primary button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttontext
     * @type {HSTRING} 
     */
    PrimaryButtonText {
        get => this.get_PrimaryButtonText()
        set => this.put_PrimaryButtonText(value)
    }

    /**
     * Gets or sets the text to be displayed on the secondary button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttontext
     * @type {HSTRING} 
     */
    SecondaryButtonText {
        get => this.get_SecondaryButtonText()
        set => this.put_SecondaryButtonText(value)
    }

    /**
     * Gets or sets the command to invoke when the primary button is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttoncommand
     * @type {ICommand} 
     */
    PrimaryButtonCommand {
        get => this.get_PrimaryButtonCommand()
        set => this.put_PrimaryButtonCommand(value)
    }

    /**
     * Gets or sets the command to invoke when the secondary button is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttoncommand
     * @type {ICommand} 
     */
    SecondaryButtonCommand {
        get => this.get_SecondaryButtonCommand()
        set => this.put_SecondaryButtonCommand(value)
    }

    /**
     * Gets or sets the parameter to pass to the command for the primary button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttoncommandparameter
     * @type {IInspectable} 
     */
    PrimaryButtonCommandParameter {
        get => this.get_PrimaryButtonCommandParameter()
        set => this.put_PrimaryButtonCommandParameter(value)
    }

    /**
     * Gets or sets the parameter to pass to the command for the secondary button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttoncommandparameter
     * @type {IInspectable} 
     */
    SecondaryButtonCommandParameter {
        get => this.get_SecondaryButtonCommandParameter()
        set => this.put_SecondaryButtonCommandParameter(value)
    }

    /**
     * Gets or sets whether the dialog's primary button is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.isprimarybuttonenabled
     * @type {Boolean} 
     */
    IsPrimaryButtonEnabled {
        get => this.get_IsPrimaryButtonEnabled()
        set => this.put_IsPrimaryButtonEnabled(value)
    }

    /**
     * Gets or sets whether the dialog's secondary button is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.issecondarybuttonenabled
     * @type {Boolean} 
     */
    IsSecondaryButtonEnabled {
        get => this.get_IsSecondaryButtonEnabled()
        set => this.put_IsSecondaryButtonEnabled(value)
    }

    /**
     * Gets or sets the text to display on the close button.
     * @remarks
     * Every dialog should contain a safe, nondestructive action button that enables the user to confidently exit the dialog.
     * 
     * Use the close button to create this button. This allows you to create the right user experience for all inputs including mouse, keyboard, touch, and gamepad. The dialog will close when:
     * - The user clicks or taps on the close button
     * - The user presses the system back button
     * - The user presses the ESC button on keyboard
     * - The user presses Gamepad B
     * 
     * Invoking the close button returns ContentDialogResult.None.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttontext
     * @type {HSTRING} 
     */
    CloseButtonText {
        get => this.get_CloseButtonText()
        set => this.put_CloseButtonText(value)
    }

    /**
     * Gets or sets the command to invoke when the close button is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttoncommand
     * @type {ICommand} 
     */
    CloseButtonCommand {
        get => this.get_CloseButtonCommand()
        set => this.put_CloseButtonCommand(value)
    }

    /**
     * Gets or sets the parameter to pass to the command for the close button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttoncommandparameter
     * @type {IInspectable} 
     */
    CloseButtonCommandParameter {
        get => this.get_CloseButtonCommandParameter()
        set => this.put_CloseButtonCommandParameter(value)
    }

    /**
     * Gets or sets the [Style](./../windows.ui.xaml/style.md) to apply to the dialog's primary button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.primarybuttonstyle
     * @type {Style} 
     */
    PrimaryButtonStyle {
        get => this.get_PrimaryButtonStyle()
        set => this.put_PrimaryButtonStyle(value)
    }

    /**
     * Gets or sets the [Style](./../windows.ui.xaml/style.md) to apply to the dialog's secondary button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.secondarybuttonstyle
     * @type {Style} 
     */
    SecondaryButtonStyle {
        get => this.get_SecondaryButtonStyle()
        set => this.put_SecondaryButtonStyle(value)
    }

    /**
     * Gets or sets the [Style](./../windows.ui.xaml/style.md) to apply to the dialog's close button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.closebuttonstyle
     * @type {Style} 
     */
    CloseButtonStyle {
        get => this.get_CloseButtonStyle()
        set => this.put_CloseButtonStyle(value)
    }

    /**
     * Gets or sets a value that indicates which button on the dialog is the default action.
     * @remarks
     * You may optionally choose to differentiate one of the three buttons as the default button. Specifying the default button causes the following to happen:
     * - The button receives the Accent Button visual treatment
     * - The button will respond to the ENTER key automatically
     *     - When the user presses the ENTER key on the keyboard, the click handler associated with the default button will fire and the [ContentDialogResult](contentdialogresult.md) will return the value associated with the default button
     *     - If the user has placed focus on a control that handles ENTER, the default button will not respond to ENTER presses
     * - The button will receive focus automatically when the dialog is opened unless the dialog’s content contains focusable UI
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.defaultbutton
     * @type {Integer} 
     */
    DefaultButton {
        get => this.get_DefaultButton()
        set => this.put_DefaultButton(value)
    }

    /**
     * Occurs after the dialog starts to close, but before it is closed and before the [Closed](contentdialog_closed.md) event occurs.
     * @type {TypedEventHandler<ContentDialog, ContentDialogClosingEventArgs>}
    */
    OnClosing {
        get {
            if(!this.HasProp("__OnClosing")){
                this.__OnClosing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{30491cfe-fff8-5c91-b387-ce8137713918}"),
                    ContentDialog,
                    ContentDialogClosingEventArgs
                )
                this.__OnClosingToken := this.add_Closing(this.__OnClosing.iface)
            }
            return this.__OnClosing
        }
    }

    /**
     * Occurs after the dialog is closed.
     * @type {TypedEventHandler<ContentDialog, ContentDialogClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b040eb41-b4f5-5d9f-83c7-9c939c48c890}"),
                    ContentDialog,
                    ContentDialogClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

    /**
     * Occurs after the dialog is opened.
     * @type {TypedEventHandler<ContentDialog, ContentDialogOpenedEventArgs>}
    */
    OnOpened {
        get {
            if(!this.HasProp("__OnOpened")){
                this.__OnOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b79b774b-7c7f-580c-8914-e9cb2642432e}"),
                    ContentDialog,
                    ContentDialogOpenedEventArgs
                )
                this.__OnOpenedToken := this.add_Opened(this.__OnOpened.iface)
            }
            return this.__OnOpened
        }
    }

    /**
     * Occurs after the primary button has been tapped.
     * @type {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>}
    */
    OnPrimaryButtonClick {
        get {
            if(!this.HasProp("__OnPrimaryButtonClick")){
                this.__OnPrimaryButtonClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4b00de1a-ffed-57b4-bd6e-8c7aab2c53ff}"),
                    ContentDialog,
                    ContentDialogButtonClickEventArgs
                )
                this.__OnPrimaryButtonClickToken := this.add_PrimaryButtonClick(this.__OnPrimaryButtonClick.iface)
            }
            return this.__OnPrimaryButtonClick
        }
    }

    /**
     * Occurs after the secondary button has been tapped.
     * @type {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>}
    */
    OnSecondaryButtonClick {
        get {
            if(!this.HasProp("__OnSecondaryButtonClick")){
                this.__OnSecondaryButtonClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4b00de1a-ffed-57b4-bd6e-8c7aab2c53ff}"),
                    ContentDialog,
                    ContentDialogButtonClickEventArgs
                )
                this.__OnSecondaryButtonClickToken := this.add_SecondaryButtonClick(this.__OnSecondaryButtonClick.iface)
            }
            return this.__OnSecondaryButtonClick
        }
    }

    /**
     * Occurs after the close button has been tapped.
     * @type {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>}
    */
    OnCloseButtonClick {
        get {
            if(!this.HasProp("__OnCloseButtonClick")){
                this.__OnCloseButtonClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4b00de1a-ffed-57b4-bd6e-8c7aab2c53ff}"),
                    ContentDialog,
                    ContentDialogButtonClickEventArgs
                )
                this.__OnCloseButtonClickToken := this.add_CloseButtonClick(this.__OnCloseButtonClick.iface)
            }
            return this.__OnCloseButtonClick
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnClosingToken")) {
            this.remove_Closing(this.__OnClosingToken)
            this.__OnClosing.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        if(this.HasProp("__OnOpenedToken")) {
            this.remove_Opened(this.__OnOpenedToken)
            this.__OnOpened.iface.Dispose()
        }

        if(this.HasProp("__OnPrimaryButtonClickToken")) {
            this.remove_PrimaryButtonClick(this.__OnPrimaryButtonClickToken)
            this.__OnPrimaryButtonClick.iface.Dispose()
        }

        if(this.HasProp("__OnSecondaryButtonClickToken")) {
            this.remove_SecondaryButtonClick(this.__OnSecondaryButtonClickToken)
            this.__OnSecondaryButtonClick.iface.Dispose()
        }

        if(this.HasProp("__OnCloseButtonClickToken")) {
            this.remove_CloseButtonClick(this.__OnCloseButtonClickToken)
            this.__OnCloseButtonClick.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Title() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_Title()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_Title(value)
    }

    /**
     * 
     * @returns {DataTemplate} 
     */
    get_TitleTemplate() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_TitleTemplate()
    }

    /**
     * 
     * @param {DataTemplate} value 
     * @returns {HRESULT} 
     */
    put_TitleTemplate(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_TitleTemplate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FullSizeDesired() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_FullSizeDesired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_FullSizeDesired(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_FullSizeDesired(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrimaryButtonText() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_PrimaryButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonText(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_PrimaryButtonText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SecondaryButtonText() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_SecondaryButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonText(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_SecondaryButtonText(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_PrimaryButtonCommand() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_PrimaryButtonCommand()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonCommand(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_PrimaryButtonCommand(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_SecondaryButtonCommand() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_SecondaryButtonCommand()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonCommand(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_SecondaryButtonCommand(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_PrimaryButtonCommandParameter() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_PrimaryButtonCommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonCommandParameter(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_PrimaryButtonCommandParameter(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SecondaryButtonCommandParameter() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_SecondaryButtonCommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonCommandParameter(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_SecondaryButtonCommandParameter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrimaryButtonEnabled() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_IsPrimaryButtonEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPrimaryButtonEnabled(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_IsPrimaryButtonEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSecondaryButtonEnabled() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.get_IsSecondaryButtonEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsSecondaryButtonEnabled(value) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.put_IsSecondaryButtonEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogClosingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closing(handler) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.add_Closing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closing(token) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.remove_Closing(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.remove_Closed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogOpenedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Opened(handler) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.add_Opened(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Opened(token) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.remove_Opened(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryButtonClick(handler) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.add_PrimaryButtonClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrimaryButtonClick(token) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.remove_PrimaryButtonClick(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SecondaryButtonClick(handler) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.add_SecondaryButtonClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SecondaryButtonClick(token) {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.remove_SecondaryButtonClick(token)
    }

    /**
     * Hides the dialog.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.hide
     */
    Hide() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.Hide()
    }

    /**
     * Begins an asynchronous operation to show the dialog with the specified placement.
     * @remarks
     * When you call this method with the **ContentDialogPlacement.Popup** parameter value, the dialog is rooted in the PopupRoot element of the XAML Window. This is the default behavior, and is equivilent to calling the [ShowAsync](contentdialog_showasync_1714076542.md) method with no parameters.
     * 
     * When you call this method with the **ContentDialogPlacement.InPlace** parameter value:
     * 
     * - If the dialog has a parent element, the dialog is rooted in the parent's visual tree. It's shown inline along with the parent’s other child elements, and participates in the parent container’s layout.
     * - If the dialog has no parent, the dialog falls back to the default behavior and is shown in the PopupRoot.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.showasync
     */
    ShowAsync() {
        if (!this.HasProp("__IContentDialog")) {
            if ((queryResult := this.QueryInterface(IContentDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog := IContentDialog(outPtr)
        }

        return this.__IContentDialog.ShowAsync()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CloseButtonText() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_CloseButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonText(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_CloseButtonText(value)
    }

    /**
     * 
     * @returns {ICommand} 
     */
    get_CloseButtonCommand() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_CloseButtonCommand()
    }

    /**
     * 
     * @param {ICommand} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonCommand(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_CloseButtonCommand(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_CloseButtonCommandParameter() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_CloseButtonCommandParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonCommandParameter(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_CloseButtonCommandParameter(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_PrimaryButtonStyle() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_PrimaryButtonStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_PrimaryButtonStyle(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_PrimaryButtonStyle(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_SecondaryButtonStyle() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_SecondaryButtonStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_SecondaryButtonStyle(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_SecondaryButtonStyle(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_CloseButtonStyle() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_CloseButtonStyle()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_CloseButtonStyle(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_CloseButtonStyle(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultButton() {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.get_DefaultButton()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DefaultButton(value) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.put_DefaultButton(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ContentDialog, ContentDialogButtonClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CloseButtonClick(handler) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.add_CloseButtonClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CloseButtonClick(token) {
        if (!this.HasProp("__IContentDialog2")) {
            if ((queryResult := this.QueryInterface(IContentDialog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog2 := IContentDialog2(outPtr)
        }

        return this.__IContentDialog2.remove_CloseButtonClick(token)
    }

    /**
     * Begins an asynchronous operation to show the dialog.
     * @param {Integer} placement_ 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialog.showasync
     */
    ShowAsyncWithPlacement(placement_) {
        if (!this.HasProp("__IContentDialog3")) {
            if ((queryResult := this.QueryInterface(IContentDialog3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialog3 := IContentDialog3(outPtr)
        }

        return this.__IContentDialog3.ShowAsyncWithPlacement(placement_)
    }

;@endregion Instance Methods
}
