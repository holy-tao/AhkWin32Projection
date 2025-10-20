#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemSecurity extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} iImpersonationLevel 
     * @returns {HRESULT} 
     */
    get_ImpersonationLevel(iImpersonationLevel) {
        result := ComCall(7, this, "int*", iImpersonationLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iImpersonationLevel 
     * @returns {HRESULT} 
     */
    put_ImpersonationLevel(iImpersonationLevel) {
        result := ComCall(8, this, "int", iImpersonationLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} iAuthenticationLevel 
     * @returns {HRESULT} 
     */
    get_AuthenticationLevel(iAuthenticationLevel) {
        result := ComCall(9, this, "int*", iAuthenticationLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iAuthenticationLevel 
     * @returns {HRESULT} 
     */
    put_AuthenticationLevel(iAuthenticationLevel) {
        result := ComCall(10, this, "int", iAuthenticationLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISWbemPrivilegeSet>} objWbemPrivilegeSet 
     * @returns {HRESULT} 
     */
    get_Privileges(objWbemPrivilegeSet) {
        result := ComCall(11, this, "ptr", objWbemPrivilegeSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
