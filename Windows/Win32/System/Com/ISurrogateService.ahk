#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ShutdownType.ahk" { ShutdownType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ApplicationType.ahk" { ApplicationType }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\IProcessLock.ahk" { IProcessLock }

/**
 * Used to initialize, launch, and release a COM+ application. You can also refresh the catalog and shut down the process.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-isurrogateservice
 * @namespace Windows.Win32.System.Com
 */
export default struct ISurrogateService extends IUnknown {
    /**
     * The interface identifier for ISurrogateService
     * @type {Guid}
     */
    static IID := Guid("{000001d4-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISurrogateService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init              : IntPtr
        ApplicationLaunch : IntPtr
        ApplicationFree   : IntPtr
        CatalogRefresh    : IntPtr
        ProcessShutdown   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISurrogateService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the process server.
     * @param {Pointer<Guid>} rguidProcessID The process ID of the server application.
     * @param {IProcessLock} pProcessLock A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iprocesslock">IProcessLock</a> interface.
     * @returns {BOOL} Indicates whether the application is aware of the initialization.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isurrogateservice-init
     */
    Init(rguidProcessID, pProcessLock) {
        result := ComCall(3, this, Guid.Ptr, rguidProcessID, "ptr", pProcessLock, BOOL.Ptr, &pfApplicationAware := 0, "HRESULT")
        return pfApplicationAware
    }

    /**
     * Launches the application.
     * @remarks
     * The application type is defined by the following enum.
     * 
     * 
     * ``` syntax
     * typedef enum tagApplicationType { 
     *     ServerApplication, 
     *     LibraryApplication 
     * } ApplicationType;
     * 
     * ```
     * @param {Pointer<Guid>} rguidApplID The application identifier.
     * @param {ApplicationType} appType The application type, as described in Remarks.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isurrogateservice-applicationlaunch
     */
    ApplicationLaunch(rguidApplID, appType) {
        result := ComCall(4, this, Guid.Ptr, rguidApplID, ApplicationType, appType, "HRESULT")
        return result
    }

    /**
     * Releases the application.
     * @param {Pointer<Guid>} rguidApplID The application identifier.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isurrogateservice-applicationfree
     */
    ApplicationFree(rguidApplID) {
        result := ComCall(5, this, Guid.Ptr, rguidApplID, "HRESULT")
        return result
    }

    /**
     * Refreshes the catalog.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isurrogateservice-catalogrefresh
     */
    CatalogRefresh() {
        static ulReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "uint", ulReserved, "HRESULT")
        return result
    }

    /**
     * Shuts down the process.
     * @remarks
     * The shutdown type is defined by the following enum.
     * 
     * 
     * ``` syntax
     * typedef enum tagShutdownType { 
     *     IdleShutdown, 
     *     ForcedShutdown
     * } ShutdownType;
     * 
     * ```
     * @param {ShutdownType} _shutdownType The shutdown type, as described in Remarks.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isurrogateservice-processshutdown
     */
    ProcessShutdown(_shutdownType) {
        result := ComCall(7, this, ShutdownType, _shutdownType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISurrogateService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 4)
        this.vtbl.ApplicationLaunch := CallbackCreate(GetMethod(implObj, "ApplicationLaunch"), flags, 3)
        this.vtbl.ApplicationFree := CallbackCreate(GetMethod(implObj, "ApplicationFree"), flags, 2)
        this.vtbl.CatalogRefresh := CallbackCreate(GetMethod(implObj, "CatalogRefresh"), flags, 2)
        this.vtbl.ProcessShutdown := CallbackCreate(GetMethod(implObj, "ProcessShutdown"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.ApplicationLaunch)
        CallbackFree(this.vtbl.ApplicationFree)
        CallbackFree(this.vtbl.CatalogRefresh)
        CallbackFree(this.vtbl.ProcessShutdown)
    }
}
