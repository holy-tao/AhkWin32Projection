#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class IAudioProcessingObjectRTQueueService extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} workQueueId 
     * @returns {HRESULT} 
     */
    GetRealTimeWorkQueue(workQueueId) {
        result := ComCall(3, this, "uint*", workQueueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
