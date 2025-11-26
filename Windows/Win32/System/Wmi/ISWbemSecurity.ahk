#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISWbemPrivilegeSet.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemSecurity extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemSecurity
     * @type {Guid}
     */
    static IID => Guid("{b54d66e6-2287-11d2-8b33-00600806d9b6}")

    /**
     * The class identifier for SWbemSecurity
     * @type {Guid}
     */
    static CLSID => Guid("{b54d66e9-2287-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ImpersonationLevel", "put_ImpersonationLevel", "get_AuthenticationLevel", "put_AuthenticationLevel", "get_Privileges"]

    /**
     * @type {Integer} 
     */
    ImpersonationLevel {
        get => this.get_ImpersonationLevel()
        set => this.put_ImpersonationLevel(value)
    }

    /**
     * @type {Integer} 
     */
    AuthenticationLevel {
        get => this.get_AuthenticationLevel()
        set => this.put_AuthenticationLevel(value)
    }

    /**
     * @type {ISWbemPrivilegeSet} 
     */
    Privileges {
        get => this.get_Privileges()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ImpersonationLevel() {
        result := ComCall(7, this, "int*", &iImpersonationLevel := 0, "HRESULT")
        return iImpersonationLevel
    }

    /**
     * 
     * @param {Integer} iImpersonationLevel 
     * @returns {HRESULT} 
     */
    put_ImpersonationLevel(iImpersonationLevel) {
        result := ComCall(8, this, "int", iImpersonationLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationLevel() {
        result := ComCall(9, this, "int*", &iAuthenticationLevel := 0, "HRESULT")
        return iAuthenticationLevel
    }

    /**
     * 
     * @param {Integer} iAuthenticationLevel 
     * @returns {HRESULT} 
     */
    put_AuthenticationLevel(iAuthenticationLevel) {
        result := ComCall(10, this, "int", iAuthenticationLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISWbemPrivilegeSet} 
     */
    get_Privileges() {
        result := ComCall(11, this, "ptr*", &objWbemPrivilegeSet := 0, "HRESULT")
        return ISWbemPrivilegeSet(objWbemPrivilegeSet)
    }
}
