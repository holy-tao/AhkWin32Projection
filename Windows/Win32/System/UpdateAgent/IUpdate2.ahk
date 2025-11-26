#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStringCollection.ahk
#Include .\IUpdate.ahk

/**
 * Contains the properties and methods that are available to an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdate2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdate2 extends IUpdate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdate2
     * @type {Guid}
     */
    static IID => Guid("{144fe9b0-d23d-4a8b-8634-fb4457533b7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 52

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RebootRequired", "get_IsPresent", "get_CveIDs", "CopyToCache"]

    /**
     * @type {VARIANT_BOOL} 
     */
    RebootRequired {
        get => this.get_RebootRequired()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsPresent {
        get => this.get_IsPresent()
    }

    /**
     * @type {IStringCollection} 
     */
    CveIDs {
        get => this.get_CveIDs()
    }

    /**
     * Gets a Boolean value that indicates whether a system restart is required on a computer to complete the installation or the uninstallation of an update.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate2-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(52, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is present on a computer.
     * @remarks
     * 
     * An update is considered present if it is installed for one or more products. For example, if an update applies to both Microsoft Office Word and to Microsoft Office Excel, the <b>IsPresent</b> property returns <b>VARIANT_TRUE</b> if the update is installed for one or both of the products.
     * 
     * If an update applies to only one product, the <b>IsPresent</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_isinstalled">IsInstalled</a> properties are equivalent. An update is considered installed if the update is installed for all the products to which it applies.
     * 
     * If <b>IsPresent</b> returns <b>VARIANT_TRUE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_isinstalled">IsInstalled</a> returns <b>VARIANT_FALSE</b>, the update can be uninstalled for the product that installed it.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate2-get_ispresent
     */
    get_IsPresent() {
        result := ComCall(53, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a collection of common vulnerabilities and exposures (CVE) IDs that are associated with the update.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate2-get_cveids
     */
    get_CveIDs() {
        result := ComCall(54, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Copies files for an update from a specified source location to the internal Windows Update Agent (WUA) download cache.
     * @param {IStringCollection} pFiles An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-istringcollection">IStringCollection</a> interface that represents a collection of strings that contain the full paths of the files for an update.   
     * 
     * The strings  must give the full paths of the files that are being copied. The strings cannot give only the directory that contains the files.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code. 
     * 
     * This method can also return the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This  method cannot be called from a remote computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter value is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WU_E_INVALID_OPERATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The computer could not access the update site.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdate2-copytocache
     */
    CopyToCache(pFiles) {
        result := ComCall(55, this, "ptr", pFiles, "HRESULT")
        return result
    }
}
