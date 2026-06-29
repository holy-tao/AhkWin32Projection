#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsResource interface is a dual interface that inherits from IADs. It is designed to manage an open resource for a file service across a network.
 * @remarks
 * When a remote user opens a folder or a subfolder on a public share point on the target computer, ADSI considers this folder to be an open resource and represents it with a resource object that implements this interface.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsresource
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsResource extends IADs {
    /**
     * The interface identifier for IADsResource
     * @type {Guid}
     */
    static IID := Guid("{34a05b20-4aab-11cf-ae2c-00aa006ebfb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsResource interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_User      : IntPtr
        get_UserPath  : IntPtr
        get_Path      : IntPtr
        get_LockCount : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsResource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    User {
        get => this.get_User()
    }

    /**
     * @type {BSTR} 
     */
    UserPath {
        get => this.get_UserPath()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {Integer} 
     */
    LockCount {
        get => this.get_LockCount()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_User() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserPath() {
        retval := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LockCount() {
        result := ComCall(23, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IADsResource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_User := CallbackCreate(GetMethod(implObj, "get_User"), flags, 2)
        this.vtbl.get_UserPath := CallbackCreate(GetMethod(implObj, "get_UserPath"), flags, 2)
        this.vtbl.get_Path := CallbackCreate(GetMethod(implObj, "get_Path"), flags, 2)
        this.vtbl.get_LockCount := CallbackCreate(GetMethod(implObj, "get_LockCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_User)
        CallbackFree(this.vtbl.get_UserPath)
        CallbackFree(this.vtbl.get_Path)
        CallbackFree(this.vtbl.get_LockCount)
    }
}
