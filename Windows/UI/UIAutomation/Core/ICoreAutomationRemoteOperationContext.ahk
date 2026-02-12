#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class ICoreAutomationRemoteOperationContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreAutomationRemoteOperationContext
     * @type {Guid}
     */
    static IID => Guid("{b9af9cbb-3d3e-5918-a16b-7861626a3aeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOperand", "SetOperand", "SetOperand2"]

    /**
     * 
     * @param {AutomationRemoteOperationOperandId} id 
     * @returns {IInspectable} 
     */
    GetOperand(id) {
        result := ComCall(6, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @param {AutomationRemoteOperationOperandId} id 
     * @param {IInspectable} operand 
     * @returns {HRESULT} 
     */
    SetOperand(id, operand) {
        result := ComCall(7, this, "ptr", id, "ptr", operand, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AutomationRemoteOperationOperandId} id 
     * @param {IInspectable} operand 
     * @param {Guid} operandInterfaceId 
     * @returns {HRESULT} 
     */
    SetOperand2(id, operand, operandInterfaceId) {
        result := ComCall(8, this, "ptr", id, "ptr", operand, "ptr", operandInterfaceId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
