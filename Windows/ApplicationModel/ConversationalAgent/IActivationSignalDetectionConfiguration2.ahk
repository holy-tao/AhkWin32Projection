#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IActivationSignalDetectionConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationSignalDetectionConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{71d9b022-562c-57ce-a78b-8b4ff0145bab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetModelDataWithResult", "SetModelDataWithResultAsync", "SetEnabledWithResultAsync", "SetEnabledWithResult", "get_TrainingStepCompletionMaxAllowedTime"]

    /**
     * @type {Integer} 
     */
    TrainingStepCompletionMaxAllowedTime {
        get => this.get_TrainingStepCompletionMaxAllowedTime()
    }

    /**
     * 
     * @param {HSTRING} dataType 
     * @param {IInputStream} data 
     * @returns {Integer} 
     */
    SetModelDataWithResult(dataType, data) {
        if(dataType is String) {
            pin := HSTRING.Create(dataType)
            dataType := pin.Value
        }
        dataType := dataType is Win32Handle ? NumGet(dataType, "ptr") : dataType

        result := ComCall(6, this, "ptr", dataType, "ptr", data, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} dataType 
     * @param {IInputStream} data 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetModelDataWithResultAsync(dataType, data) {
        if(dataType is String) {
            pin := HSTRING.Create(dataType)
            dataType := pin.Value
        }
        dataType := dataType is Win32Handle ? NumGet(dataType, "ptr") : dataType

        result := ComCall(7, this, "ptr", dataType, "ptr", data, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetEnabledWithResultAsync(value) {
        result := ComCall(8, this, "int", value, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {Integer} 
     */
    SetEnabledWithResult(value) {
        result := ComCall(9, this, "int", value, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrainingStepCompletionMaxAllowedTime() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
