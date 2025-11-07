#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
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
        result := ComCall(3, this, "ptr*", &ppTrustee := 0, "HRESULT")
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

        result := ComCall(4, this, cObjectTypesMarshal, cObjectTypes, rgObjectTypesMarshal, rgObjectTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ObjectType 
     * @returns {Integer} 
     */
    GetPermissions(ObjectType) {
        result := ComCall(5, this, "ptr", ObjectType, "uint*", &pPermissions := 0, "HRESULT")
        return pPermissions
    }
}
