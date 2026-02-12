#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables the access control editor to communicate with the caller of the CreateSecurityPage and EditSecurity functions.
 * @see https://learn.microsoft.com/windows/win32/api//content/aclui/nn-aclui-isecurityinformation
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISecurityInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733aa4-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentTrustee", "GetObjectTypes", "GetPermissions"]

    /**
     * 
     * @returns {Pointer<TRUSTEE_W>} 
     */
    GetCurrentTrustee() {
        result := ComCall(3, this, "ptr*", &ppTrustee := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppTrustee
    }

    /**
     * 
     * @param {Pointer<Integer>} cObjectTypes 
     * @param {Pointer<Pointer<Guid>>} rgObjectTypes 
     * @returns {HRESULT} 
     */
    GetObjectTypes(cObjectTypes, rgObjectTypes) {
        cObjectTypesMarshal := cObjectTypes is VarRef ? "uint*" : "ptr"
        rgObjectTypesMarshal := rgObjectTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, cObjectTypesMarshal, cObjectTypes, rgObjectTypesMarshal, rgObjectTypes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * GetPermissions Method (ADOX)
     * @param {Guid} ObjectType_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/getpermissions-method-adox
     */
    GetPermissions(ObjectType_) {
        result := ComCall(5, this, "ptr", ObjectType_, "uint*", &pPermissions := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pPermissions
    }
}
