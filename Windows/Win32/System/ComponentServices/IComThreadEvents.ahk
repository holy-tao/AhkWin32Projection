#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Notifies the subscriber if a single-threaded apartment (STA) is created or terminated, and when an apartment thread is allocated.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomthreadevents
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComThreadEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComThreadEvents
     * @type {Guid}
     */
    static IID => Guid("{683130a5-2e50-11d2-98a5-00c04f8ee1c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnThreadStart", "OnThreadTerminate", "OnThreadBindToApartment", "OnThreadUnBind", "OnThreadWorkEnque", "OnThreadWorkPrivate", "OnThreadWorkPublic", "OnThreadWorkRedirect", "OnThreadWorkReject", "OnThreadAssignApartment", "OnThreadUnassignApartment"]

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} dwThread 
     * @param {Integer} dwTheadCnt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadstart
     */
    OnThreadStart(pInfo, ThreadID, dwThread, dwTheadCnt) {
        result := ComCall(3, this, "ptr", pInfo, "uint", ThreadID, "uint", dwThread, "uint", dwTheadCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} dwThread 
     * @param {Integer} dwTheadCnt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadterminate
     */
    OnThreadTerminate(pInfo, ThreadID, dwThread, dwTheadCnt) {
        result := ComCall(4, this, "ptr", pInfo, "uint", ThreadID, "uint", dwThread, "uint", dwTheadCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} AptID 
     * @param {Integer} dwActCnt 
     * @param {Integer} dwLowCnt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadbindtoapartment
     */
    OnThreadBindToApartment(pInfo, ThreadID, AptID, dwActCnt, dwLowCnt) {
        result := ComCall(5, this, "ptr", pInfo, "uint", ThreadID, "uint", AptID, "uint", dwActCnt, "uint", dwLowCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} AptID 
     * @param {Integer} dwActCnt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadunbind
     */
    OnThreadUnBind(pInfo, ThreadID, AptID, dwActCnt) {
        result := ComCall(6, this, "ptr", pInfo, "uint", ThreadID, "uint", AptID, "uint", dwActCnt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @returns {HRESULT} 
     */
    OnThreadWorkEnque(pInfo, ThreadID, MsgWorkID, QueueLen) {
        result := ComCall(7, this, "ptr", pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @returns {HRESULT} 
     */
    OnThreadWorkPrivate(pInfo, ThreadID, MsgWorkID) {
        result := ComCall(8, this, "ptr", pInfo, "uint", ThreadID, "uint", MsgWorkID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @returns {HRESULT} 
     */
    OnThreadWorkPublic(pInfo, ThreadID, MsgWorkID, QueueLen) {
        result := ComCall(9, this, "ptr", pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @param {Integer} ThreadNum 
     * @returns {HRESULT} 
     */
    OnThreadWorkRedirect(pInfo, ThreadID, MsgWorkID, QueueLen, ThreadNum) {
        result := ComCall(10, this, "ptr", pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "uint", ThreadNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} ThreadID 
     * @param {Integer} MsgWorkID 
     * @param {Integer} QueueLen 
     * @returns {HRESULT} 
     */
    OnThreadWorkReject(pInfo, ThreadID, MsgWorkID, QueueLen) {
        result := ComCall(11, this, "ptr", pInfo, "uint", ThreadID, "uint", MsgWorkID, "uint", QueueLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Pointer<Guid>} guidActivity 
     * @param {Integer} AptID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadassignapartment
     */
    OnThreadAssignApartment(pInfo, guidActivity, AptID) {
        result := ComCall(12, this, "ptr", pInfo, "ptr", guidActivity, "uint", AptID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo 
     * @param {Integer} AptID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomthreadevents-onthreadunassignapartment
     */
    OnThreadUnassignApartment(pInfo, AptID) {
        result := ComCall(13, this, "ptr", pInfo, "uint", AptID, "HRESULT")
        return result
    }
}
