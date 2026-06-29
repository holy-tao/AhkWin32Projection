#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISAXXMLReader.ahk" { ISAXXMLReader }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXXMLFilter extends ISAXXMLReader {
    /**
     * The interface identifier for ISAXXMLFilter
     * @type {Guid}
     */
    static IID := Guid("{70409222-ca09-4475-acb8-40312fe8d145}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXXMLFilter interfaces
    */
    struct Vtbl extends ISAXXMLReader.Vtbl {
        getParent : IntPtr
        putParent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXXMLFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {ISAXXMLReader} 
     */
    getParent() {
        result := ComCall(21, this, "ptr*", &ppReader := 0, "HRESULT")
        return ISAXXMLReader(ppReader)
    }

    /**
     * 
     * @param {ISAXXMLReader} pReader 
     * @returns {HRESULT} 
     */
    putParent(pReader) {
        result := ComCall(22, this, "ptr", pReader, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISAXXMLFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getParent := CallbackCreate(GetMethod(implObj, "getParent"), flags, 2)
        this.vtbl.putParent := CallbackCreate(GetMethod(implObj, "putParent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getParent)
        CallbackFree(this.vtbl.putParent)
    }
}
