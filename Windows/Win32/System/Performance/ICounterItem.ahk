#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ICounterItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICounterItem
     * @type {Guid}
     */
    static IID => Guid("{771a9520-ee28-11ce-941e-008029004347}")

    /**
     * The class identifier for CounterItem
     * @type {Guid}
     */
    static CLSID => Guid("{c4d2d8e0-d1dd-11ce-940f-008029004348}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Value", "put_Color", "get_Color", "put_Width", "get_Width", "put_LineStyle", "get_LineStyle", "put_ScaleFactor", "get_ScaleFactor", "get_Path", "GetValue", "GetStatistics"]

    /**
     * 
     * @param {Pointer<Float>} pdblValue 
     * @returns {HRESULT} 
     */
    get_Value(pdblValue) {
        result := ComCall(3, this, "double*", pdblValue, "HRESULT")
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
        result := ComCall(5, this, "uint*", pColor, "HRESULT")
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
        result := ComCall(7, this, "int*", piValue, "HRESULT")
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
        result := ComCall(9, this, "int*", piValue, "HRESULT")
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
        result := ComCall(11, this, "int*", piValue, "HRESULT")
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
        result := ComCall(13, this, "double*", Value, "int*", Status, "HRESULT")
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
        result := ComCall(14, this, "double*", Max, "double*", Min, "double*", Avg, "int*", Status, "HRESULT")
        return result
    }
}
