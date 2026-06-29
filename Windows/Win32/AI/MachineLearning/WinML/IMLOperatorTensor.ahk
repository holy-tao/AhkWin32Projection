#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MLOperatorTensorDataType.ahk" { MLOperatorTensorDataType }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorTensor extends IUnknown {
    /**
     * The interface identifier for IMLOperatorTensor
     * @type {Guid}
     */
    static IID := Guid("{7fe41f41-f430-440e-aece-54416dc8b9db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorTensor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDimensionCount : IntPtr
        GetShape          : IntPtr
        GetTensorDataType : IntPtr
        IsCpuData         : IntPtr
        IsDataInterface   : IntPtr
        GetData           : IntPtr
        GetDataInterface  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorTensor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDimensionCount() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} dimensionCount 
     * @returns {Integer} 
     */
    GetShape(dimensionCount) {
        result := ComCall(4, this, "uint", dimensionCount, "uint*", &dimensions := 0, "HRESULT")
        return dimensions
    }

    /**
     * 
     * @returns {MLOperatorTensorDataType} 
     */
    GetTensorDataType() {
        result := ComCall(5, this, MLOperatorTensorDataType)
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsCpuData() {
        result := ComCall(6, this, Int32)
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsDataInterface() {
        result := ComCall(7, this, Int32)
        return result
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetData() {
        result := ComCall(8, this, IntPtr)
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} dataInterface 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDataInterface(dataInterface) {
        ComCall(9, this, IUnknown.Ptr, dataInterface)
    }

    Query(iid) {
        if (IMLOperatorTensor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDimensionCount := CallbackCreate(GetMethod(implObj, "GetDimensionCount"), flags, 1)
        this.vtbl.GetShape := CallbackCreate(GetMethod(implObj, "GetShape"), flags, 3)
        this.vtbl.GetTensorDataType := CallbackCreate(GetMethod(implObj, "GetTensorDataType"), flags, 1)
        this.vtbl.IsCpuData := CallbackCreate(GetMethod(implObj, "IsCpuData"), flags, 1)
        this.vtbl.IsDataInterface := CallbackCreate(GetMethod(implObj, "IsDataInterface"), flags, 1)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 1)
        this.vtbl.GetDataInterface := CallbackCreate(GetMethod(implObj, "GetDataInterface"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDimensionCount)
        CallbackFree(this.vtbl.GetShape)
        CallbackFree(this.vtbl.GetTensorDataType)
        CallbackFree(this.vtbl.IsCpuData)
        CallbackFree(this.vtbl.IsDataInterface)
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.GetDataInterface)
    }
}
