#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IMcastScope interface is obtained by calling IMcastAddressAllocation::EnumerateScopes or IMcastAddressAllocation::get_Scopes.
 * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nn-mdhcp-imcastscope
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IMcastScope extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMcastScope
     * @type {Guid}
     */
    static IID => Guid("{df0daef4-a289-11d1-8697-006008b0e5d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ScopeID", "get_ServerID", "get_InterfaceID", "get_ScopeDescription", "get_TTL"]

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
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastscope-get_scopeid
     */
    get_ScopeID() {
        result := ComCall(7, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * The get_ServerID method obtains the server ID associated with this scope.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the server ID of this scope, which is the ID that was assigned to the multicast address allocation server that published this scope at the time that the server was configured.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastscope-get_serverid
     */
    get_ServerID() {
        result := ComCall(8, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * The get_InterfaceID method obtains an interface identifier of this scope, which identifies the interface on which the server that published this scope resides. This is normally the network address of the interface.
     * @returns {Integer} Pointer to a <b>LONG</b> that will receive the server ID of this scope, which is the ID that was assigned to the multicast address allocation server that published this scope at the time that the server was configured.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastscope-get_interfaceid
     */
    get_InterfaceID() {
        result := ComCall(9, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * The get_ScopeDescription method obtains a textual description associated with this scope. The description is used only for clarifying the purpose or meaning of a scope and is not needed for any subsequent calls.
     * @returns {BSTR} Pointer to a <b>BSTR</b> that will receive a description of this scope. The description was established when this scope was configured on the multicast server.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastscope-get_scopedescription
     */
    get_ScopeDescription() {
        ppDescription := BSTR()
        result := ComCall(10, this, "ptr", ppDescription, "HRESULT")
        return ppDescription
    }

    /**
     * The get_TTL method obtains the time to live value for the multicast scope.
     * @returns {Integer} Pointer to a time to live value for multicast scope.
     * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nf-mdhcp-imcastscope-get_ttl
     */
    get_TTL() {
        result := ComCall(11, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }
}
