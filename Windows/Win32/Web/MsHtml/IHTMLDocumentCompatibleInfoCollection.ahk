#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDocumentCompatibleInfo.ahk" { IHTMLDocumentCompatibleInfo }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLDocumentCompatibleInfoCollection extends IDispatch {
    /**
     * The interface identifier for IHTMLDocumentCompatibleInfoCollection
     * @type {Guid}
     */
    static IID := Guid("{30510418-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLDocumentCompatibleInfoCollection
     * @type {Guid}
     */
    static CLSID := Guid("{30510419-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLDocumentCompatibleInfoCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length : IntPtr
        item       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLDocumentCompatibleInfoCollection.Vtbl()
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
     * @returns {IHTMLDocumentCompatibleInfo} 
     */
    item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &compatibleInfo := 0, "HRESULT")
        return IHTMLDocumentCompatibleInfo(compatibleInfo)
    }

    Query(iid) {
        if (IHTMLDocumentCompatibleInfoCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.item)
    }
}
