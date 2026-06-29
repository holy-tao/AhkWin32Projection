#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMDocumentFragment extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMDocumentFragment
     * @type {Guid}
     */
    static IID := Guid("{3efaa413-272f-11d2-836f-0000f87a7782}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMDocumentFragment interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMDocumentFragment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IXMLDOMDocumentFragment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
