#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the command behavior of an interactive UI element that performs an action when invoked, such as sending an email, deleting an item, or submitting a form.
 * @remarks
 * [XamlUICommand](xamluicommand.md) implements this ICommand interface  for C++ or [System.Windows.Input.ICommand](/dotnet/api/system.windows.input.icommand?view=dotnet-uwp-10.0&preserve-view=true) for C# (adding various UI properties, methods, and events).
 * 
 * For a basic example, see the [Button](../windows.ui.xaml.controls/button.md) control, which invokes a command when a user clicks it. There are two ways you manage the command experience:
 * 
 * - Handle the Click event
 * - Bind the Command property to an ICommand implementation that describes the command logic
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.icommand
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ICommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommand
     * @type {Guid}
     */
    static IID => Guid("{e5af3542-ca67-4081-995b-709dd13792df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_CanExecuteChanged", "remove_CanExecuteChanged", "CanExecute", "Execute"]

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CanExecuteChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CanExecuteChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves whether the command can execute in its current state.
     * @remarks
     * Typically, a command source calls this method when the [CanExecuteChanged](icommand_canexecutechanged.md) event is raised.
     * @param {IInspectable} parameter Data used by the command. If the command does not require data, this object can be set to null.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.icommand.canexecute
     */
    CanExecute(parameter) {
        result := ComCall(8, this, "ptr", parameter, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Defines the method to be called when the command is invoked.
     * @param {IInspectable} parameter Data used by the command. If the command does not require data to be passed, this value can be null.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.icommand.execute
     */
    Execute(parameter) {
        result := ComCall(9, this, "ptr", parameter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
