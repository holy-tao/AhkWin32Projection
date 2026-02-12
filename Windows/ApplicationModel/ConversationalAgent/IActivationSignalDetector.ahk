#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\ActivationSignalDetectionConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IActivationSignalDetector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationSignalDetector
     * @type {Guid}
     */
    static IID => Guid("{b5bf345f-a4d0-5b2b-8e65-b3c55ee756ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProviderId", "get_Kind", "get_CanCreateConfigurations", "get_SupportedModelDataTypes", "get_SupportedTrainingDataFormats", "get_SupportedPowerStates", "GetSupportedModelIdsForSignalId", "GetSupportedModelIdsForSignalIdAsync", "CreateConfiguration", "CreateConfigurationAsync", "GetConfigurations", "GetConfigurationsAsync", "GetConfiguration", "GetConfigurationAsync", "RemoveConfiguration", "RemoveConfigurationAsync"]

    /**
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {Boolean} 
     */
    CanCreateConfigurations {
        get => this.get_CanCreateConfigurations()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SupportedModelDataTypes {
        get => this.get_SupportedModelDataTypes()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedTrainingDataFormats {
        get => this.get_SupportedTrainingDataFormats()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedPowerStates {
        get => this.get_SupportedPowerStates()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        value := HSTRING()
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
    get_Kind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCreateConfigurations() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SupportedModelDataTypes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedTrainingDataFormats() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPowerStates() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @returns {IVectorView<HSTRING>} 
     */
    GetSupportedModelIdsForSignalId(signalId) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId

        result := ComCall(12, this, "ptr", signalId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), result_)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     */
    GetSupportedModelIdsForSignalIdAsync(signalId) {
        if(signalId is String) {
            pin := HSTRING.Create(signalId)
            signalId := pin.Value
        }
        signalId := signalId is Win32Handle ? NumGet(signalId, "ptr") : signalId

        result := ComCall(13, this, "ptr", signalId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), operation)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @param {HSTRING} displayName 
     * @returns {HRESULT} 
     */
    CreateConfiguration(signalId, modelId, displayName) {
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

        result := ComCall(14, this, "ptr", signalId, "ptr", modelId, "ptr", displayName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @param {HSTRING} displayName 
     * @returns {IAsyncAction} 
     */
    CreateConfigurationAsync(signalId, modelId, displayName) {
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

        result := ComCall(15, this, "ptr", signalId, "ptr", modelId, "ptr", displayName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IVectorView<ActivationSignalDetectionConfiguration>} 
     */
    GetConfigurations() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ActivationSignalDetectionConfiguration, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ActivationSignalDetectionConfiguration>>} 
     */
    GetConfigurationsAsync() {
        result := ComCall(17, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ActivationSignalDetectionConfiguration), operation)
    }

    /**
     * Read the active configuration of the collector.
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @returns {ActivationSignalDetectionConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/BEvtColProv/control-getconfiguration
     */
    GetConfiguration(signalId, modelId) {
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

        result := ComCall(18, this, "ptr", signalId, "ptr", modelId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivationSignalDetectionConfiguration(result_)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @returns {IAsyncOperation<ActivationSignalDetectionConfiguration>} 
     */
    GetConfigurationAsync(signalId, modelId) {
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

        result := ComCall(19, this, "ptr", signalId, "ptr", modelId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ActivationSignalDetectionConfiguration, operation)
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @returns {HRESULT} 
     */
    RemoveConfiguration(signalId, modelId) {
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

        result := ComCall(20, this, "ptr", signalId, "ptr", modelId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} signalId 
     * @param {HSTRING} modelId 
     * @returns {IAsyncAction} 
     */
    RemoveConfigurationAsync(signalId, modelId) {
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

        result := ComCall(21, this, "ptr", signalId, "ptr", modelId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
