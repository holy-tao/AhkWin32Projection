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
     * 
     * @param {Pointer<Guid>} rguidProcessID 
     * @param {Pointer<IProcessLock>} pProcessLock 
     * @param {Pointer<BOOL>} pfApplicationAware 
     * @returns {HRESULT} 
     */
    Init(rguidProcessID, pProcessLock, pfApplicationAware) {
        result := ComCall(3, this, "ptr", rguidProcessID, "ptr", pProcessLock, "ptr", pfApplicationAware, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidApplID 
     * @param {Integer} appType 
     * @returns {HRESULT} 
     */
    ApplicationLaunch(rguidApplID, appType) {
        result := ComCall(4, this, "ptr", rguidApplID, "int", appType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidApplID 
     * @returns {HRESULT} 
     */
    ApplicationFree(rguidApplID) {
        result := ComCall(5, this, "ptr", rguidApplID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CatalogRefresh() {
        static ulReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(6, this, "uint", ulReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} shutdownType 
     * @returns {HRESULT} 
     */
    ProcessShutdown(shutdownType) {
        result := ComCall(7, this, "int", shutdownType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
