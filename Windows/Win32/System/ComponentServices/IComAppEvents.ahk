#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a COM+ server application is started, shut down, or forced to shut down.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomappevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComAppEvents extends IUnknown{
    /**
     * The interface identifier for IComAppEvents
     * @type {Guid}
     */
    static IID => Guid("{683130a6-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @returns {HRESULT} 
     */
    OnAppActivation(pInfo, guidApp) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @returns {HRESULT} 
     */
    OnAppShutdown(pInfo, guidApp) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @returns {HRESULT} 
     */
    OnAppForceShutdown(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
