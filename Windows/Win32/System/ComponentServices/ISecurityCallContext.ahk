#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-get_item
     */
    get_Item(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pItem := VARIANT()
        result := ComCall(8, this, "ptr", name, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(10, this, "ptr", bstrRole, "short*", &pfInRole := 0, "HRESULT")
        return pfInRole
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(11, this, "short*", &pfIsEnabled := 0, "HRESULT")
        return pfIsEnabled
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pUser 
     * @param {BSTR} bstrRole 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-isecuritycallcontext-isuserinrole
     */
    IsUserInRole(pUser, bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(12, this, "ptr", pUser, "ptr", bstrRole, "short*", &pfInRole := 0, "HRESULT")
        return pfInRole
    }
}
