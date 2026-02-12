#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ActivationSignalDetectionConfigurationCreationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IActivationSignalDetector2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationSignalDetector2
     * @type {Guid}
     */
    static IID => Guid("{c7e2490a-baa5-59d2-85d1-ba42f7cf78c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAvailableModelIdsForSignalIdAsync", "GetAvailableModelIdsForSignalId", "CreateConfigurationWithResultAsync", "CreateConfigurationWithResult", "RemoveConfigurationWithResultAsync", "RemoveConfigurationWithResult", "get_DetectorId"]

    /**
     * @type {HSTRING} 
     */
    DetectorId {
        get => this.get_DetectorId()
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @returns {IAsyncOperation<IVector<HSTRING>>} 
     */
    GetAvailableModelIdsForSignalIdAsync(signalId) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId

        result := ComCall(6, this, "ptr", signalId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, (ptr) => HSTRING({ Value: ptr })), operation)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @returns {IVector<HSTRING>} 
     */
    GetAvailableModelIdsForSignalId(signalId) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId

        result := ComCall(7, this, "ptr", signalId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @param {HSTRING} displayName 
     * @returns {IAsyncOperation<ActivationSignalDetectionConfigurationCreationResult>} 
     */
    CreateConfigurationWithResultAsync(signalId, modelId, displayName) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId
        if(modelId is String) {
            pin := HSTRING.Create(modelId)
            modelId := pin.Value
        }
        modelId := modelId is Win32Handle ? NumGet(modelId, "ptr") : modelId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(8, this, "ptr", signalId, "ptr", modelId, "ptr", displayName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ActivationSignalDetectionConfigurationCreationResult, operation)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @param {HSTRING} displayName 
     * @returns {ActivationSignalDetectionConfigurationCreationResult} 
     */
    CreateConfigurationWithResult(signalId, modelId, displayName) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId
        if(modelId is String) {
            pin := HSTRING.Create(modelId)
            modelId := pin.Value
        }
        modelId := modelId is Win32Handle ? NumGet(modelId, "ptr") : modelId
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(9, this, "ptr", signalId, "ptr", modelId, "ptr", displayName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivationSignalDetectionConfigurationCreationResult(result_)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @returns {IAsyncOperation<Integer>} 
     */
    RemoveConfigurationWithResultAsync(signalId, modelId) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId
        if(modelId is String) {
            pin := HSTRING.Create(modelId)
            modelId := pin.Value
        }
        modelId := modelId is Win32Handle ? NumGet(modelId, "ptr") : modelId

        result := ComCall(10, this, "ptr", signalId, "ptr", modelId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @returns {Integer} 
     */
    RemoveConfigurationWithResult(signalId, modelId) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId
        if(modelId is String) {
            pin := HSTRING.Create(modelId)
            modelId := pin.Value
        }
        modelId := modelId is Win32Handle ? NumGet(modelId, "ptr") : modelId

        result := ComCall(11, this, "ptr", signalId, "ptr", modelId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DetectorId() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
