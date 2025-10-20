#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISecurityInfo extends IUnknown{
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
     * 
     * @param {Pointer<TRUSTEE_W>} ppTrustee 
     * @returns {HRESULT} 
     */
    GetCurrentTrustee(ppTrustee) {
        result := ComCall(3, this, "ptr", ppTrustee, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} cObjectTypes 
     * @param {Pointer<Guid>} rgObjectTypes 
     * @returns {HRESULT} 
     */
    GetObjectTypes(cObjectTypes, rgObjectTypes) {
        result := ComCall(4, this, "uint*", cObjectTypes, "ptr", rgObjectTypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ObjectType 
     * @param {Pointer<UInt32>} pPermissions 
     * @returns {HRESULT} 
     */
    GetPermissions(ObjectType, pPermissions) {
        result := ComCall(5, this, "ptr", ObjectType, "uint*", pPermissions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
