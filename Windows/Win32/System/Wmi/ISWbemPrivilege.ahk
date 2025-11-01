#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemPrivilege extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemPrivilege
     * @type {Guid}
     */
    static IID => Guid("{26ee67bd-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The class identifier for SWbemPrivilege
     * @type {Guid}
     */
    static CLSID => Guid("{26ee67bc-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "get_Name", "get_DisplayName", "get_Identifier"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} bIsEnabled 
     * @returns {HRESULT} 
     */
    get_IsEnabled(bIsEnabled) {
        result := ComCall(7, this, "ptr", bIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {HRESULT} 
     */
    put_IsEnabled(bIsEnabled) {
        result := ComCall(8, this, "short", bIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strDisplayName 
     * @returns {HRESULT} 
     */
    get_Name(strDisplayName) {
        result := ComCall(9, this, "ptr", strDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strDisplayName 
     * @returns {HRESULT} 
     */
    get_DisplayName(strDisplayName) {
        result := ComCall(10, this, "ptr", strDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iPrivilege 
     * @returns {HRESULT} 
     */
    get_Identifier(iPrivilege) {
        iPrivilegeMarshal := iPrivilege is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, iPrivilegeMarshal, iPrivilege, "HRESULT")
        return result
    }
}
