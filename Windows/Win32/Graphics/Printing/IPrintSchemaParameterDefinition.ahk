#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPrintSchemaDisplayableElement.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaParameterDefinition extends IPrintSchemaDisplayableElement{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserInputRequired", "get_UnitType", "get_DataType", "get_RangeMin", "get_RangeMax"]

    /**
     * 
     * @returns {BOOL} 
     */
    get_UserInputRequired() {
        result := ComCall(11, this, "int*", &pbIsRequired := 0, "HRESULT")
        return pbIsRequired
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UnitType() {
        pbstrUnitType := BSTR()
        result := ComCall(12, this, "ptr", pbstrUnitType, "HRESULT")
        return pbstrUnitType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataType() {
        result := ComCall(13, this, "int*", &pDataType := 0, "HRESULT")
        return pDataType
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMin() {
        result := ComCall(14, this, "int*", &pRangeMin := 0, "HRESULT")
        return pRangeMin
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RangeMax() {
        result := ComCall(15, this, "int*", &pRangeMax := 0, "HRESULT")
        return pRangeMax
    }
}
