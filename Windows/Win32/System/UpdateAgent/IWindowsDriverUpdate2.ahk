#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWindowsDriverUpdate.ahk" { IWindowsDriverUpdate }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStringCollection.ahk" { IStringCollection }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Contains the properties and methods that are available only from a Windows driver update. (IWindowsDriverUpdate2)
 * @remarks
 * This interface can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface only if the interface represents a Windows Driver update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iwindowsdriverupdate2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IWindowsDriverUpdate2 extends IWindowsDriverUpdate {
    /**
     * The interface identifier for IWindowsDriverUpdate2
     * @type {Guid}
     */
    static IID := Guid("{615c4269-7a48-43bd-96b7-bf6ca27d6c3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDriverUpdate2 interfaces
    */
    struct Vtbl extends IWindowsDriverUpdate.Vtbl {
        get_RebootRequired : IntPtr
        get_IsPresent      : IntPtr
        get_CveIDs         : IntPtr
        CopyToCache        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDriverUpdate2.Vtbl()
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
     * Gets a Boolean value that indicates whether the computer must be restarted after you install or uninstall an update.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate2-get_rebootrequired
     */
    get_RebootRequired() {
        result := ComCall(60, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether an update is installed on a computer.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate2-get_ispresent
     */
    get_IsPresent() {
        result := ComCall(61, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Contains a collection of the Common Vulnerabilities and Exposures (CVE) identifiers that are associated with an update.
     * @returns {IStringCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate2-get_cveids
     */
    get_CveIDs() {
        result := ComCall(62, this, "ptr*", &retval := 0, "HRESULT")
        return IStringCollection(retval)
    }

    /**
     * Copies the external update binaries to an update.
     * @remarks
     * This method returns <b>WU_E_INVALID_OPERATION</b> if the object that is  implementing the interface has been locked down.
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
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate2-copytocache
     */
    CopyToCache(pFiles) {
        result := ComCall(63, this, "ptr", pFiles, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWindowsDriverUpdate2.IID.Equals(iid)) {
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
