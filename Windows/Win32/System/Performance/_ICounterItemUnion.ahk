#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SysmonDataType.ahk" { SysmonDataType }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Performance
 */
export default struct _ICounterItemUnion extends IUnknown {
    /**
     * The interface identifier for _ICounterItemUnion
     * @type {Guid}
     */
    static IID := Guid("{de1a6b74-9182-4c41-8e2c-24c2cd30ee83}")

    /**
     * The class identifier for _ICounterItemUnion
     * @type {Guid}
     */
    static CLSID := Guid("{de1a6b74-9182-4c41-8e2c-24c2cd30ee83}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for _ICounterItemUnion interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Value       : IntPtr
        put_Color       : IntPtr
        get_Color       : IntPtr
        put_Width       : IntPtr
        get_Width       : IntPtr
        put_LineStyle   : IntPtr
        get_LineStyle   : IntPtr
        put_ScaleFactor : IntPtr
        get_ScaleFactor : IntPtr
        get_Path        : IntPtr
        GetValue        : IntPtr
        GetStatistics   : IntPtr
        put_Selected    : IntPtr
        get_Selected    : IntPtr
        put_Visible     : IntPtr
        get_Visible     : IntPtr
        GetDataAt       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := _ICounterItemUnion.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {VARIANT_BOOL} 
     */
    Selected {
        get => this.get_Selected()
        set => this.put_Selected(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        result := ComCall(3, this, "double*", &pdblValue := 0, "HRESULT")
        return pdblValue
    }

    /**
     * 
     * @param {Integer} _Color 
     * @returns {HRESULT} 
     */
    put_Color(_Color) {
        result := ComCall(4, this, "uint", _Color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Color() {
        result := ComCall(5, this, "uint*", &pColor := 0, "HRESULT")
        return pColor
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
     * @returns {Integer} 
     */
    get_Width() {
        result := ComCall(7, this, "int*", &piValue := 0, "HRESULT")
        return piValue
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
     * @returns {Integer} 
     */
    get_LineStyle() {
        result := ComCall(9, this, "int*", &piValue := 0, "HRESULT")
        return piValue
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
     * @returns {Integer} 
     */
    get_ScaleFactor() {
        result := ComCall(11, this, "int*", &piValue := 0, "HRESULT")
        return piValue
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        pstrValue := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pstrValue, "HRESULT")
        return pstrValue
    }

    /**
     * 
     * @param {Pointer<Float>} Value 
     * @param {Pointer<Integer>} _Status 
     * @returns {HRESULT} 
     */
    GetValue(Value, _Status) {
        ValueMarshal := Value is VarRef ? "double*" : "ptr"
        _StatusMarshal := _Status is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, ValueMarshal, Value, _StatusMarshal, _Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} Max 
     * @param {Pointer<Float>} Min 
     * @param {Pointer<Float>} Avg 
     * @param {Pointer<Integer>} _Status 
     * @returns {HRESULT} 
     */
    GetStatistics(Max, Min, Avg, _Status) {
        MaxMarshal := Max is VarRef ? "double*" : "ptr"
        MinMarshal := Min is VarRef ? "double*" : "ptr"
        AvgMarshal := Avg is VarRef ? "double*" : "ptr"
        _StatusMarshal := _Status is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, MaxMarshal, Max, MinMarshal, Min, AvgMarshal, Avg, _StatusMarshal, _Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Selected(bState) {
        result := ComCall(15, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Selected() {
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {VARIANT_BOOL} bState 
     * @returns {HRESULT} 
     */
    put_Visible(bState) {
        result := ComCall(17, this, VARIANT_BOOL, bState, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Visible() {
        result := ComCall(18, this, VARIANT_BOOL.Ptr, &pbState := 0, "HRESULT")
        return pbState
    }

    /**
     * 
     * @param {Integer} iIndex 
     * @param {SysmonDataType} iWhich 
     * @returns {VARIANT} 
     */
    GetDataAt(iIndex, iWhich) {
        pVariant := VARIANT()
        result := ComCall(19, this, "int", iIndex, SysmonDataType, iWhich, VARIANT.Ptr, pVariant, "HRESULT")
        return pVariant
    }

    Query(iid) {
        if (_ICounterItemUnion.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
        this.vtbl.put_Color := CallbackCreate(GetMethod(implObj, "put_Color"), flags, 2)
        this.vtbl.get_Color := CallbackCreate(GetMethod(implObj, "get_Color"), flags, 2)
        this.vtbl.put_Width := CallbackCreate(GetMethod(implObj, "put_Width"), flags, 2)
        this.vtbl.get_Width := CallbackCreate(GetMethod(implObj, "get_Width"), flags, 2)
        this.vtbl.put_LineStyle := CallbackCreate(GetMethod(implObj, "put_LineStyle"), flags, 2)
        this.vtbl.get_LineStyle := CallbackCreate(GetMethod(implObj, "get_LineStyle"), flags, 2)
        this.vtbl.put_ScaleFactor := CallbackCreate(GetMethod(implObj, "put_ScaleFactor"), flags, 2)
        this.vtbl.get_ScaleFactor := CallbackCreate(GetMethod(implObj, "get_ScaleFactor"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
        this.vtbl.GetStatistics := CallbackCreate(GetMethod(implObj, "GetStatistics"), flags, 5)
        this.vtbl.put_Selected := CallbackCreate(GetMethod(implObj, "put_Selected"), flags, 2)
        this.vtbl.get_Selected := CallbackCreate(GetMethod(implObj, "get_Selected"), flags, 2)
        this.vtbl.put_Visible := CallbackCreate(GetMethod(implObj, "put_Visible"), flags, 2)
        this.vtbl.get_Visible := CallbackCreate(GetMethod(implObj, "get_Visible"), flags, 2)
        this.vtbl.GetDataAt := CallbackCreate(GetMethod(implObj, "GetDataAt"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Value)
        CallbackFree(this.vtbl.put_Color)
        CallbackFree(this.vtbl.get_Color)
        CallbackFree(this.vtbl.put_Width)
        CallbackFree(this.vtbl.get_Width)
        CallbackFree(this.vtbl.put_LineStyle)
        CallbackFree(this.vtbl.get_LineStyle)
        CallbackFree(this.vtbl.put_ScaleFactor)
        CallbackFree(this.vtbl.get_ScaleFactor)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.GetStatistics)
        CallbackFree(this.vtbl.put_Selected)
        CallbackFree(this.vtbl.get_Selected)
        CallbackFree(this.vtbl.put_Visible)
        CallbackFree(this.vtbl.get_Visible)
        CallbackFree(this.vtbl.GetDataAt)
    }
}
