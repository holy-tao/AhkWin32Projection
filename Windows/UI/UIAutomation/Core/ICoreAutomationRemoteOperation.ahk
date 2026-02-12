#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\AutomationRemoteOperationResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides support for implementing one or more pattern extensions for a UI Automation provider.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.icoreautomationremoteoperationextensionprovider
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class ICoreAutomationRemoteOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreAutomationRemoteOperation
     * @type {Guid}
     */
    static IID => Guid("{3ac656f4-e2bc-5c6e-b8e7-b224fb74b060}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsOpcodeSupported", "ImportElement", "ImportTextRange", "AddToResults", "Execute"]

    /**
     * 
     * @param {Integer} opcode 
     * @returns {Boolean} 
     */
    IsOpcodeSupported(opcode) {
        result := ComCall(6, this, "uint", opcode, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {AutomationRemoteOperationOperandId} operandId 
     * @param {AutomationElement} element 
     * @returns {HRESULT} 
     */
    ImportElement(operandId, element) {
        result := ComCall(7, this, "ptr", operandId, "ptr", element, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AutomationRemoteOperationOperandId} operandId 
     * @param {AutomationTextRange} textRange_ 
     * @returns {HRESULT} 
     */
    ImportTextRange(operandId, textRange_) {
        result := ComCall(8, this, "ptr", operandId, "ptr", textRange_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AutomationRemoteOperationOperandId} operandId 
     * @returns {HRESULT} 
     */
    AddToResults(operandId) {
        result := ComCall(9, this, "ptr", operandId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn how to run SQL Server stored procedures with RPC, and process return codes and output parameters in this example.
     * @param {Integer} bytecodeBuffer_length 
     * @param {Pointer<Integer>} bytecodeBuffer 
     * @returns {AutomationRemoteOperationResult} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/results/execute-stored-procedure-with-rpc-and-process-output
     */
    Execute(bytecodeBuffer_length, bytecodeBuffer) {
        bytecodeBufferMarshal := bytecodeBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, "uint", bytecodeBuffer_length, bytecodeBufferMarshal, bytecodeBuffer, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AutomationRemoteOperationResult(result_)
    }
}
