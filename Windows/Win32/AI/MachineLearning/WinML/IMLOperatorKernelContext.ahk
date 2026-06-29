#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLOperatorTensor.ahk" { IMLOperatorTensor }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorKernelContext extends IUnknown {
    /**
     * The interface identifier for IMLOperatorKernelContext
     * @type {Guid}
     */
    static IID := Guid("{82536a28-f022-4769-9d3f-8b278f84c0c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorKernelContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInputTensor        : IntPtr
        GetOutputTensor       : IntPtr
        GetOutputTensor1      : IntPtr
        AllocateTemporaryData : IntPtr
        GetExecutionInterface : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorKernelContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} inputIndex 
     * @returns {IMLOperatorTensor} 
     */
    GetInputTensor(inputIndex) {
        result := ComCall(3, this, "uint", inputIndex, "ptr*", &tensor := 0, "HRESULT")
        return IMLOperatorTensor(tensor)
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @param {Integer} dimensionCount 
     * @param {Pointer<Integer>} dimensionSizes 
     * @returns {IMLOperatorTensor} 
     */
    GetOutputTensor(outputIndex, dimensionCount, dimensionSizes) {
        dimensionSizesMarshal := dimensionSizes is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", outputIndex, "uint", dimensionCount, dimensionSizesMarshal, dimensionSizes, "ptr*", &tensor := 0, "HRESULT")
        return IMLOperatorTensor(tensor)
    }

    /**
     * 
     * @param {Integer} outputIndex 
     * @returns {IMLOperatorTensor} 
     */
    GetOutputTensor1(outputIndex) {
        result := ComCall(5, this, "uint", outputIndex, "ptr*", &tensor := 0, "HRESULT")
        return IMLOperatorTensor(tensor)
    }

    /**
     * 
     * @param {Pointer} _size 
     * @returns {IUnknown} 
     */
    AllocateTemporaryData(_size) {
        result := ComCall(6, this, "ptr", _size, "ptr*", &data := 0, "HRESULT")
        return IUnknown(data)
    }

    /**
     * 
     * @param {Pointer<IUnknown>} executionObject 
     * @returns {String} Nothing - always returns an empty string
     */
    GetExecutionInterface(executionObject) {
        ComCall(7, this, IUnknown.Ptr, executionObject)
    }

    Query(iid) {
        if (IMLOperatorKernelContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInputTensor := CallbackCreate(GetMethod(implObj, "GetInputTensor"), flags, 3)
        this.vtbl.GetOutputTensor := CallbackCreate(GetMethod(implObj, "GetOutputTensor"), flags, 5)
        this.vtbl.GetOutputTensor1 := CallbackCreate(GetMethod(implObj, "GetOutputTensor1"), flags, 3)
        this.vtbl.AllocateTemporaryData := CallbackCreate(GetMethod(implObj, "AllocateTemporaryData"), flags, 3)
        this.vtbl.GetExecutionInterface := CallbackCreate(GetMethod(implObj, "GetExecutionInterface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInputTensor)
        CallbackFree(this.vtbl.GetOutputTensor)
        CallbackFree(this.vtbl.GetOutputTensor1)
        CallbackFree(this.vtbl.AllocateTemporaryData)
        CallbackFree(this.vtbl.GetExecutionInterface)
    }
}
