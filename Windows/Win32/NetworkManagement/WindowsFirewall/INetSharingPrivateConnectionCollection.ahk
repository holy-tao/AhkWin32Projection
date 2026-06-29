#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The INetSharingPrivateConnectionCollection interface makes it possible for scripting languages such as VBScript and JScript to enumerate private connections.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/nn-netcon-inetsharingprivateconnectioncollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetSharingPrivateConnectionCollection extends IDispatch {
    /**
     * The interface identifier for INetSharingPrivateConnectionCollection
     * @type {Guid}
     */
    static IID := Guid("{38ae69e0-4409-402a-a2cb-e965c727f840}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetSharingPrivateConnectionCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Count    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetSharingPrivateConnectionCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The get__NewEnum method retrieves an enumerator for the private connections collection.
     * @returns {IUnknown} Pointer to an interface pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingprivateconnectioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * The get__Count method retrieves the number of items in the private connections collection.
     * @returns {Integer} Pointer to a <b>long</b> variable that receives the number of items in the private connections collection.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingprivateconnectioncollection-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (INetSharingPrivateConnectionCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Count)
    }
}
