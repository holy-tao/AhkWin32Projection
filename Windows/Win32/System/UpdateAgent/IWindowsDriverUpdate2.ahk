#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IStringCollection.ahk
#Include .\IWindowsDriverUpdate.ahk

/**
 * Contains the properties and methods that are available only from a Windows driver update.
 * @remarks
 * 
 * This interface can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface only if the interface represents a Windows Driver update.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdate2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdate2 extends IWindowsDriverUpdate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDriverUpdate2
     * @type {Guid}
     */
    static IID => Guid("{615c4269-7a48-43bd-96b7-bf6ca27d6c3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 60

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
     * Gets a Boolean value that indicates whether the computer must be restarted after you install or uninstall an update.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdate2-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(60, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is installed on a computer.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdate2-get_ispresent
     */
    get_IsPresent() {
        result := ComCall(61, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Contains a collection of the Common Vulnerabilities and Exposures (CVE) identifiers that are associated with an update.
     * @returns {IStringCollection} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdate2-get_cveids
     */
    get_CveIDs() {
        result := ComCall(62, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Copies the external update binaries to an update.
     * @param {IStringCollection} pFiles An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-istringcollection">IStringCollection</a> interface that contains the strings to be copied to an update.
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
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdate2-copytocache
     */
    CopyToCache(pFiles) {
        result := ComCall(63, this, "ptr", pFiles, "HRESULT")
        return result
    }
}
