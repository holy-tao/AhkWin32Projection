#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMLOperatorAttributes.ahk" { IMLOperatorAttributes }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MLOperatorEdgeDescription.ahk" { MLOperatorEdgeDescription }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorTypeInferenceContext extends IMLOperatorAttributes {
    /**
     * The interface identifier for IMLOperatorTypeInferenceContext
     * @type {Guid}
     */
    static IID := Guid("{ec893bb1-f938-427b-8488-c8dcf775f138}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorTypeInferenceContext interfaces
    */
    struct Vtbl extends IMLOperatorAttributes.Vtbl {
        GetInputCount            : IntPtr
        GetOutputCount           : IntPtr
        IsInputValid             : IntPtr
        IsOutputValid            : IntPtr
        GetInputEdgeDescription  : IntPtr
        SetOutputEdgeDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorTypeInferenceContext.Vtbl()
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
     * @param {Pointer<MLOperatorEdgeDescription>} edgeDescription 
     * @returns {HRESULT} 
     */
    SetOutputEdgeDescription(outputIndex, edgeDescription) {
        result := ComCall(12, this, "uint", outputIndex, MLOperatorEdgeDescription.Ptr, edgeDescription, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorTypeInferenceContext.IID.Equals(iid)) {
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
        this.vtbl.SetOutputEdgeDescription := CallbackCreate(GetMethod(implObj, "SetOutputEdgeDescription"), flags, 3)
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
        CallbackFree(this.vtbl.SetOutputEdgeDescription)
    }
}
