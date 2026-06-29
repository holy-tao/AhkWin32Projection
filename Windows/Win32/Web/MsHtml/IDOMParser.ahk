#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IHTMLDocument2.ahk" { IHTMLDocument2 }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDOMParser extends IDispatch {
    /**
     * The interface identifier for IDOMParser
     * @type {Guid}
     */
    static IID := Guid("{30510781-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for DOMParser
     * @type {Guid}
     */
    static CLSID := Guid("{30510782-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDOMParser interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        parseFromString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDOMParser.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} xmlSource 
     * @param {BSTR} mimeType 
     * @returns {IHTMLDocument2} 
     */
    parseFromString(xmlSource, mimeType) {
        xmlSource := xmlSource is String ? BSTR.Alloc(xmlSource).Value : xmlSource
        mimeType := mimeType is String ? BSTR.Alloc(mimeType).Value : mimeType

        result := ComCall(7, this, BSTR, xmlSource, BSTR, mimeType, "ptr*", &ppNode := 0, "HRESULT")
        return IHTMLDocument2(ppNode)
    }

    Query(iid) {
        if (IDOMParser.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.parseFromString := CallbackCreate(GetMethod(implObj, "parseFromString"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.parseFromString)
    }
}
