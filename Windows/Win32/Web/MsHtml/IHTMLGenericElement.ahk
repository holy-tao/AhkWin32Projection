#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLGenericElement extends IDispatch {
    /**
     * The interface identifier for IHTMLGenericElement
     * @type {Guid}
     */
    static IID := Guid("{3050f4b7-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLGenericElement
     * @type {Guid}
     */
    static CLSID := Guid("{3050f4b8-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLGenericElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_recordset  : IntPtr
        namedRecordset : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLGenericElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    recordset {
        get => this.get_recordset()
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_recordset() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IDispatch(p)
    }

    /**
     * 
     * @param {BSTR} dataMember 
     * @param {Pointer<VARIANT>} hierarchy 
     * @returns {IDispatch} 
     */
    namedRecordset(dataMember, hierarchy) {
        dataMember := dataMember is String ? BSTR.Alloc(dataMember).Value : dataMember

        result := ComCall(8, this, BSTR, dataMember, VARIANT.Ptr, hierarchy, "ptr*", &ppRecordset := 0, "HRESULT")
        return IDispatch(ppRecordset)
    }

    Query(iid) {
        if (IHTMLGenericElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_recordset := CallbackCreate(GetMethod(implObj, "get_recordset"), flags, 2)
        this.vtbl.namedRecordset := CallbackCreate(GetMethod(implObj, "namedRecordset"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_recordset)
        CallbackFree(this.vtbl.namedRecordset)
    }
}
