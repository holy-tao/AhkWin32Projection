#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IADsBackLink interface provides methods for an ADSI client to access the Back Link attribute. You can call the property methods of this interface to obtain and modify the attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsbacklink
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsBackLink extends IDispatch {
    /**
     * The interface identifier for IADsBackLink
     * @type {Guid}
     */
    static IID := Guid("{fd1302bd-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsBackLink interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RemoteID   : IntPtr
        put_RemoteID   : IntPtr
        get_ObjectName : IntPtr
        put_ObjectName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsBackLink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    RemoteID {
        get => this.get_RemoteID()
        set => this.put_RemoteID(value)
    }

    /**
     * @type {BSTR} 
     */
    ObjectName {
        get => this.get_ObjectName()
        set => this.put_ObjectName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteID() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnRemoteID 
     * @returns {HRESULT} 
     */
    put_RemoteID(lnRemoteID) {
        result := ComCall(8, this, "int", lnRemoteID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ObjectName() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrObjectName 
     * @returns {HRESULT} 
     */
    put_ObjectName(bstrObjectName) {
        bstrObjectName := bstrObjectName is String ? BSTR.Alloc(bstrObjectName).Value : bstrObjectName

        result := ComCall(10, this, BSTR, bstrObjectName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsBackLink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RemoteID := CallbackCreate(GetMethod(implObj, "get_RemoteID"), flags, 2)
        this.vtbl.put_RemoteID := CallbackCreate(GetMethod(implObj, "put_RemoteID"), flags, 2)
        this.vtbl.get_ObjectName := CallbackCreate(GetMethod(implObj, "get_ObjectName"), flags, 2)
        this.vtbl.put_ObjectName := CallbackCreate(GetMethod(implObj, "put_ObjectName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RemoteID)
        CallbackFree(this.vtbl.put_RemoteID)
        CallbackFree(this.vtbl.get_ObjectName)
        CallbackFree(this.vtbl.put_ObjectName)
    }
}
