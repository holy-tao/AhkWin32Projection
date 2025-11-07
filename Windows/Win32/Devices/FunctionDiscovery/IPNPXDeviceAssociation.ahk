#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage the association database entries for PnP-X devices. These methods send notifications when the corresponding PnP devnode changes.
 * @remarks
 * 
 * This interface is obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a> on a function instance returned by a Function Discovery query. The following pseudocode shows the parameters to use for the  <b>QueryService</b> call.
 * 
 * <pre class="syntax" xml:space="preserve"><c>QueryService( SID_PNPXAssociation, __uuidof( IPNPXDeviceAssociation ) )</c></pre>
 * The <b>IPNPXDeviceAssociation</b> methods modify the association database entry for the function instance upon which <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a>  was called.
 * 
 * Not all function instances can be associated using the <b>IPNPXDeviceAssociation</b> methods. The function instance must have its  PKEY_PNPX_GlobalIdentity key populated with the UUID supplied by the Function Discovery provider used to discover the device. For more information about property keys, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/pnp-x-provider-pkeys">PnP-X Provider PKEYs</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pnpxassoc/nn-pnpxassoc-ipnpxdeviceassociation
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
     * 
     * @param {PWSTR} pszSubCategory 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-associate
     */
    Associate(pszSubCategory, pIFunctionDiscoveryNotification) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(3, this, "ptr", pszSubCategory, "ptr", pIFunctionDiscoveryNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubCategory 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-unassociate
     */
    Unassociate(pszSubCategory, pIFunctionDiscoveryNotification) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(4, this, "ptr", pszSubCategory, "ptr", pIFunctionDiscoveryNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubcategory 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/pnpxassoc/nf-pnpxassoc-ipnpxdeviceassociation-delete
     */
    Delete(pszSubcategory, pIFunctionDiscoveryNotification) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(5, this, "ptr", pszSubcategory, "ptr", pIFunctionDiscoveryNotification, "HRESULT")
        return result
    }
}
