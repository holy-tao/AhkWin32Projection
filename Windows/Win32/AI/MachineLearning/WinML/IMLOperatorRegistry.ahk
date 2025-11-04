#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorRegistry extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLOperatorRegistry
     * @type {Guid}
     */
    static IID => Guid("{2af9dd2d-b516-4672-9ab5-530c208493ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterOperatorSetSchema", "RegisterOperatorKernel"]

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

        result := ComCall(3, this, "ptr", operatorSetId, "int", baselineVersion, schemaMarshal, schema, "uint", schemaCount, "ptr", typeInferrer, "ptr", shapeInferrer, "HRESULT")
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
        result := ComCall(4, this, "ptr", operatorKernel, "ptr", operatorKernelFactory, "ptr", shapeInferrer, "HRESULT")
        return result
    }
}
