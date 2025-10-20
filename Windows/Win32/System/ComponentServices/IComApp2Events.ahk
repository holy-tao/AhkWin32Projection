#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a COM+ server application is loaded, shut down, or paused.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomapp2events
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComApp2Events extends IUnknown{
    /**
     * The interface identifier for IComApp2Events
     * @type {Guid}
     */
    static IID => Guid("{1290bc1a-b219-418d-b078-5934ded08242}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @param {Pointer<Guid>} guidProcess 
     * @returns {HRESULT} 
     */
    OnAppActivation2(pInfo, guidApp, guidProcess) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "ptr", guidProcess, "int")
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
    OnAppShutdown2(pInfo, guidApp) {
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
    OnAppForceShutdown2(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @param {BOOL} bPaused 
     * @returns {HRESULT} 
     */
    OnAppPaused2(pInfo, guidApp, bPaused) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidApp, "int", bPaused, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidApp 
     * @param {Pointer<Guid>} guidProcess 
     * @param {Integer} lReason 
     * @returns {HRESULT} 
     */
    OnAppRecycle2(pInfo, guidApp, guidProcess, lReason) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidApp, "ptr", guidProcess, "int", lReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
