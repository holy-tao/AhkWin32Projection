#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nn-audioengineextensionapo-iaudioprocessingobjectrtqueueservice
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
     * 
     * @param {Pointer<Integer>} workQueueId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioengineextensionapo/nf-audioengineextensionapo-iaudioprocessingobjectrtqueueservice-getrealtimeworkqueue
     */
    GetRealTimeWorkQueue(workQueueId) {
        result := ComCall(3, this, "uint*", workQueueId, "HRESULT")
        return result
    }
}
