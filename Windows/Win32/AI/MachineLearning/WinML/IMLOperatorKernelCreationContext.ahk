#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMLOperatorAttributes.ahk" { IMLOperatorAttributes }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MLOperatorEdgeDescription.ahk" { MLOperatorEdgeDescription }
#Import ".\IMLOperatorTensorShapeDescription.ahk" { IMLOperatorTensorShapeDescription }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorKernelCreationContext extends IMLOperatorAttributes {
    /**
     * The interface identifier for IMLOperatorKernelCreationContext
     * @type {Guid}
     */
    static IID := Guid("{5459b53d-a0fc-4665-addd-70171ef7e631}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorKernelCreationContext interfaces
    */
    struct Vtbl extends IMLOperatorAttributes.Vtbl {
        GetInputCount             : IntPtr
        GetOutputCount            : IntPtr
        IsInputValid              : IntPtr
        IsOutputValid             : IntPtr
        GetInputEdgeDescription   : IntPtr
        GetOutputEdgeDescription  : IntPtr
        HasTensorShapeDescription : IntPtr
        GetTensorShapeDescription : IntPtr
        GetExecutionInterface     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorKernelCreationContext.Vtbl()
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
     * @param {Integer} outputIndex 
     * @returns {MLOperatorEdgeDescription} 
     */
    GetOutputEdgeDescription(outputIndex) {
        edgeDescription := MLOperatorEdgeDescription()
        result := ComCall(12, this, "uint", outputIndex, MLOperatorEdgeDescription.Ptr, edgeDescription, "HRESULT")
        return edgeDescription
    }

    /**
     * 
     * @returns {Boolean} 
     */
    HasTensorShapeDescription() {
        result := ComCall(13, this, Int32)
        return result
    }

    /**
     * 
     * @returns {IMLOperatorTensorShapeDescription} 
     */
    GetTensorShapeDescription() {
        result := ComCall(14, this, "ptr*", &shapeDescription := 0, "HRESULT")
        return IMLOperatorTensorShapeDescription(shapeDescription)
    }

    /**
     * 
     * @param {Pointer<IUnknown>} executionObject 
     * @returns {String} Nothing - always returns an empty string
     */
    GetExecutionInterface(executionObject) {
        ComCall(15, this, IUnknown.Ptr, executionObject)
    }

    Query(iid) {
        if (IMLOperatorKernelCreationContext.IID.Equals(iid)) {
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
        this.vtbl.GetOutputEdgeDescription := CallbackCreate(GetMethod(implObj, "GetOutputEdgeDescription"), flags, 3)
        this.vtbl.HasTensorShapeDescription := CallbackCreate(GetMethod(implObj, "HasTensorShapeDescription"), flags, 1)
        this.vtbl.GetTensorShapeDescription := CallbackCreate(GetMethod(implObj, "GetTensorShapeDescription"), flags, 2)
        this.vtbl.GetExecutionInterface := CallbackCreate(GetMethod(implObj, "GetExecutionInterface"), flags, 2)
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
        CallbackFree(this.vtbl.GetOutputEdgeDescription)
        CallbackFree(this.vtbl.HasTensorShapeDescription)
        CallbackFree(this.vtbl.GetTensorShapeDescription)
        CallbackFree(this.vtbl.GetExecutionInterface)
    }
}
