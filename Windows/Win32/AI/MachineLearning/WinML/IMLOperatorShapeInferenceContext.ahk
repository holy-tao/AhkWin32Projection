#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMLOperatorAttributes.ahk" { IMLOperatorAttributes }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MLOperatorEdgeDescription.ahk" { MLOperatorEdgeDescription }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorShapeInferenceContext extends IMLOperatorAttributes {
    /**
     * The interface identifier for IMLOperatorShapeInferenceContext
     * @type {Guid}
     */
    static IID := Guid("{105b6b29-5408-4a68-9959-09b5955a3492}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorShapeInferenceContext interfaces
    */
    struct Vtbl extends IMLOperatorAttributes.Vtbl {
        GetInputCount                : IntPtr
        GetOutputCount               : IntPtr
        IsInputValid                 : IntPtr
        IsOutputValid                : IntPtr
        GetInputEdgeDescription      : IntPtr
        GetInputTensorDimensionCount : IntPtr
        GetInputTensorShape          : IntPtr
        SetOutputTensorShape         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorShapeInferenceContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInputCount() {
        result := ComCall(7, this, UInt32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputCount() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {Boolean} 
     */
    IsInputValid(inputIndex) {
        result := ComCall(9, this, "uint", inputIndex, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @returns {Boolean} 
     */
    IsOutputValid(outputIndex) {
        result := ComCall(10, this, "uint", outputIndex, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {MLOperatorEdgeDescription} 
     */
    GetInputEdgeDescription(inputIndex) {
        edgeDescription := MLOperatorEdgeDescription()
        result := ComCall(11, this, "uint", inputIndex, MLOperatorEdgeDescription.Ptr, edgeDescription, "HRESULT")
        return edgeDescription
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {Integer} 
     */
    GetInputTensorDimensionCount(inputIndex) {
        result := ComCall(12, this, "uint", inputIndex, "uint*", &dimensionCount := 0, "HRESULT")
        return dimensionCount
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Integer} dimensionCount 
     * @returns {Integer} 
     */
    GetInputTensorShape(inputIndex, dimensionCount) {
        result := ComCall(13, this, "uint", inputIndex, "uint", dimensionCount, "uint*", &dimensions := 0, "HRESULT")
        return dimensions
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @param {Pointer<Integer>} dimensions 
     * @returns {HRESULT} 
     */
    SetOutputTensorShape(outputIndex, dimensionCount, dimensions) {
        dimensionsMarshal := dimensions is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", outputIndex, "uint", dimensionCount, dimensionsMarshal, dimensions, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorShapeInferenceContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputCount := CallbackCreate(GetMethod(implObj, "GetInputCount"), flags, 1)
        this.vtbl.GetOutputCount := CallbackCreate(GetMethod(implObj, "GetOutputCount"), flags, 1)
        this.vtbl.IsInputValid := CallbackCreate(GetMethod(implObj, "IsInputValid"), flags, 2)
        this.vtbl.IsOutputValid := CallbackCreate(GetMethod(implObj, "IsOutputValid"), flags, 2)
        this.vtbl.GetInputEdgeDescription := CallbackCreate(GetMethod(implObj, "GetInputEdgeDescription"), flags, 3)
        this.vtbl.GetInputTensorDimensionCount := CallbackCreate(GetMethod(implObj, "GetInputTensorDimensionCount"), flags, 3)
        this.vtbl.GetInputTensorShape := CallbackCreate(GetMethod(implObj, "GetInputTensorShape"), flags, 4)
        this.vtbl.SetOutputTensorShape := CallbackCreate(GetMethod(implObj, "SetOutputTensorShape"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputCount)
        CallbackFree(this.vtbl.GetOutputCount)
        CallbackFree(this.vtbl.IsInputValid)
        CallbackFree(this.vtbl.IsOutputValid)
        CallbackFree(this.vtbl.GetInputEdgeDescription)
        CallbackFree(this.vtbl.GetInputTensorDimensionCount)
        CallbackFree(this.vtbl.GetInputTensorShape)
        CallbackFree(this.vtbl.SetOutputTensorShape)
    }
}
