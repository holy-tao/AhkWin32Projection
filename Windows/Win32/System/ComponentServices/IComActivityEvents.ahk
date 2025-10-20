#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if an activity is created, destroyed, or timed out.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomactivityevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComActivityEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComActivityEvents
     * @type {Guid}
     */
    static IID => Guid("{683130b0-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnActivityCreate", "OnActivityDestroy", "OnActivityEnter", "OnActivityTimeout", "OnActivityReenter", "OnActivityLeave", "OnActivityLeaveSame"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivitycreate
     */
    OnActivityCreate(pInfo, guidActivity) {
        result := ComCall(3, this, "ptr", pInfo, "ptr", guidActivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivitydestroy
     */
    OnActivityDestroy(pInfo, guidActivity) {
        result := ComCall(4, this, "ptr", pInfo, "ptr", guidActivity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidCurrent 
     * @param {Pointer<Guid>} guidEntered 
     * @param {Integer} dwThread 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityenter
     */
    OnActivityEnter(pInfo, guidCurrent, guidEntered, dwThread) {
        result := ComCall(5, this, "ptr", pInfo, "ptr", guidCurrent, "ptr", guidEntered, "uint", dwThread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidCurrent 
     * @param {Pointer<Guid>} guidEntered 
     * @param {Integer} dwThread 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivitytimeout
     */
    OnActivityTimeout(pInfo, guidCurrent, guidEntered, dwThread, dwTimeout) {
        result := ComCall(6, this, "ptr", pInfo, "ptr", guidCurrent, "ptr", guidEntered, "uint", dwThread, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidCurrent 
     * @param {Integer} dwThread 
     * @param {Integer} dwCallDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityreenter
     */
    OnActivityReenter(pInfo, guidCurrent, dwThread, dwCallDepth) {
        result := ComCall(7, this, "ptr", pInfo, "ptr", guidCurrent, "uint", dwThread, "uint", dwCallDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidCurrent 
     * @param {Pointer<Guid>} guidLeft 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityleave
     */
    OnActivityLeave(pInfo, guidCurrent, guidLeft) {
        result := ComCall(8, this, "ptr", pInfo, "ptr", guidCurrent, "ptr", guidLeft, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidCurrent 
     * @param {Integer} dwCallDepth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomactivityevents-onactivityleavesame
     */
    OnActivityLeaveSame(pInfo, guidCurrent, dwCallDepth) {
        result := ComCall(9, this, "ptr", pInfo, "ptr", guidCurrent, "uint", dwCallDepth, "HRESULT")
        return result
    }
}
