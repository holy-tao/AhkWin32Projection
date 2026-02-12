#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionOverload2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionOverload2
     * @type {Guid}
     */
    static IID => Guid("{57ec9906-8231-5a9e-929f-bf39e952eb93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeFeedbackAsync", "GetSupportsFeedback"]

    /**
     * 
     * @param {ActionInvocationContext} context_ 
     * @param {ActionFeedback} feedback 
     * @returns {IAsyncAction} 
     */
    InvokeFeedbackAsync(context_, feedback) {
        result := ComCall(6, this, "ptr", context_, "ptr", feedback, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    GetSupportsFeedback() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
