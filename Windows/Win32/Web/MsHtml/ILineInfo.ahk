#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ILineInfo extends IUnknown {
    /**
     * The interface identifier for ILineInfo
     * @type {Guid}
     */
    static IID := Guid("{3050f7e2-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILineInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_x             : IntPtr
        get_baseLine      : IntPtr
        get_textDescent   : IntPtr
        get_textHeight    : IntPtr
        get_lineDirection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILineInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    x {
        get => this.get_x()
    }

    /**
     * @type {Integer} 
     */
    baseLine {
        get => this.get_baseLine()
    }

    /**
     * @type {Integer} 
     */
    textDescent {
        get => this.get_textDescent()
    }

    /**
     * @type {Integer} 
     */
    textHeight {
        get => this.get_textHeight()
    }

    /**
     * @type {Integer} 
     */
    lineDirection {
        get => this.get_lineDirection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_x() {
        result := ComCall(3, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_baseLine() {
        result := ComCall(4, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_textDescent() {
        result := ComCall(5, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_textHeight() {
        result := ComCall(6, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_lineDirection() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (ILineInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_x := CallbackCreate(GetMethod(implObj, "get_x"), flags, 2)
        this.vtbl.get_baseLine := CallbackCreate(GetMethod(implObj, "get_baseLine"), flags, 2)
        this.vtbl.get_textDescent := CallbackCreate(GetMethod(implObj, "get_textDescent"), flags, 2)
        this.vtbl.get_textHeight := CallbackCreate(GetMethod(implObj, "get_textHeight"), flags, 2)
        this.vtbl.get_lineDirection := CallbackCreate(GetMethod(implObj, "get_lineDirection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_x)
        CallbackFree(this.vtbl.get_baseLine)
        CallbackFree(this.vtbl.get_textDescent)
        CallbackFree(this.vtbl.get_textHeight)
        CallbackFree(this.vtbl.get_lineDirection)
    }
}
