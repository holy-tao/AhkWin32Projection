#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to a collection of security information representing a caller's identity. The items available in this collection are the SID, the account name, the authentication service, the authentication level, and the impersonation level.
 * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nn-comsvcs-isecurityidentitycoll
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class ISecurityIdentityColl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityIdentityColl
     * @type {Guid}
     */
    static IID => Guid("{cafc823c-b441-11d1-b82b-0000f8757e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

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
     * Retrieves the number of properties in the security identity collection.
     * @returns {Integer} The number of properties in the security identity collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecurityidentitycoll-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &plCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plCount
    }

    /**
     * Retrieves a specified property in the security identity collection.
     * @remarks
     * This collection represents a security identity, which provides information about a particular caller in the chain of calls ending with the current call. For each item in the security identity collection, the following table provides a description, the index name used to retrieve it, and the returned data type of the item.
     * 
     * <table>
     * <tr>
     * <th>Item</th>
     * <th>Description</th>
     * <th>Index name</th>
     * <th>Returned type</th>
     * </tr>
     * <tr>
     * <td>SID
     * </td>
     * <td>The security identifier of the caller.</td>
     * <td>"SID"
     * </td>
     * <td>V_ARRAY</td>
     * </tr>
     * <tr>
     * <td>Account Name
     * </td>
     * <td>The account name that the caller is using.</td>
     * <td>"AccountName"
     * </td>
     * <td>V_BSTR</td>
     * </tr>
     * <tr>
     * <td>Authentication Service
     * </td>
     * <td>The authentication service used by the caller, such as NTLMSSP, Kerberos, or SSL.</td>
     * <td>"AuthenticationService"
     * </td>
     * <td>V_I4</td>
     * </tr>
     * <tr>
     * <td>Impersonation Level
     * </td>
     * <td>The impersonation level, which indicates how much authority the caller has been given to act on a client's behalf.</td>
     * <td>"ImpersonationLevel"
     * </td>
     * <td>V_I4</td>
     * </tr>
     * <tr>
     * <td>Authentication Level
     * </td>
     * <td>The authentication level used by the caller, which indicates the amount of protection given during the call.</td>
     * <td>"AuthenticationLevel"
     * </td>
     * <td>V_I4</td>
     * </tr>
     * </table>
     * @param {BSTR} name The name of the property to be retrieved. See Remarks for information about the available properties.
     * @returns {VARIANT} A reference to the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecurityidentitycoll-get_item
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
     * Retrieves an enumerator for the security identity collection.
     * @returns {IUnknown} A reference to the returned <a href="https://docs.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/comsvcs/nf-comsvcs-isecurityidentitycoll-get__newenum
     */
    get__NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppEnum)
    }
}
