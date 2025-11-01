#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to security methods and information about the security call context of the current call.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-isecuritycallcontext
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISecurityCallContext extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityCallContext
     * @type {Guid}
     */
    static IID => Guid("{cafc823e-b441-11d1-b82b-0000f8757e2a}")

    /**
     * The class identifier for SecurityCallContext
     * @type {Guid}
     */
    static CLSID => Guid("{ecabb0a7-7f19-11d2-978e-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum", "IsCallerInRole", "IsSecurityEnabled", "IsUserInRole"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-get_count
     */
    get_Count(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-get_item
     */
    get_Item(name, pItem) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-get__newenum
     */
    get__NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @param {Pointer<VARIANT_BOOL>} pfInRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole, pfInRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(10, this, "ptr", bstrRole, "ptr", pfInRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled
     */
    IsSecurityEnabled(pfIsEnabled) {
        result := ComCall(11, this, "ptr", pfIsEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pUser 
     * @param {BSTR} bstrRole 
     * @param {Pointer<VARIANT_BOOL>} pfInRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-isuserinrole
     */
    IsUserInRole(pUser, bstrRole, pfInRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(12, this, "ptr", pUser, "ptr", bstrRole, "ptr", pfInRole, "HRESULT")
        return result
    }
}
