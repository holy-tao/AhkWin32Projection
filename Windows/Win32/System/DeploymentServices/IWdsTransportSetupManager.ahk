#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Manages setup tasks on a WDS transport server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportsetupmanager
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportSetupManager extends IDispatch {
    /**
     * The interface identifier for IWdsTransportSetupManager
     * @type {Guid}
     */
    static IID := Guid("{f7238425-efa8-40a4-aef9-c98d969c0b75}")

    /**
     * The class identifier for WdsTransportSetupManager
     * @type {Guid}
     */
    static CLSID := Guid("{c7beeaad-9f04-4923-9f0c-fbf52bc7590f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportSetupManager interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Version               : IntPtr
        get_InstalledFeatures     : IntPtr
        get_Protocols             : IntPtr
        RegisterContentProvider   : IntPtr
        DeregisterContentProvider : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportSetupManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {Integer} 
     */
    InstalledFeatures {
        get => this.get_InstalledFeatures()
    }

    /**
     * @type {Integer} 
     */
    Protocols {
        get => this.get_Protocols()
    }

    /**
     * Receives a value that indicates the operating system version of the WDS server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-get_version
     */
    get_Version() {
        result := ComCall(7, this, "uint*", &pullVersion := 0, "HRESULT")
        return pullVersion
    }

    /**
     * Receives a value that indicates which WDS features are installed on the server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-get_installedfeatures
     */
    get_InstalledFeatures() {
        result := ComCall(8, this, "uint*", &pulInstalledFeatures := 0, "HRESULT")
        return pulInstalledFeatures
    }

    /**
     * Receives a value that indicates which transport protocols are supported by the WDS server.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-get_protocols
     */
    get_Protocols() {
        result := ComCall(9, this, "uint*", &pulProtocols := 0, "HRESULT")
        return pulProtocols
    }

    /**
     * Enables an application run on a client computer to register a content provider DLL. This makes the provider available for use by the WDS transport server.
     * @remarks
     * To enable a multicast provider to support unauthenticated connections, the provider developer can add the <b>AllowUnAuth</b> key to the registry and set its <b>DWORD</b> value equal to 1.
     * 
     * 
     * <b>HKLM</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>WDSServer</b>&#92;<b>Providers</b>&#92;<b>WDSMC</b>&#92;<b>Providers</b>&#92;<b><i>Content Provider Name (i.e. bszName)</i></b>&#92;<b>AllowUnauth</b>
     * @param {BSTR} bszName The name of the content provider to be registered. This name must be unique on the server.
     * @param {BSTR} bszDescription A description of the content provider that can be  read by an administrator.
     * @param {BSTR} bszFilePath The  full path to the DLL that implements the content provider. The path can include environment variables.
     * @param {BSTR} bszInitializationRoutine The name of a function exported by the content provider that the WDS transport server can use to initialize the provider.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-registercontentprovider
     */
    RegisterContentProvider(bszName, bszDescription, bszFilePath, bszInitializationRoutine) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName
        bszDescription := bszDescription is String ? BSTR.Alloc(bszDescription).Value : bszDescription
        bszFilePath := bszFilePath is String ? BSTR.Alloc(bszFilePath).Value : bszFilePath
        bszInitializationRoutine := bszInitializationRoutine is String ? BSTR.Alloc(bszInitializationRoutine).Value : bszInitializationRoutine

        result := ComCall(10, this, BSTR, bszName, BSTR, bszDescription, BSTR, bszFilePath, BSTR, bszInitializationRoutine, "HRESULT")
        return result
    }

    /**
     * Enables an application run on a client computer to deregister a content provider. This makes the provider no longer available for use by the WDS transport server.
     * @param {BSTR} bszName The name of the content provider to be deregistered.
     * @returns {HRESULT} Standard HRESULT error values are used: S_OK for success; others for failure.
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportsetupmanager-deregistercontentprovider
     */
    DeregisterContentProvider(bszName) {
        bszName := bszName is String ? BSTR.Alloc(bszName).Value : bszName

        result := ComCall(11, this, BSTR, bszName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportSetupManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Version := CallbackCreate(GetMethod(implObj, "get_Version"), flags, 2)
        this.vtbl.get_InstalledFeatures := CallbackCreate(GetMethod(implObj, "get_InstalledFeatures"), flags, 2)
        this.vtbl.get_Protocols := CallbackCreate(GetMethod(implObj, "get_Protocols"), flags, 2)
        this.vtbl.RegisterContentProvider := CallbackCreate(GetMethod(implObj, "RegisterContentProvider"), flags, 5)
        this.vtbl.DeregisterContentProvider := CallbackCreate(GetMethod(implObj, "DeregisterContentProvider"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Version)
        CallbackFree(this.vtbl.get_InstalledFeatures)
        CallbackFree(this.vtbl.get_Protocols)
        CallbackFree(this.vtbl.RegisterContentProvider)
        CallbackFree(this.vtbl.DeregisterContentProvider)
    }
}
