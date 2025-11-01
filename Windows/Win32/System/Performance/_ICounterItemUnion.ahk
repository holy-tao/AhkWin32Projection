#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class _ICounterItemUnion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for _ICounterItemUnion
     * @type {Guid}
     */
    static IID => Guid("{de1a6b74-9182-4c41-8e2c-24c2cd30ee83}")

    /**
     * The class identifier for _ICounterItemUnion
     * @type {Guid}
     */
    static CLSID => Guid("{de1a6b74-9182-4c41-8e2c-24c2cd30ee83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Color", "get_Color", "put_Width", "get_Width", "put_LineStyle", "get_LineStyle", "put_ScaleFactor", "get_ScaleFactor", "get_Path", "GetValue", "GetStatistics", "put_Selected", "get_Selected", "put_Visible", "get_Visible", "GetDataAt"]

    /**
     * 
     * @param {Pointer<Float>} pdblValue 
     * @returns {HRESULT} 
     */
    get_Value(pdblValue) {
        pdblValueMarshal := pdblValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, pdblValueMarshal, pdblValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_Color(Color) {
        result := ComCall(4, this, "uint", Color, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pColor 
     * @returns {HRESULT} 
     */
    get_Color(pColor) {
        pColorMarshal := pColor is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pColorMarshal, pColor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iWidth 
     * @returns {HRESULT} 
     */
    put_Width(iWidth) {
        result := ComCall(6, this, "int", iWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piValue 
     * @returns {HRESULT} 
     */
    get_Width(piValue) {
        piValueMarshal := piValue is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, piValueMarshal, piValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iLineStyle 
     * @returns {HRESULT} 
     */
    put_LineStyle(iLineStyle) {
        result := ComCall(8, this, "int", iLineStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piValue 
     * @returns {HRESULT} 
     */
    get_LineStyle(piValue) {
        piValueMarshal := piValue is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, piValueMarshal, piValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iScale 
     * @returns {HRESULT} 
     */
    put_ScaleFactor(iScale) {
        result := ComCall(10, this, "int", iScale, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piValue 
     * @returns {HRESULT} 
     */
    get_ScaleFactor(piValue) {
        piValueMarshal := piValue is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, piValueMarshal, piValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrValue 
     * @returns {HRESULT} 
     */
    get_Path(pstrValue) {
        result := ComCall(12, this, "ptr", pstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     */
    GetValue(Value, Status) {
        ValueMarshal := Value is VarRef ? "double*" : "ptr"
        StatusMarshal := Status is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, ValueMarshal, Value, StatusMarshal, Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Max 
     * @param {Pointer<Float>} Min 
     * @param {Pointer<Float>} Avg 
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     */
    GetStatistics(Max, Min, Avg, Status) {
        MaxMarshal := Max is VarRef ? "double*" : "ptr"
        MinMarshal := Min is VarRef ? "double*" : "ptr"
        AvgMarshal := Avg is VarRef ? "double*" : "ptr"
        StatusMarshal := Status is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, MaxMarshal, Max, MinMarshal, Min, AvgMarshal, Avg, StatusMarshal, Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Selected(bState) {
        result := ComCall(15, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_Selected(pbState) {
        result := ComCall(16, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Visible(bState) {
        result := ComCall(17, this, "short", bState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_Visible(pbState) {
        result := ComCall(18, this, "ptr", pbState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {Integer} iWhich 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    GetDataAt(iIndex, iWhich, pVariant) {
        result := ComCall(19, this, "int", iIndex, "int", iWhich, "ptr", pVariant, "HRESULT")
        return result
    }
}
