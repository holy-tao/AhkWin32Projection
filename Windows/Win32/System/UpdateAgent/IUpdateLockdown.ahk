#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Restricts access to methods and properties of objects that implements the method of this interface.
 * @remarks
 * The <b>IUpdateLockdown</b> interface is derived from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, not <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a>. It cannot be accessed by using a script. This interface restricts access to the Windows Update  website.
 * 
 * The following classes implement the <b>IUpdateLockdown</b> interface:
 * 
 * 
 * 
 * <ul>
 * <li>AutomaticUpdates</li>
 * <li>UpdateDownloader</li>
 * <li>UpdateInstaller</li>
 * <li>UpdateServiceManager</li>
 * <li>WebProxy</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatelockdown
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateLockdown extends IUnknown {
    /**
     * The interface identifier for IUpdateLockdown
     * @type {Guid}
     */
    static IID := Guid("{a976c28d-75a1-42aa-94ae-8af8b872089a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateLockdown interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LockDown : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateLockdown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Restricts access to the methods and properties of the object that implements this method.
     * @remarks
     * The following table identifies the interfaces that implement the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatelockdown">IUpdateLockdown</a> interface.
     * 
     * <table>
     * <tr>
     * <th>WUA object</th>
     * <th>Restricted methods and properties</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdates">IAutomaticUpdates</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdates-pause">Pause</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdates-resume">Resume</a>
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings">IAutomaticUpdatesSettings</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-save">Save</a>
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-accepteula">AcceptEula</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-copyfromcache">CopyFromCache</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate2-copytocache">CopyToCache</a>
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdateDownloader</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-download">BeginDownload</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-begindownload">Download</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-enddownload">EndDownload</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-get_isforced">IsForced</a> (cannot set)</dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-begininstall">BeginInstall</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-beginuninstall">BeginUninstall</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-endinstall">EndInstall</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-enduninstall">EndUninstall</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-install">Install</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_isforced">IsForced</a> (cannot set)</dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-uninstall">Uninstall</a>
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservicemanager">IUpdateServiceManager</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-addscanpackageservice">AddScanPackageService</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-removeservice">RemoveService</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-setoption">SetOption</a>
     * </dd>
     * </dl>
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iwebproxy">IWebProxy</a>
     * </td>
     * <td>
     * <dl>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_address">Address</a> (cannot set)</dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> (cannot set)</dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist">BypassList</a> (cannot set)</dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal">BypassProxyOnLocal</a> (cannot set)</dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-setpassword">SetPassword</a>
     * </dd>
     * <dd>
     * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_username">UserName</a> (cannot set)</dd>
     * </dl>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} flags The option to restrict access to various Windows Update Agent (WUA) objects from the Windows Update website. 
     * 
     * Setting this parameter to  <b>uloForWebsiteAccess</b> or to 1 (one) restricts access to the WUA interfaces that implement the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatelockdown">IUpdateLockdown</a> interface.
     * 
     * For a list of the methods and properties that the WUA interfaces restrict when this value is specified, see the "Remarks" section.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatelockdown-lockdown
     */
    LockDown(flags) {
        result := ComCall(3, this, "int", flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateLockdown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LockDown := CallbackCreate(GetMethod(implObj, "LockDown"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LockDown)
    }
}
