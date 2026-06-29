#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLDOMNode.ahk" { IHTMLDOMNode }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMXmlSerializer extends IDispatch {
    /**
     * The interface identifier for IDOMXmlSerializer
     * @type {Guid}
     */
    static IID := Guid("{3051077d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMXmlSerializer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        serializeToString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMXmlSerializer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IHTMLDOMNode} pNode 
     * @returns {BSTR} 
     */
    serializeToString(pNode) {
        pString := BSTR.Owned()
        result := ComCall(7, this, "ptr", pNode, BSTR.Ptr, pString, "HRESULT")
        return pString
    }

    Query(iid) {
        if (IDOMXmlSerializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.serializeToString := CallbackCreate(GetMethod(implObj, "serializeToString"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.serializeToString)
    }
}
