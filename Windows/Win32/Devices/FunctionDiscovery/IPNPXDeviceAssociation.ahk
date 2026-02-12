#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage the association database entries for PnP-X devices. These methods send notifications when the corresponding PnP devnode changes.
 * @remarks
 * This interface is obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a> on a function instance returned by a Function Discovery query. The following pseudocode shows the parameters to use for the  <b>QueryService</b> call.
 * 
 * 
 * ``` syntax
 * QueryService( SID_PNPXAssociation, __uuidof( IPNPXDeviceAssociation ) )
 * ```
 * 
 * The <b>IPNPXDeviceAssociation</b> methods modify the association database entry for the function instance upon which <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a>  was called.
 * 
 * Not all function instances can be associated using the <b>IPNPXDeviceAssociation</b> methods. The function instance must have its  PKEY_PNPX_GlobalIdentity key populated with the UUID supplied by the Function Discovery provider used to discover the device. For more information about property keys, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/pnp-x-provider-pkeys">PnP-X Provider PKEYs</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/pnpxassoc/nn-pnpxassoc-ipnpxdeviceassociation
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IPNPXDeviceAssociation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPNPXDeviceAssociation
     * @type {Guid}
     */
    static IID => Guid("{eed366d0-35b8-4fc5-8d20-7e5bd31f6ded}")

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
     * Marks an association database entry as associated and sends an appropriate notification.
     * @remarks
     * This method modifies the association database entry corresponding to the function instance from which the <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nn-pnpxassoc-ipnpxdeviceassociation">IPNPXDeviceAssociation</a> interface was obtained. 
     * 
     * Once a device is associated, the PnP-X Service IP Bus Enumerator (IPBusEnum) sends a request to the PnP component  to create the device <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/function-discovery-glossary">devnode</a>. Once the devnode has been created, the appropriate notification is sent. The following logic is used to determine the callback method used for notification:
     * 
     * <ul>
     * <li>If a PnP notification is received after the device is associated, then the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">IFunctionDiscoveryNotification::OnUpdate</a> method is called  with the <i>enumQueryUpdateAction</i> parameter set to  <b>QUA_ADD</b>. </li>
     * <li>If no PnP notification is received after the device is associated, and there are no pending PnP events, then the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror">IFunctionDiscoveryNotification::OnError</a> method is called. </li>
     * <li>Finally, if no PnP notification is received after the device is associated, and there are pending PnP events, then no callback method is called.</li>
     * </ul>
     * The <b>Found New Hardware</b> wizard appears if user intervention is required to install a device driver after association.
     * @param {PWSTR} pszSubCategory The subcategory of the association database in which the entry is stored.  This parameter can be <b>NULL</b>.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> object that is registered for notifications with Function Discovery.
     * @returns {HRESULT} This method can return one of these values.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-associate
     */
    Associate(pszSubCategory, pIFunctionDiscoveryNotification) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(3, this, "ptr", pszSubCategory, "ptr", pIFunctionDiscoveryNotification, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Marks an association database entry as unassociated and sends an appropriate notification.
     * @remarks
     * This method modifies the association database entry corresponding to the function instance from which the <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nn-pnpxassoc-ipnpxdeviceassociation">IPNPXDeviceAssociation</a> interface was obtained. 
     * 
     * The following logic is used to determine the callback method used for notification:
     * 
     * <ul>
     * <li>If a PnP notification is received after the device is unassociated, then the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">IFunctionDiscoveryNotification::OnUpdate</a> method is called  with the <i>enumQueryUpdateAction</i> parameter set to  <b>QUA_REMOVE</b>. </li>
     * <li>If no PnP notification is received after the device is unassociated, and there are no pending PnP events, then the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror">IFunctionDiscoveryNotification::OnError</a> method is called. </li>
     * <li>Finally, if no PnP notification is received after the device is unassociated, and there are pending PnP events, then no callback method is called.</li>
     * </ul>
     * This method does not remove the entry from the association database. To remove an entry from the association database, call <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nf-pnpxassoc-ipnpxassociation-delete">IPNPXAssociation::Delete</a>.
     * @param {PWSTR} pszSubCategory The subcategory of the association database in which the entry is stored.  This parameter can be <b>NULL</b>.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> object that is registered for notifications with Function Discovery.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-unassociate
     */
    Unassociate(pszSubCategory, pIFunctionDiscoveryNotification) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(4, this, "ptr", pszSubCategory, "ptr", pIFunctionDiscoveryNotification, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes an entry from the association database and sends an appropriate notification.
     * @remarks
     * This method modifies the association database entry corresponding to the function instance from which the <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nn-pnpxassoc-ipnpxdeviceassociation">IPNPXDeviceAssociation</a> interface was obtained. 
     * 
     * The following logic is used to determine the callback method used for notification:
     * 
     * <ul>
     * <li>If a PnP notification is received after the device is deleted, then the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">IFunctionDiscoveryNotification::OnUpdate</a> method is called  with the <i>enumQueryUpdateAction</i> parameter set to  <b>QUA_REMOVE</b>. </li>
     * <li>If no PnP notification is received after the device is deleted, and there are no pending PnP events, then the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror">IFunctionDiscoveryNotification::OnError</a> method is called. </li>
     * <li>Finally, if no PnP notification is received after the device is deleted, and there are pending PnP events, then no callback method is called.</li>
     * </ul>
     * To mark a device as unavailable for use without deleting the association database entry, call <a href="https://docs.microsoft.com/windows/desktop/api/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-unassociate">IPNPXDeviceAssociation::Unassociate</a>.
     * @param {PWSTR} pszSubcategory The subcategory of the association database in which the entry is stored.  This parameter can be <b>NULL</b>.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> object that is registered for notifications with Function Discovery.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-delete
     */
    Delete(pszSubcategory, pIFunctionDiscoveryNotification) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(5, this, "ptr", pszSubcategory, "ptr", pIFunctionDiscoveryNotification, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
