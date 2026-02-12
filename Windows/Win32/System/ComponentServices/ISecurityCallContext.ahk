#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to security methods and information about the security call context of the current call.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-isecuritycallcontext
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
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecuritycallcontext-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCount
    }

    /**
     * Retrieves a specified property in the security call context collection.
     * @remarks
     * The security call context collection represents a security call context, which provides information about the callers in the chain of calls ending with the current call. For each item in the security call context collection, the following table provides a description, the index name used to retrieve it, and the returned data type of the item.
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * <th>Index name</th>
     * <th>Returned type</th>
     * </tr>
     * <tr>
     * <td>Direct Caller
     * </td>
     * <td>The immediate caller of the object.</td>
     * <td>"DirectCaller"
     * </td>
     * <td>A <a href="https://docs.microsoft.com/windows/desktop/cossdk/securityidentity">SecurityIdentity</a> object
     * </td>
     * </tr>
     * <tr>
     * <td>Original Caller
     * </td>
     * <td>The caller that originated the chain of calls to the object.</td>
     * <td>"OriginalCaller"
     * </td>
     * <td>A <a href="https://docs.microsoft.com/windows/desktop/cossdk/securityidentity">SecurityIdentity</a> object
     * </td>
     * </tr>
     * <tr>
     * <td>Minimum Authentication Level
     * </td>
     * <td>The lowest authentication level used in the chain of calls.</td>
     * <td>"MinAuthenticationLevel"
     * </td>
     * <td>A <b>Long</b></td>
     * </tr>
     * <tr>
     * <td>Number of Callers
     * </td>
     * <td>The number of callers in the chain of calls to the object.</td>
     * <td>"NumCallers"
     * </td>
     * <td>A <b>Long</b></td>
     * </tr>
     * <tr>
     * <td>Callers
     * </td>
     * <td>The callers in the chain of calls that ends with the current call.</td>
     * <td>"Callers"</td>
     * <td>A <a href="https://docs.microsoft.com/windows/desktop/cossdk/securitycallers">SecurityCallers</a> object
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} name The name of the property item to be retrieved. See Remarks for information about the available items.
     * @returns {VARIANT} A reference to the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecuritycallcontext-get_item
     */
    get_Item(name) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        pItem := VARIANT()
        result := ComCall(8, this, "ptr", name, "ptr", pItem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pItem
    }

    /**
     * Retrieves an enumerator for the security call context collection.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecuritycallcontext-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppEnum)
    }

    /**
     * Determines whether the direct caller is in the specified role.
     * @remarks
     * Use this method to limit access to sections of code that should not be executed unless the caller is a member of the specified role. Windows groups and users are assigned to an application's roles using the Component Services administration tool. For more information about roles, see <a href="https://docs.microsoft.com/windows/desktop/cossdk/role-based-security-administration">Role-Based Security</a>.
     * 
     * <b>IsCallerInRole</b> only applies to the direct caller of the currently executing method. <b>IsCallerInRole</b> does not apply to any other caller in the call sequence from which the current method was called. However, you can obtain information about other callers in the sequence by using the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-get_item">get_Item</a> property method to get the Callers property of the security call context object.
     * 
     * Because <b>IsCallerInRole</b> is <b>TRUE</b> when role-based security is not enabled, it is a good idea to call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled">IsSecurityEnabled</a> before calling <b>IsCallerInRole</b> to ensure that <b>IsCallerInRole</b> returns useful information.
     * @param {BSTR} bstrRole The name of the role.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the caller is in the specified role; <b>FALSE</b> if not. If the specified role is not defined for the application, <b>FALSE</b> is returned. This parameter is set to <b>TRUE</b> if role-based security is not enabled.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole
     */
    IsCallerInRole(bstrRole) {
        if(bstrRole is String) {
            pin := BSTR.Alloc(bstrRole)
            bstrRole := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrRole, "short*", &pfInRole := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfInRole
    }

    /**
     * Determines whether security is enabled for the object.
     * @remarks
     * COM+ applications can use one of two types of security: role-based security or process access permissions. If role-based security is being used by the application but is currently disabled, either at the application or component level, <i>pfIsEnabled</i> is  <b>FALSE</b>. Similarly, if the COM+ application uses process access permissions instead of role-based security, <i>pfIsEnabled</i> is <b>FALSE</b>.
     * 
     * You can use this method to find out whether role-based security is enabled before you check role membership using <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-iscallerinrole">IsCallerInRole</a>. The reason for doing this is that <b>IsCallerInRole</b> is <b>TRUE</b> when role-based security is not enabled.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the application uses role-based security and role checking is currently enabled for the object; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled
     */
    IsSecurityEnabled() {
        result := ComCall(11, this, "short*", &pfIsEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfIsEnabled
    }

    /**
     * Determines whether the specified user is in the specified role.
     * @remarks
     * Use this method to limit access to sections of code that should not be executed unless the caller is a member of the specified role. Windows groups and users are assigned to an application's roles using the Component Services administration tool. For more information about roles, see <a href="https://docs.microsoft.com/windows/desktop/cossdk/role-based-security-administration">Role-Based Security</a>.
     * 
     * Because <b>IsUserInRole</b> is <b>TRUE</b> when role-based security is not enabled, it is a good idea to call <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-isecuritycallcontext-issecurityenabled">IsSecurityEnabled</a> before calling <b>IsUserInRole</b> to ensure that <b>IsUserInRole</b> returns useful information.
     * @param {Pointer<VARIANT>} pUser A pointer to value holding the User ID of the user whose role membership is to be checked. If you intend to pass the security identifier (SID) to <b>IsUserInRole</b>, this parameter should meet the following requirements: <c>V_VT(pUser) == (VT_ARRAY|VT_UI1) &amp;&amp; V_ARRAY(pUser)-&gt;cDims == 1</c>.
     * @param {BSTR} bstrRole The name of the role.
     * @returns {VARIANT_BOOL} <b>TRUE</b> if the user is in the specified role; <b>FALSE</b> if not. If the specified role is not defined for the application, <b>FALSE</b> is returned. This parameter is set to <b>TRUE</b> if role-based security is not enabled.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecuritycallcontext-isuserinrole
     */
    IsUserInRole(pUser, bstrRole) {
        if(bstrRole is String) {
            pin := BSTR.Alloc(bstrRole)
            bstrRole := pin.Value
        }

        result := ComCall(12, this, "ptr", pUser, "ptr", bstrRole, "short*", &pfInRole := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfInRole
    }
}
