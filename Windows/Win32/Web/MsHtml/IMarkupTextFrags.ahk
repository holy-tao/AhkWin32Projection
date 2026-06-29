#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMarkupPointer.ahk" { IMarkupPointer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IMarkupTextFrags extends IUnknown {
    /**
     * The interface identifier for IMarkupTextFrags
     * @type {Guid}
     */
    static IID := Guid("{3050f5fa-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMarkupTextFrags interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTextFragCount              : IntPtr
        GetTextFrag                   : IntPtr
        RemoveTextFrag                : IntPtr
        InsertTextFrag                : IntPtr
        FindTextFragFromMarkupPointer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMarkupTextFrags.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTextFragCount() {
        result := ComCall(3, this, "int*", &pcFrags := 0, "HRESULT")
        return pcFrags
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @param {IMarkupPointer} pPointerFrag 
     * @returns {BSTR} 
     */
    GetTextFrag(iFrag, pPointerFrag) {
        pbstrFrag := BSTR.Owned()
        result := ComCall(4, this, "int", iFrag, BSTR.Ptr, pbstrFrag, "ptr", pPointerFrag, "HRESULT")
        return pbstrFrag
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @returns {HRESULT} 
     */
    RemoveTextFrag(iFrag) {
        result := ComCall(5, this, "int", iFrag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iFrag 
     * @param {BSTR} bstrInsert 
     * @param {IMarkupPointer} pPointerInsert 
     * @returns {HRESULT} 
     */
    InsertTextFrag(iFrag, bstrInsert, pPointerInsert) {
        bstrInsert := bstrInsert is String ? BSTR.Alloc(bstrInsert).Value : bstrInsert

        result := ComCall(6, this, "int", iFrag, BSTR, bstrInsert, "ptr", pPointerInsert, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMarkupPointer} pPointerFind 
     * @param {Pointer<Integer>} piFrag 
     * @param {Pointer<BOOL>} pfFragFound 
     * @returns {HRESULT} 
     */
    FindTextFragFromMarkupPointer(pPointerFind, piFrag, pfFragFound) {
        piFragMarshal := piFrag is VarRef ? "int*" : "ptr"
        pfFragFoundMarshal := pfFragFound is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pPointerFind, piFragMarshal, piFrag, pfFragFoundMarshal, pfFragFound, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMarkupTextFrags.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTextFragCount := CallbackCreate(GetMethod(implObj, "GetTextFragCount"), flags, 2)
        this.vtbl.GetTextFrag := CallbackCreate(GetMethod(implObj, "GetTextFrag"), flags, 4)
        this.vtbl.RemoveTextFrag := CallbackCreate(GetMethod(implObj, "RemoveTextFrag"), flags, 2)
        this.vtbl.InsertTextFrag := CallbackCreate(GetMethod(implObj, "InsertTextFrag"), flags, 4)
        this.vtbl.FindTextFragFromMarkupPointer := CallbackCreate(GetMethod(implObj, "FindTextFragFromMarkupPointer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTextFragCount)
        CallbackFree(this.vtbl.GetTextFrag)
        CallbackFree(this.vtbl.RemoveTextFrag)
        CallbackFree(this.vtbl.InsertTextFrag)
        CallbackFree(this.vtbl.FindTextFragFromMarkupPointer)
    }
}
