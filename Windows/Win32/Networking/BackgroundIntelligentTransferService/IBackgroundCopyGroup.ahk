#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IBackgroundCopyJob1.ahk
#Include .\IEnumBackgroundCopyJobs1.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyGroup interface to manage a group. A group contains download jobs. For example, add a job to the group, set the properties of the group, and start and stop the group in the download queue.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ibackgroundcopygroup
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyGroup
     * @type {Guid}
     */
    static IID => Guid("{1ded80a7-53ea-424f-8a04-17fea9adc4f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProp", "SetProp", "GetProgress", "GetStatus", "GetJob", "SuspendGroup", "ResumeGroup", "CancelGroup", "get_Size", "get_GroupID", "CreateJob", "EnumJobs", "SwitchToForeground", "QueryNewJobInterface", "SetNotificationPointer"]

    /**
     * 
     * @param {Integer} propID 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getprop
     */
    GetProp(propID) {
        pvarVal := VARIANT()
        result := ComCall(3, this, "int", propID, "ptr", pvarVal, "HRESULT")
        return pvarVal
    }

    /**
     * 
     * @param {Integer} propID 
     * @param {Pointer<VARIANT>} pvarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-setprop
     */
    SetProp(propID, pvarVal) {
        result := ComCall(4, this, "int", propID, "ptr", pvarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getprogress
     */
    GetProgress(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "uint*", &pdwProgress := 0, "HRESULT")
        return pdwProgress
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @param {Pointer<Integer>} pdwJobIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getstatus
     */
    GetStatus(pdwStatus, pdwJobIndex) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        pdwJobIndexMarshal := pdwJobIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pdwStatusMarshal, pdwStatus, pdwJobIndexMarshal, pdwJobIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} jobID 
     * @returns {IBackgroundCopyJob1} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-getjob
     */
    GetJob(jobID) {
        result := ComCall(7, this, "ptr", jobID, "ptr*", &ppJob := 0, "HRESULT")
        return IBackgroundCopyJob1(ppJob)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-suspendgroup
     */
    SuspendGroup() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-resumegroup
     */
    ResumeGroup() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-cancelgroup
     */
    CancelGroup() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-get_size
     */
    get_Size() {
        result := ComCall(11, this, "uint*", &pdwSize := 0, "HRESULT")
        return pdwSize
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-get_groupid
     */
    get_GroupID() {
        pguidGroupID := Guid()
        result := ComCall(12, this, "ptr", pguidGroupID, "HRESULT")
        return pguidGroupID
    }

    /**
     * 
     * @param {Guid} guidJobID 
     * @returns {IBackgroundCopyJob1} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-createjob
     */
    CreateJob(guidJobID) {
        result := ComCall(13, this, "ptr", guidJobID, "ptr*", &ppJob := 0, "HRESULT")
        return IBackgroundCopyJob1(ppJob)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IEnumBackgroundCopyJobs1} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-enumjobs
     */
    EnumJobs(dwFlags) {
        result := ComCall(14, this, "uint", dwFlags, "ptr*", &ppEnumJobs := 0, "HRESULT")
        return IEnumBackgroundCopyJobs1(ppEnumJobs)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nf-qmgr-ibackgroundcopygroup-switchtoforeground
     */
    SwitchToForeground() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopygroup
     */
    QueryNewJobInterface(iid) {
        result := ComCall(16, this, "ptr", iid, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qmgr/nn-qmgr-ibackgroundcopygroup
     */
    SetNotificationPointer(iid, pUnk) {
        result := ComCall(17, this, "ptr", iid, "ptr", pUnk, "HRESULT")
        return result
    }
}
