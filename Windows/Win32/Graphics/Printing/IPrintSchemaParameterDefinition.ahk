#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaParameterDefinition extends IPrintSchemaDisplayableElement{
    /**
     * The interface identifier for IPrintSchemaParameterDefinition
     * @type {Guid}
     */
    static IID => Guid("{b5ade81e-0e61-4fe1-81c6-c333e4ffe0f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<BOOL>} pbIsRequired 
     * @returns {HRESULT} 
     */
    get_UserInputRequired(pbIsRequired) {
        result := ComCall(11, this, "ptr", pbIsRequired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUnitType 
     * @returns {HRESULT} 
     */
    get_UnitType(pbstrUnitType) {
        result := ComCall(12, this, "ptr", pbstrUnitType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDataType 
     * @returns {HRESULT} 
     */
    get_DataType(pDataType) {
        result := ComCall(13, this, "int*", pDataType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRangeMin 
     * @returns {HRESULT} 
     */
    get_RangeMin(pRangeMin) {
        result := ComCall(14, this, "int*", pRangeMin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRangeMax 
     * @returns {HRESULT} 
     */
    get_RangeMax(pRangeMax) {
        result := ComCall(15, this, "int*", pRangeMax, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
