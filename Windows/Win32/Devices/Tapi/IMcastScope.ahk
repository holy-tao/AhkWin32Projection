#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMcastScope interface is obtained by calling IMcastAddressAllocation::EnumerateScopes or IMcastAddressAllocation::get_Scopes.
 * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nn-mdhcp-imcastscope
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct IMcastScope extends IDispatch {
    /**
     * The interface identifier for IMcastScope
     * @type {Guid}
     */
    static IID := Guid("{df0daef4-a289-11d1-8697-006008b0e5d2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMcastScope interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ScopeID          : IntPtr
        get_ServerID         : IntPtr
        get_InterfaceID      : IntPtr
        get_ScopeDescription : IntPtr
        get_TTL              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMcastScope.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    ScopeID {
        get => this.get_ScopeID()
    }

    /**
     * @type {Integer} 
     */
    ServerID {
        get => this.get_ServerID()
    }

    /**
     * @type {Integer} 
     */
    InterfaceID {
        get => this.get_InterfaceID()
    }

    /**
     * @type {BSTR} 
     */
    ScopeDescription {
        get => this.get_ScopeDescription()
    }

    /**
     * @type {Integer} 
     */
    TTL {
        get => this.get_TTL()
    }

    /**
     * The get_ScopeID method obtains an identifier for the scope of multicast addresses.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the scope ID of this scope, which is the ID that was assigned to this scope when it was configured on the multicast server.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_scopeid
     */
    get_ScopeID() {
        result := ComCall(7, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * The get_ServerID method obtains the server ID associated with this scope.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the server ID of this scope, which is the ID that was assigned to the multicast address allocation server that published this scope at the time that the server was configured.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_serverid
     */
    get_ServerID() {
        result := ComCall(8, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * The get_InterfaceID method obtains an interface identifier of this scope, which identifies the interface on which the server that published this scope resides. This is normally the network address of the interface.
     * @remarks
     * The InterfaceID is provided for informational purposes only; it is not required as input to any of the methods in these interfaces. However, it may factor into the application's (or the user's) decision as to which scope to use when requesting an address. This is because, in a multihomed scenario, using a multicast address on one network that was obtained from a server on another network may cause address conflicts.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the server ID of this scope, which is the ID that was assigned to the multicast address allocation server that published this scope at the time that the server was configured.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_interfaceid
     */
    get_InterfaceID() {
        result := ComCall(9, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * The get_ScopeDescription method obtains a textual description associated with this scope. The description is used only for clarifying the purpose or meaning of a scope and is not needed for any subsequent calls.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDescription</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive a description of this scope. The description was established when this scope was configured on the multicast server.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_scopedescription
     */
    get_ScopeDescription() {
        ppDescription := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, ppDescription, "HRESULT")
        return ppDescription
    }

    /**
     * The get_TTL method obtains the time to live value for the multicast scope.
     * @returns {Integer} Pointer to a time to live value for multicast scope.
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_ttl
     */
    get_TTL() {
        result := ComCall(11, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }

    Query(iid) {
        if (IMcastScope.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ScopeID := CallbackCreate(GetMethod(implObj, "get_ScopeID"), flags, 2)
        this.vtbl.get_ServerID := CallbackCreate(GetMethod(implObj, "get_ServerID"), flags, 2)
        this.vtbl.get_InterfaceID := CallbackCreate(GetMethod(implObj, "get_InterfaceID"), flags, 2)
        this.vtbl.get_ScopeDescription := CallbackCreate(GetMethod(implObj, "get_ScopeDescription"), flags, 2)
        this.vtbl.get_TTL := CallbackCreate(GetMethod(implObj, "get_TTL"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ScopeID)
        CallbackFree(this.vtbl.get_ServerID)
        CallbackFree(this.vtbl.get_InterfaceID)
        CallbackFree(this.vtbl.get_ScopeDescription)
        CallbackFree(this.vtbl.get_TTL)
    }
}
