#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\MLOperatorSchemaDescription.ahk" { MLOperatorSchemaDescription }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMLOperatorShapeInferrer.ahk" { IMLOperatorShapeInferrer }
#Import ".\MLOperatorKernelDescription.ahk" { MLOperatorKernelDescription }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MLOperatorSetId.ahk" { MLOperatorSetId }
#Import ".\IMLOperatorKernelFactory.ahk" { IMLOperatorKernelFactory }
#Import ".\IMLOperatorTypeInferrer.ahk" { IMLOperatorTypeInferrer }

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct IMLOperatorRegistry extends IUnknown {
    /**
     * The interface identifier for IMLOperatorRegistry
     * @type {Guid}
     */
    static IID := Guid("{2af9dd2d-b516-4672-9ab5-530c208493ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMLOperatorRegistry interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RegisterOperatorSetSchema : IntPtr
        RegisterOperatorKernel    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMLOperatorRegistry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<MLOperatorSetId>} operatorSetId 
     * @param {Integer} baselineVersion 
     * @param {Pointer<Pointer<MLOperatorSchemaDescription>>} schema 
     * @param {Integer} schemaCount 
     * @param {IMLOperatorTypeInferrer} typeInferrer 
     * @param {IMLOperatorShapeInferrer} shapeInferrer 
     * @returns {HRESULT} 
     */
    RegisterOperatorSetSchema(operatorSetId, baselineVersion, schema, schemaCount, typeInferrer, shapeInferrer) {
        schemaMarshal := schema is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, MLOperatorSetId.Ptr, operatorSetId, "int", baselineVersion, schemaMarshal, schema, "uint", schemaCount, "ptr", typeInferrer, "ptr", shapeInferrer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MLOperatorKernelDescription>} operatorKernel 
     * @param {IMLOperatorKernelFactory} operatorKernelFactory 
     * @param {IMLOperatorShapeInferrer} shapeInferrer 
     * @returns {HRESULT} 
     */
    RegisterOperatorKernel(operatorKernel, operatorKernelFactory, shapeInferrer) {
        result := ComCall(4, this, MLOperatorKernelDescription.Ptr, operatorKernel, "ptr", operatorKernelFactory, "ptr", shapeInferrer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMLOperatorRegistry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterOperatorSetSchema := CallbackCreate(GetMethod(implObj, "RegisterOperatorSetSchema"), flags, 7)
        this.vtbl.RegisterOperatorKernel := CallbackCreate(GetMethod(implObj, "RegisterOperatorKernel"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterOperatorSetSchema)
        CallbackFree(this.vtbl.RegisterOperatorKernel)
    }
}
