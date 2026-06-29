#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaTypeInfo extends IDispatch {
    /**
     * The interface identifier for IMediaTypeInfo
     * @type {Guid}
     */
    static IID := Guid("{56a868bc-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaTypeInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type    : IntPtr
        get_Subtype : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaTypeInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {BSTR} 
     */
    Subtype {
        get => this.get_Subtype()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Type() {
        strType := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, strType, "HRESULT")
        return strType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Subtype() {
        strType := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, strType, "HRESULT")
        return strType
    }

    Query(iid) {
        if (IMediaTypeInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.get_Subtype := CallbackCreate(GetMethod(implObj, "get_Subtype"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.get_Subtype)
    }
}
