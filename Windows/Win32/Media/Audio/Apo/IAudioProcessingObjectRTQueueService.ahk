#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a realtime work queue service for APOs.
 * @remarks
 * Get an instance of this interface by calling [QueryService](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)) on the object in the *pServiceProvider* field of the [APOInitSystemEffects3](nn-audioengineextensionapo-iaudiosystemeffects3.md) structure passed in the *pbyData* parameter to [IAudioProcessingObject::Initialize](../audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-initialize.md). Specify **SID_AudioProcessingObjectRTQueue** as the identifier in the *guidService* parameter.
 * 
 * For information on using the real-time work queue APIs, see [rtworkq.h header](../rtworkq).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudioprocessingobjectrtqueueservice
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct IAudioProcessingObjectRTQueueService extends IUnknown {
    /**
     * The interface identifier for IAudioProcessingObjectRTQueueService
     * @type {Guid}
     */
    static IID := Guid("{acd65e2f-955b-4b57-b9bf-ac297bb752c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioProcessingObjectRTQueueService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRealTimeWorkQueue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioProcessingObjectRTQueueService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID of a work queue that the APO can use to schedule tasks that need to run at a real-time priority.
     * @remarks
     * The returned work queue ID is used with the real-time work queue APIs. For more information see [rtworkq.h header](../rtworkq). 
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @returns {Integer} A DWORD containing the work queue ID.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectrtqueueservice-getrealtimeworkqueue
     */
    GetRealTimeWorkQueue() {
        result := ComCall(3, this, "uint*", &workQueueId := 0, "HRESULT")
        return workQueueId
    }

    Query(iid) {
        if (IAudioProcessingObjectRTQueueService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRealTimeWorkQueue := CallbackCreate(GetMethod(implObj, "GetRealTimeWorkQueue"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRealTimeWorkQueue)
    }
}
