#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a realtime work queue service for APOs.
 * @remarks
 * Get an instance of this interface by calling [QueryService](/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)) on the object in the *pServiceProvider* field of the [APOInitSystemEffects3](nn-audioengineextensionapo-iaudiosystemeffects3.md) structure passed in the *pbyData* parameter to [IAudioProcessingObject::Initialize](../audioenginebaseapo/nf-audioenginebaseapo-iaudioprocessingobject-initialize.md). Specify **SID_AudioProcessingObjectRTQueue** as the identifier in the *guidService* parameter.
 * 
 * For information on using the real-time work queue APIs, see [rtworkq.h header](../rtworkq).
 * 
 * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
 * @see https://learn.microsoft.com/windows/win32/api//content/audioengineextensionapo/nn-audioengineextensionapo-iaudioprocessingobjectrtqueueservice
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectRTQueueService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioProcessingObjectRTQueueService
     * @type {Guid}
     */
    static IID => Guid("{acd65e2f-955b-4b57-b9bf-ac297bb752c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRealTimeWorkQueue"]

    /**
     * Gets the ID of a work queue that the APO can use to schedule tasks that need to run at a real-time priority.
     * @remarks
     * The returned work queue ID is used with the real-time work queue APIs. For more information see [rtworkq.h header](../rtworkq). 
     * 
     * For more information on the Windows 11 APIs for the Audio Processing Objects (APOs) that can ship with audio drivers, see [Windows 11 APIs for Audio Processing Objects](/windows-hardware/drivers/audio/windows-11-apis-for-audio-processing-objects).
     * @returns {Integer} A DWORD containing the work queue ID.
     * @see https://learn.microsoft.com/windows/win32/api//content/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectrtqueueservice-getrealtimeworkqueue
     */
    GetRealTimeWorkQueue() {
        result := ComCall(3, this, "uint*", &workQueueId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return workQueueId
    }
}
