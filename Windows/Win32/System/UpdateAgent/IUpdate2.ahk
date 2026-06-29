#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStringCollection.ahk" { IStringCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IUpdate.ahk" { IUpdate }

/**
 * Contains the properties and methods that are available to an update. (IUpdate2)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdate2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdate2 extends IUpdate {
    /**
     * The interface identifier for IUpdate2
     * @type {Guid}
     */
    static IID := Guid("{144fe9b0-d23d-4a8b-8634-fb4457533b7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdate2 interfaces
    */
    struct Vtbl extends IUpdate.Vtbl {
        get_RebootRequired : IntPtr
        get_IsPresent      : IntPtr
        get_CveIDs         : IntPtr
        CopyToCache        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdate2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(52, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is present on a computer.
     * @remarks
     * An update is considered present if it is installed for one or more products. For example, if an update applies to both Microsoft Office Word and to Microsoft Office Excel, the <b>IsPresent</b> property returns <b>VARIANT_TRUE</b> if the update is installed for one or both of the products.
     * 
     * If an update applies to only one product, the <b>IsPresent</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_isinstalled">IsInstalled</a> properties are equivalent. An update is considered installed if the update is installed for all the products to which it applies.
     * 
     * If <b>IsPresent</b> returns <b>VARIANT_TRUE</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-get_isinstalled">IsInstalled</a> returns <b>VARIANT_FALSE</b>, the update can be uninstalled for the product that installed it.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-get_ispresent
     */
    get_IsPresent() {
        result := ComCall(53, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a collection of common vulnerabilities and exposures (CVE) IDs that are associated with the update.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-get_cveids
     */
    get_CveIDs() {
        result := ComCall(54, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Copies files for an update from a specified source location to the internal Windows Update Agent (WUA) download cache.
     * @remarks
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is implementing the interface has been locked down.
     * 
     * <div class="alert"><b>Note</b>  We don't recommend or support the use of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-copyfromcache">IUpdate::CopyFromCache</a> and <b>IUpdate2::CopyToCache</b> methods to move downloaded updates from one computer to another computer. When the Windows Update Agent (WUA) downloads an update, it might only download the portions of the update’s payload that are necessary for a particular client computer. The necessary portions of the update’s payload can often vary from one computer to another computer, even if the computers have similar hardware and software configurations. <b>IUpdate2::CopyToCache</b> only works if the provided files are an exact match for the files that Windows Update would have normally downloaded on that computer; if you called <b>IUpdate::CopyFromCache</b> to obtain the files on a different computer, the files are likely not to match the files that Windows Update would have normally downloaded so <b>IUpdate2::CopyToCache</b> might fail.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate2-copytocache
     */
    CopyToCache(pFiles) {
        result := ComCall(55, this, "ptr", pFiles, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdate2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RebootRequired := CallbackCreate(GetMethod(implObj, "get_RebootRequired"), flags, 2)
        this.vtbl.get_IsPresent := CallbackCreate(GetMethod(implObj, "get_IsPresent"), flags, 2)
        this.vtbl.get_CveIDs := CallbackCreate(GetMethod(implObj, "get_CveIDs"), flags, 2)
        this.vtbl.CopyToCache := CallbackCreate(GetMethod(implObj, "CopyToCache"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RebootRequired)
        CallbackFree(this.vtbl.get_IsPresent)
        CallbackFree(this.vtbl.get_CveIDs)
        CallbackFree(this.vtbl.CopyToCache)
    }
}
