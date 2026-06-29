#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IUpdateSearcher.ahk" { IUpdateSearcher }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateInstaller.ahk" { IUpdateInstaller }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IUpdateDownloader.ahk" { IUpdateDownloader }
#Import ".\IWebProxy.ahk" { IWebProxy }

/**
 * Represents a session in which the caller can perform operations that involve updates. For example, this interface represents sessions in which the caller performs a search, download, installation, or uninstallation operation. (IUpdateSession)
 * @remarks
 * You can create an instance of this interface by using the UpdateSession coclass. Use the Microsoft.Update.Session program identifier to create the object.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatesession
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateSession extends IDispatch {
    /**
     * The interface identifier for IUpdateSession
     * @type {Guid}
     */
    static IID := Guid("{816858a4-260d-4260-933a-2585f1abc76b}")

    /**
     * The class identifier for UpdateSession
     * @type {Guid}
     */
    static CLSID := Guid("{4cb43d7f-7eee-4906-8698-60da1c38f2fe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateSession interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ClientApplicationID : IntPtr
        put_ClientApplicationID : IntPtr
        get_ReadOnly            : IntPtr
        get_WebProxy            : IntPtr
        put_WebProxy            : IntPtr
        CreateUpdateSearcher    : IntPtr
        CreateUpdateDownloader  : IntPtr
        CreateUpdateInstaller   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ClientApplicationID {
        get => this.get_ClientApplicationID()
        set => this.put_ClientApplicationID(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * @type {IWebProxy} 
     */
    WebProxy {
        get => this.get_WebProxy()
        set => this.put_WebProxy(value)
    }

    /**
     * Gets and sets the current client application. (IUpdateSession.get_ClientApplicationID)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-get_clientapplicationid
     */
    get_ClientApplicationID() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the current client application. (IUpdateSession.put_ClientApplicationID)
     * @remarks
     * Returns the Unknown value if the client application has not set the property.
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-put_clientapplicationid
     */
    put_ClientApplicationID(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(8, this, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the session object is read-only.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the proxy settings that are used to access the server. (Get)
     * @returns {IWebProxy} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-get_webproxy
     */
    get_WebProxy() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IWebProxy(retval)
    }

    /**
     * Gets and sets the proxy settings that are used to access the server. (Put)
     * @param {IWebProxy} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-put_webproxy
     */
    put_WebProxy(value) {
        result := ComCall(11, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Returns an IUpdateSearcher interface for this session.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface can also be created by using the UpdateSearcher coclass.
     * @returns {IUpdateSearcher} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a> interface for this session.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-createupdatesearcher
     */
    CreateUpdateSearcher() {
        result := ComCall(12, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateSearcher(retval)
    }

    /**
     * Returns an IUpdateDownloader interface for this session.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloader">IUpdateDownloader</a> interface can also be created by using the UpdateDownloader coclass.
     * @returns {IUpdateDownloader} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloader">IUpdateDownloader</a> interface for this session.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-createupdatedownloader
     */
    CreateUpdateDownloader() {
        result := ComCall(13, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloader(retval)
    }

    /**
     * Returns an IUpdateInstaller interface for this session.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> interface can also be created by using the UpdateInstaller coclass.
     * @returns {IUpdateInstaller} An <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a> interface for this session.
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesession-createupdateinstaller
     */
    CreateUpdateInstaller() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUpdateInstaller(retval)
    }

    Query(iid) {
        if (IUpdateSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ClientApplicationID := CallbackCreate(GetMethod(implObj, "get_ClientApplicationID"), flags, 2)
        this.vtbl.put_ClientApplicationID := CallbackCreate(GetMethod(implObj, "put_ClientApplicationID"), flags, 2)
        this.vtbl.get_ReadOnly := CallbackCreate(GetMethod(implObj, "get_ReadOnly"), flags, 2)
        this.vtbl.get_WebProxy := CallbackCreate(GetMethod(implObj, "get_WebProxy"), flags, 2)
        this.vtbl.put_WebProxy := CallbackCreate(GetMethod(implObj, "put_WebProxy"), flags, 2)
        this.vtbl.CreateUpdateSearcher := CallbackCreate(GetMethod(implObj, "CreateUpdateSearcher"), flags, 2)
        this.vtbl.CreateUpdateDownloader := CallbackCreate(GetMethod(implObj, "CreateUpdateDownloader"), flags, 2)
        this.vtbl.CreateUpdateInstaller := CallbackCreate(GetMethod(implObj, "CreateUpdateInstaller"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ClientApplicationID)
        CallbackFree(this.vtbl.put_ClientApplicationID)
        CallbackFree(this.vtbl.get_ReadOnly)
        CallbackFree(this.vtbl.get_WebProxy)
        CallbackFree(this.vtbl.put_WebProxy)
        CallbackFree(this.vtbl.CreateUpdateSearcher)
        CallbackFree(this.vtbl.CreateUpdateDownloader)
        CallbackFree(this.vtbl.CreateUpdateInstaller)
    }
}
