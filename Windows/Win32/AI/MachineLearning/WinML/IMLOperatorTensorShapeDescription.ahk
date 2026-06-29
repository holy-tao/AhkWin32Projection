#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorTensorShapeDescription extends IUnknown {
    /**
     * The interface identifier for IMLOperatorTensorShapeDescription
     * @type {Guid}
     */
    static IID := Guid("{f20e8cbe-3b28-4248-be95-f96fbc6e4643}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorTensorShapeDescription interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputTensorDimensionCount  : IntPtr
        GetInputTensorShape           : IntPtr
        HasOutputShapeDescription     : IntPtr
        GetOutputTensorDimensionCount : IntPtr
        GetOutputTensorShape          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorTensorShapeDescription.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {Integer} 
     */
    GetInputTensorDimensionCount(inputIndex) {
        result := ComCall(3, this, "uint", inputIndex, "uint*", &dimensionCount := 0, "HRESULT")
        return dimensionCount
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @param {Integer} dimensionCount 
     * @returns {Integer} 
     */
    GetInputTensorShape(inputIndex, dimensionCount) {
        result := ComCall(4, this, "uint", inputIndex, "uint", dimensionCount, "uint*", &dimensions := 0, "HRESULT")
        return dimensions
    }

    /**
     * 
     * @returns {Boolean} 
     */
    HasOutputShapeDescription() {
        result := ComCall(5, this, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @returns {Integer} 
     */
    GetOutputTensorDimensionCount(outputIndex) {
        result := ComCall(6, this, "uint", outputIndex, "uint*", &dimensionCount := 0, "HRESULT")
        return dimensionCount
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @returns {Integer} 
     */
    GetOutputTensorShape(outputIndex, dimensionCount) {
        result := ComCall(7, this, "uint", outputIndex, "uint", dimensionCount, "uint*", &dimensions := 0, "HRESULT")
        return dimensions
    }

    Query(iid) {
        if (IMLOperatorTensorShapeDescription.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputTensorDimensionCount := CallbackCreate(GetMethod(implObj, "GetInputTensorDimensionCount"), flags, 3)
        this.vtbl.GetInputTensorShape := CallbackCreate(GetMethod(implObj, "GetInputTensorShape"), flags, 4)
        this.vtbl.HasOutputShapeDescription := CallbackCreate(GetMethod(implObj, "HasOutputShapeDescription"), flags, 1)
        this.vtbl.GetOutputTensorDimensionCount := CallbackCreate(GetMethod(implObj, "GetOutputTensorDimensionCount"), flags, 3)
        this.vtbl.GetOutputTensorShape := CallbackCreate(GetMethod(implObj, "GetOutputTensorShape"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputTensorDimensionCount)
        CallbackFree(this.vtbl.GetInputTensorShape)
        CallbackFree(this.vtbl.HasOutputShapeDescription)
        CallbackFree(this.vtbl.GetOutputTensorDimensionCount)
        CallbackFree(this.vtbl.GetOutputTensorShape)
    }
}
