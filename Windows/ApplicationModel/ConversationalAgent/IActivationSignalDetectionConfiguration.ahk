#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\DetectionConfigurationAvailabilityInfo.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IActivationSignalDetectionConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationSignalDetectionConfiguration
     * @type {Guid}
     */
    static IID => Guid("{40d8be16-5217-581c-9ab2-ce9b2f2e8e00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SignalId", "get_ModelId", "get_DisplayName", "get_IsActive", "SetEnabled", "SetEnabledAsync", "get_AvailabilityInfo", "add_AvailabilityChanged", "remove_AvailabilityChanged", "SetModelData", "SetModelDataAsync", "GetModelDataType", "GetModelDataTypeAsync", "GetModelData", "GetModelDataAsync", "ClearModelData", "ClearModelDataAsync", "get_TrainingStepsCompleted", "get_TrainingStepsRemaining", "get_TrainingDataFormat", "ApplyTrainingData", "ApplyTrainingDataAsync", "ClearTrainingData", "ClearTrainingDataAsync"]

    /**
     * @type {HSTRING} 
     */
    SignalId {
        get => this.get_SignalId()
    }

    /**
     * @type {HSTRING} 
     */
    ModelId {
        get => this.get_ModelId()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {DetectionConfigurationAvailabilityInfo} 
     */
    AvailabilityInfo {
        get => this.get_AvailabilityInfo()
    }

    /**
     * @type {Integer} 
     */
    TrainingStepsCompleted {
        get => this.get_TrainingStepsCompleted()
    }

    /**
     * @type {Integer} 
     */
    TrainingStepsRemaining {
        get => this.get_TrainingStepsRemaining()
    }

    /**
     * @type {Integer} 
     */
    TrainingDataFormat {
        get => this.get_TrainingDataFormat()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SignalId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ModelId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Enables one or more Unicode point ranges on the context.
     * @remarks
     * The <b>SetEnabledUnicodeRanges</b> function is optional.
     * 
     * Some recognizers do not support enabling and disabling specific code points, but may still include the <b>SetEnabledUnicodeRanges</b> function. For such recognizers, the <b>SetEnabledUnicodeRanges</b> function returns E_NOTIMPL.
     * 
     * Each recognizer supports one or more Unicode point ranges. To determine which Unicode point ranges the recognizer supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-getunicoderanges">GetUnicodeRanges</a> function. If you do not call this function, the recognizer uses a default set of Unicode point ranges. The default ranges are recognizer specific.
     * 
     * The Microsoft gesture recognizer uses Unicode characters from 0xF000 to 0xF0FF. Each single Unicode value in this range represents a single gesture. For a complete list of Unicode values for gestures, see <a href="https://docs.microsoft.com/windows/desktop/tablet/unicode-range-values-of-gestures">Unicode Range Values of Gestures</a>.
     * @param {Boolean} value 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TPC_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support one of the specified Unicode point ranges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid argument was received.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-setenabledunicoderanges
     */
    SetEnabled(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {IAsyncAction} 
     */
    SetEnabledAsync(value) {
        result := ComCall(11, this, "int", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {DetectionConfigurationAvailabilityInfo} 
     */
    get_AvailabilityInfo() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DetectionConfigurationAvailabilityInfo(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ActivationSignalDetectionConfiguration, DetectionConfigurationAvailabilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailabilityChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_AvailabilityChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} dataType 
     * @param {IInputStream} data 
     * @returns {HRESULT} 
     */
    SetModelData(dataType, data) {
        if(dataType is String) {
            pin := HSTRING.Create(dataType)
            dataType := pin.Value
        }
        dataType := dataType is Win32Handle ? NumGet(dataType, "ptr") : dataType

        result := ComCall(15, this, "ptr", dataType, "ptr", data, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} dataType 
     * @param {IInputStream} data 
     * @returns {IAsyncAction} 
     */
    SetModelDataAsync(dataType, data) {
        if(dataType is String) {
            pin := HSTRING.Create(dataType)
            dataType := pin.Value
        }
        dataType := dataType is Win32Handle ? NumGet(dataType, "ptr") : dataType

        result := ComCall(16, this, "ptr", dataType, "ptr", data, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetModelDataType() {
        result_ := HSTRING()
        result := ComCall(17, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetModelDataTypeAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    GetModelData() {
        result := ComCall(19, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IInputStream>} 
     */
    GetModelDataAsync() {
        result := ComCall(20, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInputStream, operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearModelData() {
        result := ComCall(21, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearModelDataAsync() {
        result := ComCall(22, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingStepsCompleted() {
        result := ComCall(23, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingStepsRemaining() {
        result := ComCall(24, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingDataFormat() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} trainingDataFormat 
     * @param {IInputStream} trainingData 
     * @returns {Integer} 
     */
    ApplyTrainingData(trainingDataFormat, trainingData) {
        result := ComCall(26, this, "int", trainingDataFormat, "ptr", trainingData, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} trainingDataFormat 
     * @param {IInputStream} trainingData 
     * @returns {IAsyncOperation<Integer>} 
     */
    ApplyTrainingDataAsync(trainingDataFormat, trainingData) {
        result := ComCall(27, this, "int", trainingDataFormat, "ptr", trainingData, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearTrainingData() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ClearTrainingDataAsync() {
        result := ComCall(29, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
