#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LearningModel.ahk
#Include .\LearningModelDevice.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\LearningModelEvaluationResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelSession
     * @type {Guid}
     */
    static IID => Guid("{8e58f8f6-b787-4c11-90f0-7129aeca74a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Model", "get_Device", "get_EvaluationProperties", "EvaluateAsync", "EvaluateFeaturesAsync", "Evaluate", "EvaluateFeatures"]

    /**
     * @type {LearningModel} 
     */
    Model {
        get => this.get_Model()
    }

    /**
     * @type {LearningModelDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * @type {IPropertySet} 
     */
    EvaluationProperties {
        get => this.get_EvaluationProperties()
    }

    /**
     * 
     * @returns {LearningModel} 
     */
    get_Model() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModel(value)
    }

    /**
     * 
     * @returns {LearningModelDevice} 
     */
    get_Device() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelDevice(value)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_EvaluationProperties() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @param {LearningModelBinding} bindings 
     * @param {HSTRING} correlationId_ 
     * @returns {IAsyncOperation<LearningModelEvaluationResult>} 
     */
    EvaluateAsync(bindings, correlationId_) {
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(9, this, "ptr", bindings, "ptr", correlationId_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModelEvaluationResult, operation)
    }

    /**
     * 
     * @param {IMap<HSTRING, IInspectable>} features 
     * @param {HSTRING} correlationId_ 
     * @returns {IAsyncOperation<LearningModelEvaluationResult>} 
     */
    EvaluateFeaturesAsync(features, correlationId_) {
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(10, this, "ptr", features, "ptr", correlationId_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(LearningModelEvaluationResult, operation)
    }

    /**
     * Evaluates at the indexed sample location.
     * @remarks
     * Interpolation mode can be **linear** or **linear\_no\_perspective** on the variable. Use of **centroid** or **sample** is ignored. Attributes with constant interpolation are also allowed, in which case the sample index is ignored.
     * @param {LearningModelBinding} bindings 
     * @param {HSTRING} correlationId_ 
     * @returns {LearningModelEvaluationResult} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/evaluateattributeatsample
     */
    Evaluate(bindings, correlationId_) {
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(11, this, "ptr", bindings, "ptr", correlationId_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelEvaluationResult(result_)
    }

    /**
     * 
     * @param {IMap<HSTRING, IInspectable>} features 
     * @param {HSTRING} correlationId_ 
     * @returns {LearningModelEvaluationResult} 
     */
    EvaluateFeatures(features, correlationId_) {
        if(correlationId_ is String) {
            pin := HSTRING.Create(correlationId_)
            correlationId_ := pin.Value
        }
        correlationId_ := correlationId_ is Win32Handle ? NumGet(correlationId_, "ptr") : correlationId_

        result := ComCall(12, this, "ptr", features, "ptr", correlationId_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LearningModelEvaluationResult(result_)
    }
}
