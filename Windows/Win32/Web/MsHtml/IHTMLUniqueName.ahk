#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLUniqueName extends IDispatch {
    /**
     * The interface identifier for IHTMLUniqueName
     * @type {Guid}
     */
    static IID := Guid("{3050f4d0-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLUniqueName interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_uniqueNumber : IntPtr
        get_uniqueID     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLUniqueName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    uniqueNumber {
        get => this.get_uniqueNumber()
    }

    /**
     * @type {BSTR} 
     */
    uniqueID {
        get => this.get_uniqueID()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_uniqueNumber() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_uniqueID() {
        p := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLUniqueName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_uniqueNumber := CallbackCreate(GetMethod(implObj, "get_uniqueNumber"), flags, 2)
        this.vtbl.get_uniqueID := CallbackCreate(GetMethod(implObj, "get_uniqueID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_uniqueNumber)
        CallbackFree(this.vtbl.get_uniqueID)
    }
}
