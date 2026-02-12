#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\DevicePreparationExecutionContext.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class IMachineProvisioningProgressReporter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMachineProvisioningProgressReporter
     * @type {Guid}
     */
    static IID => Guid("{ebd8677f-dfd2-59da-ac3d-753ee1667cbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionId", "get_SessionConnection", "get_SessionState", "add_SessionStateChanged", "remove_SessionStateChanged", "add_SessionConnectionChanged", "remove_SessionConnectionChanged", "ReportProgress", "GetDevicePreparationExecutionContextAsync"]

    /**
     * @type {Guid} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {Integer} 
     */
    SessionConnection {
        get => this.get_SessionConnection()
    }

    /**
     * @type {Integer} 
     */
    SessionState {
        get => this.get_SessionState()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SessionId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionConnection() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SessionState() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<MachineProvisioningProgressReporter, DeploymentSessionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_SessionStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MachineProvisioningProgressReporter, DeploymentSessionConnectionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionConnectionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_SessionConnectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {AgentProvisioningProgressReport} updateReport 
     * @returns {HRESULT} 
     */
    ReportProgress(updateReport) {
        result := ComCall(13, this, "ptr", updateReport, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<DevicePreparationExecutionContext>} 
     */
    GetDevicePreparationExecutionContextAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(DevicePreparationExecutionContext, operation)
    }
}
