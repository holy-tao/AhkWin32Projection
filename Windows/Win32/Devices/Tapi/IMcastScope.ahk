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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_scopeid
     */
    get_ScopeID() {
        result := ComCall(7, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_serverid
     */
    get_ServerID() {
        result := ComCall(8, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_interfaceid
     */
    get_InterfaceID() {
        result := ComCall(9, this, "int*", &pID := 0, "HRESULT")
        return pID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_scopedescription
     */
    get_ScopeDescription() {
        ppDescription := BSTR()
        result := ComCall(10, this, "ptr", ppDescription, "HRESULT")
        return ppDescription
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-imcastscope-get_ttl
     */
    get_TTL() {
        result := ComCall(11, this, "int*", &pTTL := 0, "HRESULT")
        return pTTL
    }
}
