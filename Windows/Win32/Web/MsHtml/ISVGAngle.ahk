#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ISVGAngle extends IDispatch {
    /**
     * The interface identifier for ISVGAngle
     * @type {Guid}
     */
    static IID := Guid("{305104d3-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for SVGAngle
     * @type {Guid}
     */
    static CLSID := Guid("{30510584-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISVGAngle interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_unitType              : IntPtr
        get_unitType              : IntPtr
        put_value                 : IntPtr
        get_value                 : IntPtr
        put_valueInSpecifiedUnits : IntPtr
        get_valueInSpecifiedUnits : IntPtr
        put_valueAsString         : IntPtr
        get_valueAsString         : IntPtr
        newValueSpecifiedUnits    : IntPtr
        convertToSpecifiedUnits   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISVGAngle.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    unitType {
        get => this.get_unitType()
        set => this.put_unitType(value)
    }

    /**
     * @type {Float} 
     */
    value {
        get => this.get_value()
        set => this.put_value(value)
    }

    /**
     * @type {Float} 
     */
    valueInSpecifiedUnits {
        get => this.get_valueInSpecifiedUnits()
        set => this.put_valueInSpecifiedUnits(value)
    }

    /**
     * @type {BSTR} 
     */
    valueAsString {
        get => this.get_valueAsString()
        set => this.put_valueAsString(value)
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_unitType(v) {
        result := ComCall(7, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_unitType() {
        result := ComCall(8, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_value(v) {
        result := ComCall(9, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_value() {
        result := ComCall(10, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Float} v 
     * @returns {HRESULT} 
     */
    put_valueInSpecifiedUnits(v) {
        result := ComCall(11, this, "float", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_valueInSpecifiedUnits() {
        result := ComCall(12, this, "float*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_valueAsString(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_valueAsString() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} unitType 
     * @param {Float} valueInSpecifiedUnits 
     * @returns {HRESULT} 
     */
    newValueSpecifiedUnits(unitType, valueInSpecifiedUnits) {
        result := ComCall(15, this, "short", unitType, "float", valueInSpecifiedUnits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} unitType 
     * @returns {HRESULT} 
     */
    convertToSpecifiedUnits(unitType) {
        result := ComCall(16, this, "short", unitType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISVGAngle.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_unitType := CallbackCreate(GetMethod(implObj, "put_unitType"), flags, 2)
        this.vtbl.get_unitType := CallbackCreate(GetMethod(implObj, "get_unitType"), flags, 2)
        this.vtbl.put_value := CallbackCreate(GetMethod(implObj, "put_value"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
        this.vtbl.put_valueInSpecifiedUnits := CallbackCreate(GetMethod(implObj, "put_valueInSpecifiedUnits"), flags, 2)
        this.vtbl.get_valueInSpecifiedUnits := CallbackCreate(GetMethod(implObj, "get_valueInSpecifiedUnits"), flags, 2)
        this.vtbl.put_valueAsString := CallbackCreate(GetMethod(implObj, "put_valueAsString"), flags, 2)
        this.vtbl.get_valueAsString := CallbackCreate(GetMethod(implObj, "get_valueAsString"), flags, 2)
        this.vtbl.newValueSpecifiedUnits := CallbackCreate(GetMethod(implObj, "newValueSpecifiedUnits"), flags, 3)
        this.vtbl.convertToSpecifiedUnits := CallbackCreate(GetMethod(implObj, "convertToSpecifiedUnits"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_unitType)
        CallbackFree(this.vtbl.get_unitType)
        CallbackFree(this.vtbl.put_value)
        CallbackFree(this.vtbl.get_value)
        CallbackFree(this.vtbl.put_valueInSpecifiedUnits)
        CallbackFree(this.vtbl.get_valueInSpecifiedUnits)
        CallbackFree(this.vtbl.put_valueAsString)
        CallbackFree(this.vtbl.get_valueAsString)
        CallbackFree(this.vtbl.newValueSpecifiedUnits)
        CallbackFree(this.vtbl.convertToSpecifiedUnits)
    }
}
