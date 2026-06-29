#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsNamespaces interface is implemented by the ADs provider and is used for managing namespace objects.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsnamespaces
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsNamespaces extends IADs {
    /**
     * The interface identifier for IADsNamespaces
     * @type {Guid}
     */
    static IID := Guid("{28b96ba0-b330-11cf-a9ad-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsNamespaces interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_DefaultContainer : IntPtr
        put_DefaultContainer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsNamespaces.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DefaultContainer {
        get => this.get_DefaultContainer()
        set => this.put_DefaultContainer(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DefaultContainer() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDefaultContainer 
     * @returns {HRESULT} 
     */
    put_DefaultContainer(bstrDefaultContainer) {
        bstrDefaultContainer := bstrDefaultContainer is String ? BSTR.Alloc(bstrDefaultContainer).Value : bstrDefaultContainer

        result := ComCall(21, this, BSTR, bstrDefaultContainer, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsNamespaces.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DefaultContainer := CallbackCreate(GetMethod(implObj, "get_DefaultContainer"), flags, 2)
        this.vtbl.put_DefaultContainer := CallbackCreate(GetMethod(implObj, "put_DefaultContainer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DefaultContainer)
        CallbackFree(this.vtbl.put_DefaultContainer)
    }
}
