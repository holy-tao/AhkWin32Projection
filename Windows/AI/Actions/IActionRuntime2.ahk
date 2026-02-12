#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActionFeedback.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionRuntime2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionRuntime2
     * @type {Guid}
     */
    static IID => Guid("{2da4d2c0-e593-5350-8143-15bb24f63411}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateActionFeedback", "SetActionAvailability", "GetActionAvailability"]

    /**
     * 
     * @param {Integer} feedbackKind 
     * @returns {ActionFeedback} 
     */
    CreateActionFeedback(feedbackKind) {
        result := ComCall(6, this, "int", feedbackKind, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActionFeedback(result_)
    }

    /**
     * 
     * @param {HSTRING} actionId 
     * @param {Boolean} isAvailable 
     * @returns {HRESULT} 
     */
    SetActionAvailability(actionId, isAvailable) {
        if(actionId is String) {
            pin := HSTRING.Create(actionId)
            actionId := pin.Value
        }
        actionId := actionId is Win32Handle ? NumGet(actionId, "ptr") : actionId

        result := ComCall(7, this, "ptr", actionId, "int", isAvailable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} actionId 
     * @returns {Boolean} 
     */
    GetActionAvailability(actionId) {
        if(actionId is String) {
            pin := HSTRING.Create(actionId)
            actionId := pin.Value
        }
        actionId := actionId is Win32Handle ? NumGet(actionId, "ptr") : actionId

        result := ComCall(8, this, "ptr", actionId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
