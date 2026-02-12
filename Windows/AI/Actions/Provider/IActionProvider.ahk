#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface implemented by an App Actions on Windows provider app to receive an event when the app action is invoked.
 * @remarks
 * For information on implementing an App Actions on Windows provider app using **IActionProvider**, see [Use COM activation with App Actions for Windows
 * ](/windows/ai/app-actions/actions-com-activation).
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.provider.iactionprovider
 * @namespace Windows.AI.Actions.Provider
 * @version WindowsRuntime 1.4
 */
class IActionProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionProvider
     * @type {Guid}
     */
    static IID => Guid("{62906c47-3d07-55f1-aefa-1522505afbbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeAsync"]

    /**
     * Raised when an app action has been invoked.
     * @param {ActionInvocationContext} context_ An [ActionInvocationContext](../windows.ai.actions/actioninvocationcontext.md) object that is used to access contextual information about the action that was invoked, such as the action's ID, input entities, and output entities.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.provider.iactionprovider.invokeasync
     */
    InvokeAsync(context_) {
        result := ComCall(6, this, "ptr", context_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
