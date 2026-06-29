#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLScreen2 extends IDispatch {
    /**
     * The interface identifier for IHTMLScreen2
     * @type {Guid}
     */
    static IID := Guid("{3050f84a-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLScreen2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_logicalXDPI : IntPtr
        get_logicalYDPI : IntPtr
        get_deviceXDPI  : IntPtr
        get_deviceYDPI  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLScreen2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    logicalXDPI {
        get => this.get_logicalXDPI()
    }

    /**
     * @type {Integer} 
     */
    logicalYDPI {
        get => this.get_logicalYDPI()
    }

    /**
     * @type {Integer} 
     */
    deviceXDPI {
        get => this.get_deviceXDPI()
    }

    /**
     * @type {Integer} 
     */
    deviceYDPI {
        get => this.get_deviceYDPI()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_logicalXDPI() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_logicalYDPI() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deviceXDPI() {
        result := ComCall(9, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_deviceYDPI() {
        result := ComCall(10, this, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLScreen2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_logicalXDPI := CallbackCreate(GetMethod(implObj, "get_logicalXDPI"), flags, 2)
        this.vtbl.get_logicalYDPI := CallbackCreate(GetMethod(implObj, "get_logicalYDPI"), flags, 2)
        this.vtbl.get_deviceXDPI := CallbackCreate(GetMethod(implObj, "get_deviceXDPI"), flags, 2)
        this.vtbl.get_deviceYDPI := CallbackCreate(GetMethod(implObj, "get_deviceYDPI"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_logicalXDPI)
        CallbackFree(this.vtbl.get_logicalYDPI)
        CallbackFree(this.vtbl.get_deviceXDPI)
        CallbackFree(this.vtbl.get_deviceYDPI)
    }
}
