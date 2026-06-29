#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.HtmlHelp
 */
export default struct IStemSink extends IUnknown {
    /**
     * The interface identifier for IStemSink
     * @type {Guid}
     */
    static IID := Guid("{fe77c330-7f42-11ce-be57-00aa0051fe20}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStemSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PutAltWord : IntPtr
        PutWord    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStemSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwc 
     * @returns {HRESULT} 
     */
    PutAltWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(3, this, "ptr", pwcInBuf, "uint", cwc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwcInBuf 
     * @param {Integer} cwc 
     * @returns {HRESULT} 
     */
    PutWord(pwcInBuf, cwc) {
        pwcInBuf := pwcInBuf is String ? StrPtr(pwcInBuf) : pwcInBuf

        result := ComCall(4, this, "ptr", pwcInBuf, "uint", cwc, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStemSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PutAltWord := CallbackCreate(GetMethod(implObj, "PutAltWord"), flags, 3)
        this.vtbl.PutWord := CallbackCreate(GetMethod(implObj, "PutWord"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PutAltWord)
        CallbackFree(this.vtbl.PutWord)
    }
}
