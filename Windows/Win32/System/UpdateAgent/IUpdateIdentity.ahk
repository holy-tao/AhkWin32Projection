#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents the unique identifier of an update.
 * @remarks
 * You can create an instance of this interface by using the UpdateIdentity coclass.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdateidentity
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateIdentity extends IDispatch {
    /**
     * The interface identifier for IUpdateIdentity
     * @type {Guid}
     */
    static IID := Guid("{46297823-9940-4c09-aed9-cd3ea6d05968}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateIdentity interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RevisionNumber : IntPtr
        get_UpdateID       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateIdentity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    RevisionNumber {
        get => this.get_RevisionNumber()
    }

    /**
     * @type {BSTR} 
     */
    UpdateID {
        get => this.get_UpdateID()
    }

    /**
     * Gets the revision number of an update.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateidentity-get_revisionnumber
     */
    get_RevisionNumber() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the revision-independent identifier of an update.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateidentity-get_updateid
     */
    get_UpdateID() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateIdentity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RevisionNumber := CallbackCreate(GetMethod(implObj, "get_RevisionNumber"), flags, 2)
        this.vtbl.get_UpdateID := CallbackCreate(GetMethod(implObj, "get_UpdateID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RevisionNumber)
        CallbackFree(this.vtbl.get_UpdateID)
    }
}
