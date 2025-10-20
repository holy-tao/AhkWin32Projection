#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to manage the association database entries for PnP-X devices.
 * @remarks
 * 
  * This interface is obtained by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a> on a function instance returned by a Function Discovery query. The following pseudocode shows the parameters to use for the  <b>QueryService</b> call.
  * 
  * <pre class="syntax" xml:space="preserve"><c>QueryService( SID_PNPXAssociation, __uuidof( IPNPXAssociation ) )</c></pre>
  * The <b>IPNPXAssociation</b> methods modify the association database entry for the function instance upon which <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">QueryService</a>  was called.
  * 
  * Not all function instances can be associated using the <b>IPNPXAssociation</b> methods. The function instance must have its  PKEY_PNPX_GlobalIdentity key populated with the UUID supplied by the Function Discovery provider used to discover the device. For more information about property keys, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/pnp-x-provider-pkeys">PnP-X Provider PKEYs</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pnpxassoc/nn-pnpxassoc-ipnpxassociation
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IPNPXAssociation extends IUnknown{
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
     * 
     * @param {PWSTR} pszSubcategory 
     * @returns {HRESULT} 
     */
    Associate(pszSubcategory) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(3, this, "ptr", pszSubcategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubcategory 
     * @returns {HRESULT} 
     */
    Unassociate(pszSubcategory) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(4, this, "ptr", pszSubcategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubcategory 
     * @returns {HRESULT} 
     */
    Delete(pszSubcategory) {
        pszSubcategory := pszSubcategory is String ? StrPtr(pszSubcategory) : pszSubcategory

        result := ComCall(5, this, "ptr", pszSubcategory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
