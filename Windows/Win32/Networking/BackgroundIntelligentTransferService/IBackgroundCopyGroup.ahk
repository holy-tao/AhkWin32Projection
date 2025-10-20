#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IBackgroundCopyGroup interface to manage a group. A group contains download jobs. For example, add a job to the group, set the properties of the group, and start and stop the group in the download queue.
 * @see https://docs.microsoft.com/windows/win32/api//qmgr/nn-qmgr-ibackgroundcopygroup
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyGroup extends IUnknown{
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
     * 
     * @param {Integer} propID 
     * @param {Pointer<VARIANT>} pvarVal 
     * @returns {HRESULT} 
     */
    GetProp(propID, pvarVal) {
        result := ComCall(3, this, "int", propID, "ptr", pvarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propID 
     * @param {Pointer<VARIANT>} pvarVal 
     * @returns {HRESULT} 
     */
    SetProp(propID, pvarVal) {
        result := ComCall(4, this, "int", propID, "ptr", pvarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwProgress 
     * @returns {HRESULT} 
     */
    GetProgress(dwFlags, pdwProgress) {
        result := ComCall(5, this, "uint", dwFlags, "uint*", pdwProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @param {Pointer<UInt32>} pdwJobIndex 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus, pdwJobIndex) {
        result := ComCall(6, this, "uint*", pdwStatus, "uint*", pdwJobIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} jobID 
     * @param {Pointer<IBackgroundCopyJob1>} ppJob 
     * @returns {HRESULT} 
     */
    GetJob(jobID, ppJob) {
        result := ComCall(7, this, "ptr", jobID, "ptr", ppJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SuspendGroup() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResumeGroup() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelGroup() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    get_Size(pdwSize) {
        result := ComCall(11, this, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidGroupID 
     * @returns {HRESULT} 
     */
    get_GroupID(pguidGroupID) {
        result := ComCall(12, this, "ptr", pguidGroupID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidJobID 
     * @param {Pointer<IBackgroundCopyJob1>} ppJob 
     * @returns {HRESULT} 
     */
    CreateJob(guidJobID, ppJob) {
        result := ComCall(13, this, "ptr", guidJobID, "ptr", ppJob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IEnumBackgroundCopyJobs1>} ppEnumJobs 
     * @returns {HRESULT} 
     */
    EnumJobs(dwFlags, ppEnumJobs) {
        result := ComCall(14, this, "uint", dwFlags, "ptr", ppEnumJobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SwitchToForeground() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    QueryNewJobInterface(iid, pUnk) {
        result := ComCall(16, this, "ptr", iid, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    SetNotificationPointer(iid, pUnk) {
        result := ComCall(17, this, "ptr", iid, "ptr", pUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
