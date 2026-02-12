#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMessageDialog.ahk
#Include .\IMessageDialogFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a dialog for showing messages to the user.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
  * 
  * > [!IMPORTANT]
  * > You should use MessageDialog only when you are upgrading a Universal Windows 8.x app that uses MessageDialog, and need to minimize changes or if your app isn't XAML. For new XAML apps in Windows 10+, we recommend using the [ContentDialog](./../windows.ui.xaml.controls/contentdialog.md) control instead.
 * @remarks
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * 
 * The dialog has a command bar that can support up to three commands in desktop apps, or two commands in mobile apps. If you don't specify any commands, then a default command is added to close the dialog. The dialog dims the screen behind it, and blocks touch events from passing to the app's canvas until the user responds.
 * 
 * Message dialogs should be used sparingly, and only for critical messages or simple questions that must block the user's flow. Here's an example of a dialog created by the code in the **Examples** section.
 * 
 * <img src="images/MessageDialogWithTwoCommands.png" alt="Message dialog with two commands" />
 * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog
 * @namespace Windows.UI.Popups
 * @version WindowsRuntime 1.4
 */
class MessageDialog extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMessageDialog

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMessageDialog.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [MessageDialog](messagedialog.md) class to display an untitled message dialog that can be used to ask your user simple questions.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * 
     * The dialog dims the screen behind it and blocks touch events from passing to the app's canvas until the user responds.
     * 
     * Message dialogs should be used sparingly, and only for critical messages or simple questions that must block the user's flow.
     * @remarks
     * When localizing the content of a message dialog with string resources ([WinJS.Resources](/previous-versions/windows/apps/br229779(v=win.10))), the **lang** property returned by the [getString](/previous-versions/windows/apps/hh701590(v=win.10)) method is applied by the [MessageDialog](messagedialog.md) constructor automatically. You cannot specify this property in the constructor.
     * @param {HSTRING} content The message displayed to the user.
     * @returns {MessageDialog} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.#ctor
     */
    static Create(content) {
        if (!MessageDialog.HasProp("__IMessageDialogFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.MessageDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMessageDialogFactory.IID)
            MessageDialog.__IMessageDialogFactory := IMessageDialogFactory(factoryPtr)
        }

        return MessageDialog.__IMessageDialogFactory.Create(content)
    }

    /**
     * Initializes a new instance of the [MessageDialog](messagedialog.md) class to display a titled message dialog that can be used to ask your user simple questions.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @remarks
     * When localizing the content of a message dialog with string resources ([WinJS.Resources](/previous-versions/windows/apps/br229779(v=win.10))), the **lang** property returned by the [getString](/previous-versions/windows/apps/hh701590(v=win.10)) method is applied by the [MessageDialog](messagedialog.md) constructor automatically. You cannot specify this property in the constructor.
     * @param {HSTRING} content The message displayed to the user.
     * @param {HSTRING} title The title you want displayed on the dialog.
     * @returns {MessageDialog} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.#ctor
     */
    static CreateWithTitle(content, title) {
        if (!MessageDialog.HasProp("__IMessageDialogFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Popups.MessageDialog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMessageDialogFactory.IID)
            MessageDialog.__IMessageDialogFactory := IMessageDialogFactory(factoryPtr)
        }

        return MessageDialog.__IMessageDialogFactory.CreateWithTitle(content, title)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the title to display on the dialog, if any.
     * @remarks
     * Use the title as a concise main instruction to convey the objective of the dialog.
     * 
     * Long titles do not wrap and will be truncated.
     * 
     * If you use the dialog to deliver a simple message, error, or question, omit the title. Rely on the [content](messagedialog_content.md) to deliver that core information.
     * 
     * On the desktop device family the title is displayed both in the title bar of the popup dialog window, and in the body of the dialog. On the mobile device family, the title is shown only in the body of the dialog.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets an array of commands that appear in the command bar of the message dialog. These commands makes the dialog actionable.
     * 
     * Get this array and add [UICommand](uicommand.md) objects that represent your commands to it. If the dialog is currently showing, the commands aren't added to the command bar.
     * @remarks
     * By default, the array of commands for a dialog is empty. If no commands are appended to this array, then a default "Close" command is shown on the dialog.
     * 
     * To delay interaction with commands for a short period when the dialog is first shown, set the *AcceptUserInputAfterDelay* option with [MessageDialogOptions](messagedialogoptions.md).
     * 
     * A maximum number of 3 [UICommand](uicommand.md) objects can be added, and an exception will be thrown if adding over 3.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.commands
     * @type {IVector<IUICommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * Gets or sets the index of the command you want to use as the default. This is the command that fires by default when users press the ENTER key.
     * 
     * Add the commands before you set the index.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.defaultcommandindex
     * @type {Integer} 
     */
    DefaultCommandIndex {
        get => this.get_DefaultCommandIndex()
        set => this.put_DefaultCommandIndex(value)
    }

    /**
     * Gets or sets the index of the command you want to use as the cancel command. This is the command that fires when users press the ESC key.
     * 
     * Add the commands before you set the index.
     * @remarks
     * Use message dialogs to send critical or blocking messages and questions from the app.
     * 
     * <table>
     *    <tr><th>Value</th><th>When to use</th></tr>
     *    <tr><td>≥ 0</td><td>The dialog offers a safe default choice that is the equivalent of cancellation, like "Cancel" or "Close." Set CancelCommandIndex to the index of the command handler for that cancel/close command, so that when the user dismisses the dialog through a noncommital action, like pressing ESC, the API returns the command handler you want.
     * 
     * > [!NOTE]
     * > Generally, you should avoid creating dialogs that can be dismissed this way and that re-launch asking the same question or sending the same message again and again. They make the app noisy and tend to annoy users.</td></tr>
     *    <tr><td>-1</td><td>The user is required to make an explicit decision like tapping a specific button on the dialog. This ensures that the user can't dismiss the dialog through a noncommital action like pressing ESC.</td></tr>
     *    <tr><td>-2</td><td>**Not recommended**.The dialog is not dismissed when the user presses ESC or during an incoming contract activation; however, if the app re-uses the main app window when responding to incoming activations, the dialog's command handlers will no longer be valid. Because the API doesn't handle this behavior, we recommend not using this value.</td></tr>
     * </table>
     * 
     * **Error handling on dismissal by a contract activation**If the app receives an incoming contract activation (like from Search, Share, Settings, Devices or the file picker contracts) while the dialog is showing, the dialog is programmatically dismissed, regardless of the property value that has been set for the CancelCommandIndex.
     * 
     * To help you handle this case, the API returns a dummy command handler. You, then, can decide how to handle and react to the error.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.cancelcommandindex
     * @type {Integer} 
     */
    CancelCommandIndex {
        get => this.get_CancelCommandIndex()
        set => this.put_CancelCommandIndex(value)
    }

    /**
     * Gets or sets the message to be displayed to the user.
     * @remarks
     * Use the content to convey the objective of the dialog. Present the message, error or blocking question as simply as possible without extraneous information.
     * 
     * When a [title](messagedialog_title.md) is used, use the content to present additional information helpful to understanding or using the dialog. You can use this area to provide more detail or define terminology. Don't repeat the title with slightly different wording.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.content
     * @type {HSTRING} 
     */
    Content {
        get => this.get_Content()
        set => this.put_Content(value)
    }

    /**
     * Gets or sets the options for a [MessageDialog](messagedialog.md).
     * @remarks
     * You can't change options after the dialog displays.
     * 
     * To delay interaction with commands for a short period when the dialog is first shown, set the *AcceptUserInputAfterDelay* option with [MessageDialogOptions](messagedialogoptions.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.options
     * @type {Integer} 
     */
    Options {
        get => this.get_Options()
        set => this.put_Options(value)
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
    get_Title() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.put_Title(value)
    }

    /**
     * 
     * @returns {IVector<IUICommand>} 
     */
    get_Commands() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.get_Commands()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultCommandIndex() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.get_DefaultCommandIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DefaultCommandIndex(value) {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.put_DefaultCommandIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CancelCommandIndex() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.get_CancelCommandIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CancelCommandIndex(value) {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.put_CancelCommandIndex(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Content() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.get_Content()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Content(value) {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.put_Content(value)
    }

    /**
     * Begins an asynchronous operation showing a dialog.
     * @remarks
     * In some cases, the system may close the dialog, like when people invoke an app contract when the dialog is showing. [IAsyncOperation(IUICommand).GetResults](../windows.foundation/iasyncoperation_1_getresults_732303200.md) returns either the command selected which destroyed the dialog, or an empty command.
     * 
     * To launch subsequent dialogs or other modal UI such as file pickers after a dialog has been closed, use the [then](/previous-versions/windows/apps/br229728(v=win.10)) or [done](/previous-versions/windows/apps/hh701079(v=win.10)) functions of the [Promise](/previous-versions/windows/apps/br211867(v=win.10)) object. You cannot launch modal UI from within a [UICommand](uicommand.md) callback.
     * @returns {IAsyncOperation<IUICommand>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.popups.messagedialog.showasync
     */
    ShowAsync() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.ShowAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Options() {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.get_Options()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Options(value) {
        if (!this.HasProp("__IMessageDialog")) {
            if ((queryResult := this.QueryInterface(IMessageDialog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMessageDialog := IMessageDialog(outPtr)
        }

        return this.__IMessageDialog.put_Options(value)
    }

;@endregion Instance Methods
}
