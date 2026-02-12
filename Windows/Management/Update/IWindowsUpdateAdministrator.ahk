#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\WindowsUpdate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateAdministrator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateAdministrator
     * @type {Guid}
     */
    static IID => Guid("{7a60181c-ba1e-5cf9-aa65-304120b73d72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAdministratorScan", "ApproveWindowsUpdateAction", "RevokeWindowsUpdateActionApproval", "ApproveWindowsUpdate", "RevokeWindowsUpdateApproval", "GetUpdates"]

    /**
     * 
     * @returns {HRESULT} 
     */
    StartAdministratorScan() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} updateId 
     * @param {HSTRING} action 
     * @returns {HRESULT} 
     */
    ApproveWindowsUpdateAction(updateId, action) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(action is String) {
            pin := HSTRING.Create(action)
            action := pin.Value
        }
        action := action is Win32Handle ? NumGet(action, "ptr") : action

        result := ComCall(7, this, "ptr", updateId, "ptr", action, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} updateId 
     * @param {HSTRING} action 
     * @returns {HRESULT} 
     */
    RevokeWindowsUpdateActionApproval(updateId, action) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId
        if(action is String) {
            pin := HSTRING.Create(action)
            action := pin.Value
        }
        action := action is Win32Handle ? NumGet(action, "ptr") : action

        result := ComCall(8, this, "ptr", updateId, "ptr", action, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} updateId 
     * @param {WindowsUpdateApprovalData} approvalData 
     * @returns {HRESULT} 
     */
    ApproveWindowsUpdate(updateId, approvalData) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId

        result := ComCall(9, this, "ptr", updateId, "ptr", approvalData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} updateId 
     * @returns {HRESULT} 
     */
    RevokeWindowsUpdateApproval(updateId) {
        if(updateId is String) {
            pin := HSTRING.Create(updateId)
            updateId := pin.Value
        }
        updateId := updateId is Win32Handle ? NumGet(updateId, "ptr") : updateId

        result := ComCall(10, this, "ptr", updateId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<WindowsUpdate>} 
     */
    GetUpdates() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(WindowsUpdate, result_)
    }
}
