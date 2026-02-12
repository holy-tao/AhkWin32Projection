#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The interface implemented by an App Actions on Windows provider app to receive an event when the app action feedback is submitted by the user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.provider.iactionfeedbackhandler
 * @namespace Windows.AI.Actions.Provider
 * @version WindowsRuntime 1.4
 */
class IActionFeedbackHandler extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionFeedbackHandler
     * @type {Guid}
     */
    static IID => Guid("{a3fc3c51-a8c6-52c8-ad77-37bf3e2b565c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ProcessFeedbackAsync"]

    /**
     * Raised when user feedback is submitted for an app action.
     * @param {ActionInvocationContext} context_ An [ActionInvocationContext](../windows.ai.actions/actioninvocationcontext.md) object that is used to access contextual information about the action for which feedback was submitted.
     * @param {ActionFeedback} feedback A value from the [ActionFeedback](../windows.ai.actions/actionfeedback.md) enumeration specifying the type of feedback that was submitted.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.provider.iactionfeedbackhandler.processfeedbackasync
     */
    ProcessFeedbackAsync(context_, feedback) {
        result := ComCall(6, this, "ptr", context_, "ptr", feedback, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
