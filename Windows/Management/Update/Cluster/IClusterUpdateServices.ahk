#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UpdateCredential.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class IClusterUpdateServices extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IClusterUpdateServices
     * @type {Guid}
     */
    static IID => Guid("{38461e68-1445-53e3-b914-ce19e3b730c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteLogEntry", "ReportProgress", "GetPluginCredential", "IsOperationMarkedAsCanceled", "SaveRunStateInformation", "GetRunStateInformation", "SaveRunIndependentInformation", "GetRunIndependentInformation"]

    /**
     * 
     * @param {Integer} level 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    WriteLogEntry(level, message) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(6, this, "int", level, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} currentStep 
     * @param {Integer} maxSteps 
     * @param {HSTRING} message 
     * @returns {HRESULT} 
     */
    ReportProgress(currentStep, maxSteps, message) {
        if(message is String) {
            pin := HSTRING.Create(message)
            message := pin.Value
        }
        message := message is Win32Handle ? NumGet(message, "ptr") : message

        result := ComCall(7, this, "int", currentStep, "int", maxSteps, "ptr", message, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} credentialId 
     * @returns {UpdateCredential} 
     */
    GetPluginCredential(credentialId) {
        if(credentialId is String) {
            pin := HSTRING.Create(credentialId)
            credentialId := pin.Value
        }
        credentialId := credentialId is Win32Handle ? NumGet(credentialId, "ptr") : credentialId

        result := ComCall(8, this, "ptr", credentialId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpdateCredential(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsOperationMarkedAsCanceled() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} persistentInformation 
     * @returns {HRESULT} 
     */
    SaveRunStateInformation(persistentInformation) {
        if(persistentInformation is String) {
            pin := HSTRING.Create(persistentInformation)
            persistentInformation := pin.Value
        }
        persistentInformation := persistentInformation is Win32Handle ? NumGet(persistentInformation, "ptr") : persistentInformation

        result := ComCall(10, this, "ptr", persistentInformation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetRunStateInformation() {
        result_ := HSTRING()
        result := ComCall(11, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} persistentInformation 
     * @returns {HRESULT} 
     */
    SaveRunIndependentInformation(persistentInformation) {
        if(persistentInformation is String) {
            pin := HSTRING.Create(persistentInformation)
            persistentInformation := pin.Value
        }
        persistentInformation := persistentInformation is Win32Handle ? NumGet(persistentInformation, "ptr") : persistentInformation

        result := ComCall(12, this, "ptr", persistentInformation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetRunIndependentInformation() {
        result_ := HSTRING()
        result := ComCall(13, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
