#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * @type {Integer} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * @type {Integer} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * @type {Integer} 
     */
    LineStyle {
        get => this.get_LineStyle()
        set => this.put_LineStyle(value)
    }

    /**
     * @type {Integer} 
     */
    ScaleFactor {
        get => this.get_ScaleFactor()
        set => this.put_ScaleFactor(value)
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        result := ComCall(3, this, "double*", &pdblValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdblValue
    }

    /**
     * 
     * @param {Integer} Color_ 
     * @returns {HRESULT} 
     */
    put_Color(Color_) {
        result := ComCall(4, this, "uint", Color_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Color() {
        result := ComCall(5, this, "uint*", &pColor := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pColor
    }

    /**
     * 
     * @param {Integer} iWidth 
     * @returns {HRESULT} 
     */
    put_Width(iWidth) {
        result := ComCall(6, this, "int", iWidth, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(7, this, "int*", &piValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piValue
    }

    /**
     * 
     * @param {Integer} iLineStyle 
     * @returns {HRESULT} 
     */
    put_LineStyle(iLineStyle) {
        result := ComCall(8, this, "int", iLineStyle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineStyle() {
        result := ComCall(9, this, "int*", &piValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piValue
    }

    /**
     * 
     * @param {Integer} iScale 
     * @returns {HRESULT} 
     */
    put_ScaleFactor(iScale) {
        result := ComCall(10, this, "int", iScale, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleFactor() {
        result := ComCall(11, this, "int*", &piValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return piValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pstrValue := BSTR()
        result := ComCall(12, this, "ptr", pstrValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstrValue
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetValueAndName
     * @param {Pointer<Float>} Value 
     * @param {Pointer<Integer>} Status_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecmetadata-getvalueandname
     */
    GetValue(Value, Status_) {
        ValueMarshal := Value is VarRef ? "double*" : "ptr"
        Status_Marshal := Status_ is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, ValueMarshal, Value, Status_Marshal, Status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Max 
     * @param {Pointer<Float>} Min 
     * @param {Pointer<Float>} Avg 
     * @param {Pointer<Integer>} Status_ 
     * @returns {HRESULT} 
     */
    GetStatistics(Max, Min, Avg, Status_) {
        MaxMarshal := Max is VarRef ? "double*" : "ptr"
        MinMarshal := Min is VarRef ? "double*" : "ptr"
        AvgMarshal := Avg is VarRef ? "double*" : "ptr"
        Status_Marshal := Status_ is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, MaxMarshal, Max, MinMarshal, Min, AvgMarshal, Avg, Status_Marshal, Status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
