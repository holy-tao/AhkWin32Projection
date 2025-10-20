#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class IMLOperatorRegistry extends IUnknown{
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
     * 
     * @param {Pointer<MLOperatorSetId>} operatorSetId 
     * @param {Integer} baselineVersion 
     * @param {Pointer<MLOperatorSchemaDescription>} schema 
     * @param {Integer} schemaCount 
     * @param {Pointer<IMLOperatorTypeInferrer>} typeInferrer 
     * @param {Pointer<IMLOperatorShapeInferrer>} shapeInferrer 
     * @returns {HRESULT} 
     */
    RegisterOperatorSetSchema(operatorSetId, baselineVersion, schema, schemaCount, typeInferrer, shapeInferrer) {
        result := ComCall(3, this, "ptr", operatorSetId, "int", baselineVersion, "ptr", schema, "uint", schemaCount, "ptr", typeInferrer, "ptr", shapeInferrer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MLOperatorKernelDescription>} operatorKernel 
     * @param {Pointer<IMLOperatorKernelFactory>} operatorKernelFactory 
     * @param {Pointer<IMLOperatorShapeInferrer>} shapeInferrer 
     * @returns {HRESULT} 
     */
    RegisterOperatorKernel(operatorKernel, operatorKernelFactory, shapeInferrer) {
        result := ComCall(4, this, "ptr", operatorKernel, "ptr", operatorKernelFactory, "ptr", shapeInferrer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
