#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class _ICounterItemUnion extends IUnknown{
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
     * 
     * @param {Pointer<Double>} pdblValue 
     * @returns {HRESULT} 
     */
    get_Value(pdblValue) {
        result := ComCall(3, this, "double*", pdblValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Color 
     * @returns {HRESULT} 
     */
    put_Color(Color) {
        result := ComCall(4, this, "uint", Color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pColor 
     * @returns {HRESULT} 
     */
    get_Color(pColor) {
        result := ComCall(5, this, "uint*", pColor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iWidth 
     * @returns {HRESULT} 
     */
    put_Width(iWidth) {
        result := ComCall(6, this, "int", iWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piValue 
     * @returns {HRESULT} 
     */
    get_Width(piValue) {
        result := ComCall(7, this, "int*", piValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iLineStyle 
     * @returns {HRESULT} 
     */
    put_LineStyle(iLineStyle) {
        result := ComCall(8, this, "int", iLineStyle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piValue 
     * @returns {HRESULT} 
     */
    get_LineStyle(piValue) {
        result := ComCall(9, this, "int*", piValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iScale 
     * @returns {HRESULT} 
     */
    put_ScaleFactor(iScale) {
        result := ComCall(10, this, "int", iScale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} piValue 
     * @returns {HRESULT} 
     */
    get_ScaleFactor(piValue) {
        result := ComCall(11, this, "int*", piValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrValue 
     * @returns {HRESULT} 
     */
    get_Path(pstrValue) {
        result := ComCall(12, this, "ptr", pstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} Value 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    GetValue(Value, Status) {
        result := ComCall(13, this, "double*", Value, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} Max 
     * @param {Pointer<Double>} Min 
     * @param {Pointer<Double>} Avg 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    GetStatistics(Max, Min, Avg, Status) {
        result := ComCall(14, this, "double*", Max, "double*", Min, "double*", Avg, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Selected(bState) {
        result := ComCall(15, this, "short", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_Selected(pbState) {
        result := ComCall(16, this, "ptr", pbState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Visible(bState) {
        result := ComCall(17, this, "short", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbState 
     * @returns {HRESULT} 
     */
    get_Visible(pbState) {
        result := ComCall(18, this, "ptr", pbState, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(19, this, "int", iIndex, "int", iWhich, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
