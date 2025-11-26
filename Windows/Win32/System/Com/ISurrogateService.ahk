#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Used to initialize, launch, and release a COM+ application. You can also refresh the catalog and shut down the process.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-isurrogateservice
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISurrogateService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurrogateService
     * @type {Guid}
     */
    static IID => Guid("{000001d4-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "ApplicationLaunch", "ApplicationFree", "CatalogRefresh", "ProcessShutdown"]

    /**
     * Initializes the process server.
     * @param {Pointer<Guid>} rguidProcessID The process ID of the server application.
     * @param {IProcessLock} pProcessLock A pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-iprocesslock">IProcessLock</a> interface.
     * @returns {BOOL} Indicates whether the application is aware of the initialization.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isurrogateservice-init
     */
    Init(rguidProcessID, pProcessLock) {
        result := ComCall(3, this, "ptr", rguidProcessID, "ptr", pProcessLock, "int*", &pfApplicationAware := 0, "HRESULT")
        return pfApplicationAware
    }

    /**
     * Launches the application.
     * @param {Pointer<Guid>} rguidApplID The application identifier.
     * @param {Integer} appType The application type, as described in Remarks.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isurrogateservice-applicationlaunch
     */
    ApplicationLaunch(rguidApplID, appType) {
        result := ComCall(4, this, "ptr", rguidApplID, "int", appType, "HRESULT")
        return result
    }

    /**
     * Releases the application.
     * @param {Pointer<Guid>} rguidApplID The application identifier.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isurrogateservice-applicationfree
     */
    ApplicationFree(rguidApplID) {
        result := ComCall(5, this, "ptr", rguidApplID, "HRESULT")
        return result
    }

    /**
     * Refreshes the catalog.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isurrogateservice-catalogrefresh
     */
    CatalogRefresh() {
        static ulReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "uint", ulReserved, "HRESULT")
        return result
    }

    /**
     * Shuts down the process.
     * @param {Integer} shutdownType The shutdown type, as described in Remarks.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, it is E_UNEXPECTED.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-isurrogateservice-processshutdown
     */
    ProcessShutdown(shutdownType) {
        result := ComCall(7, this, "int", shutdownType, "HRESULT")
        return result
    }
}
