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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnAppActivation2", "OnAppShutdown2", "OnAppForceShutdown2", "OnAppPaused2", "OnAppRecycle2"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @param {Guid} guidProcess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onappactivation2
     */
    OnAppActivation2(pInfo, guidApp, guidProcess) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidApp, "ptr", guidProcess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onappshutdown2
     */
    OnAppShutdown2(pInfo, guidApp) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onappforceshutdown2
     */
    OnAppForceShutdown2(pInfo, guidApp) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @param {BOOL} bPaused 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onapppaused2
     */
    OnAppPaused2(pInfo, guidApp, bPaused) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidApp, "int", bPaused, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Guid} guidApp 
     * @param {Guid} guidProcess 
     * @param {Integer} lReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onapprecycle2
     */
    OnAppRecycle2(pInfo, guidApp, guidProcess, lReason) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidApp, "ptr", guidProcess, "int", lReason, "HRESULT")
        return result
    }
}
