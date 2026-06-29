#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISAXLocator extends IUnknown {
    /**
     * The interface identifier for ISAXLocator
     * @type {Guid}
     */
    static IID := Guid("{9b7e472a-0de4-4640-bff3-84d38a051c31}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISAXLocator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        getColumnNumber : IntPtr
        getLineNumber   : IntPtr
        getPublicId     : IntPtr
        getSystemId     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISAXLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    getColumnNumber() {
        result := ComCall(3, this, "int*", &pnColumn := 0, "HRESULT")
        return pnColumn
    }

    /**
     * 
     * @returns {Integer} 
     */
    getLineNumber() {
        result := ComCall(4, this, "int*", &pnLine := 0, "HRESULT")
        return pnLine
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getPublicId() {
        result := ComCall(5, this, "ptr*", &ppwchPublicId := 0, "HRESULT")
        return ppwchPublicId
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    getSystemId() {
        result := ComCall(6, this, "ptr*", &ppwchSystemId := 0, "HRESULT")
        return ppwchSystemId
    }

    Query(iid) {
        if (ISAXLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getColumnNumber := CallbackCreate(GetMethod(implObj, "getColumnNumber"), flags, 2)
        this.vtbl.getLineNumber := CallbackCreate(GetMethod(implObj, "getLineNumber"), flags, 2)
        this.vtbl.getPublicId := CallbackCreate(GetMethod(implObj, "getPublicId"), flags, 2)
        this.vtbl.getSystemId := CallbackCreate(GetMethod(implObj, "getSystemId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getColumnNumber)
        CallbackFree(this.vtbl.getLineNumber)
        CallbackFree(this.vtbl.getPublicId)
        CallbackFree(this.vtbl.getSystemId)
    }
}
