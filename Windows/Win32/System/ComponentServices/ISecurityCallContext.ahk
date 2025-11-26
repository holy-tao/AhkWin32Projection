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
     * Retrieves the number of properties in the security context collection.
     * @returns {Integer} The number of named security call context properties.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecuritycallcontext-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Retrieves a specified property in the security call context collection.
     * @param {BSTR} name The name of the property item to be retrieved. See Remarks for information about the available items.
     * @returns {VARIANT} A reference to the retrieved property.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecuritycallcontext-get_item
     */
    get_Item(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        pItem := VARIANT()
        result := ComCall(8, this, "ptr", name, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * Retrieves an enumerator for the security call context collection.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecuritycallcontext-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IUnknown(ppEnum)
    }

    /**
     * Determines whether the direct caller is in the specified role.
     * @param {BSTR} bstrRole The name of the role.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the caller is in the specified role; <b>FALSE</b> if not. If the specified role is not defined for the application, <b>FALSE</b> is returned. This parameter is set to <b>TRUE</b> if role-based security is not enabled.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(10, this, "ptr", bstrRole, "short*", &pfInRole := 0, "HRESULT")
        return pfInRole
    }

    /**
     * Determines whether security is enabled for the object.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the application uses role-based security and role checking is currently enabled for the object; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(11, this, "short*", &pfIsEnabled := 0, "HRESULT")
        return pfIsEnabled
    }

    /**
     * Determines whether the specified user is in the specified role.
     * @param {Pointer<VARIANT>} pUser A pointer to value holding the User ID of the user whose role membership is to be checked. If you intend to pass the security identifier (SID) to <b>IsUserInRole</b>, this parameter should meet the following requirements: <c>V_VT(pUser) == (VT_ARRAY|VT_UI1) &amp;&amp; V_ARRAY(pUser)-&gt;cDims == 1</c>.
     * @param {BSTR} bstrRole The name of the role.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the user is in the specified role; <b>FALSE</b> if not. If the specified role is not defined for the application, <b>FALSE</b> is returned. This parameter is set to <b>TRUE</b> if role-based security is not enabled.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-isecuritycallcontext-isuserinrole
     */
    IsUserInRole(pUser, bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(12, this, "ptr", pUser, "ptr", bstrRole, "short*", &pfInRole := 0, "HRESULT")
        return pfInRole
    }
}
