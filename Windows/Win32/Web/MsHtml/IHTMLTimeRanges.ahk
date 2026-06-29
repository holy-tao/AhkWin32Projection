#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLTimeRanges extends IDispatch {
    /**
     * The interface identifier for IHTMLTimeRanges
     * @type {Guid}
     */
    static IID := Guid("{30510705-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLTimeRanges
     * @type {Guid}
     */
    static CLSID := Guid("{3051070b-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLTimeRanges interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length : IntPtr
        start      : IntPtr
        end        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLTimeRanges.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Float} 
     */
    start(index) {
        result := ComCall(8, this, "int", index, "float*", &startTime := 0, "HRESULT")
        return startTime
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Float} 
     */
    end(index) {
        result := ComCall(9, this, "int", index, "float*", &endTime := 0, "HRESULT")
        return endTime
    }

    Query(iid) {
        if (IHTMLTimeRanges.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.start := CallbackCreate(GetMethod(implObj, "start"), flags, 3)
        this.vtbl.end := CallbackCreate(GetMethod(implObj, "end"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.start)
        CallbackFree(this.vtbl.end)
    }
}
