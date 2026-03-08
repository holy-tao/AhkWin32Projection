#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage the association database entries for PnP-X devices.
 * @remarks
 * This interface is obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a> on a function instance returned by a Function Discovery query. The following pseudocode shows the parameters to use for the  <b>QueryService</b> call.
 * 
 * 
 * ``` syntax
 * QueryService( SID_PNPXAssociation, __uuidof( IPNPXAssociation ) )
 * ```
 * 
 * The <b>IPNPXAssociation</b> methods modify the association database entry for the function instance upon which <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a>  was called.
 * 
 * Not all function instances can be associated using the <b>IPNPXAssociation</b> methods. The function instance must have its  PKEY_PNPX_GlobalIdentity key populated with the UUID supplied by the Function Discovery provider used to discover the device. For more information about property keys, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/pnp-x-provider-pkeys">PnP-X Provider PKEYs</a>.
 * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nn-pnpxassoc-ipnpxassociation
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IPNPXAssociation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPNPXAssociation
     * @type {Guid}
     */
    static IID => Guid("{0bd7e521-4da6-42d5-81ba-1981b6b94075}")

    /**
     * The class identifier for PNPXAssociation
     * @type {Guid}
     */
    static CLSID => Guid("{cee8ccc9-4f6b-4469-a235-5a22869eef03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Associate", "Unassociate", "Delete"]

    /**
     * Marks an association database entry as associated.
     * @remarks
     * This method modifies the association database entry corresponding to the function instance from which the <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nn-pnpxassoc-ipnpxassociation">IPNPXAssociation</a> interface was obtained. 
     * 
     * Once a device is associated, the PnP-X Service IP Bus Enumerator (IPBusEnum) sends a request to the PnP component  to create the device <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/function-discovery-glossary">devnode</a>. The <b>Found New Hardware</b> wizard appears if user intervention is required to install a device driver after association.
     * @param {PWSTR} pszSubcategory The subcategory of the association database in which the entry is stored.   This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nf-pnpxassoc-ipnpxassociation-associate
     */
    Associate(pszSubcategory) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(3, this, "ptr", pszSubcategory, "HRESULT")
        return result
    }

    /**
     * Marks an association database entry as unassociated.
     * @remarks
     * This method modifies the association database entry corresponding to the function instance from which the <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nn-pnpxassoc-ipnpxassociation">IPNPXAssociation</a> interface was obtained. 
     * 
     * This method does not remove the entry from the association database. To remove an entry from the association database, call <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nf-pnpxassoc-ipnpxassociation-delete">IPNPXAssociation::Delete</a>.
     * @param {PWSTR} pszSubcategory The subcategory of the association database in which the entry is stored.  This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nf-pnpxassoc-ipnpxassociation-unassociate
     */
    Unassociate(pszSubcategory) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(4, this, "ptr", pszSubcategory, "HRESULT")
        return result
    }

    /**
     * Removes an entry from the association database.
     * @remarks
     * This method modifies the association database entry corresponding to the function instance from which the <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nn-pnpxassoc-ipnpxassociation">IPNPXAssociation</a> interface was obtained. 
     * 
     * To mark a device as unavailable for use without deleting the association database entry, call <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nf-pnpxassoc-ipnpxassociation-unassociate">IPNPXAssociation::Unassociate</a>.
     * @param {PWSTR} pszSubcategory The subcategory of the association database in which the entry is stored.  This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nf-pnpxassoc-ipnpxassociation-delete
     */
    Delete(pszSubcategory) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(5, this, "ptr", pszSubcategory, "HRESULT")
        return result
    }
}
