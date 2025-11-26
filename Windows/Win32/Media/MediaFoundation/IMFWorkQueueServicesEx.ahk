#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFWorkQueueServices.ahk

/**
 * Extends the IMFWorkQueueServices interface.
 * @remarks
 * 
 * This interface allows applications to control
 * both platform and topology work queues.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfworkqueueservices">IMFWorkQueueServices</a> can be obtained from the session by querying     for the <b>MF_WORKQUEUE_SERVICES</b> service.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfworkqueueservicesex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFWorkQueueServicesEx extends IMFWorkQueueServices{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFWorkQueueServicesEx
     * @type {Guid}
     */
    static IID => Guid("{96bf961b-40fe-42f1-ba9d-320238b49700}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTopologyWorkQueueMMCSSPriority", "BeginRegisterPlatformWorkQueueWithMMCSSEx", "GetPlatformWorkQueueMMCSSPriority"]

    /**
     * Retrieves the Multimedia Class Scheduler Service (MMCSS) string associated with the given topology work queue.
     * @param {Integer} dwTopologyWorkQueueId The id of the topology work queue.
     * @returns {Integer} Pointer to the buffer the work queue's MMCSS task id will be copied to.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservicesex-gettopologyworkqueuemmcsspriority
     */
    GetTopologyWorkQueueMMCSSPriority(dwTopologyWorkQueueId) {
        result := ComCall(15, this, "uint", dwTopologyWorkQueueId, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }

    /**
     * Registers a platform work queue with Multimedia Class Scheduler Service (MMCSS) using the specified class and task id.
     * @param {Integer} dwPlatformWorkQueue The id of one of the standard platform work queues.
     * @param {PWSTR} wszClass The MMCSS class which the work queue should be registered with.
     * @param {Integer} dwTaskId The task id which the work queue should be registered with. If <i>dwTaskId</i> is 0, a new MMCSS bucket will be created.
     * @param {Integer} lPriority The priority.
     * @param {IMFAsyncCallback} pCallback Standard callback used for async operations in Media Foundation.
     * @param {IUnknown} pState Standard state used for async operations in Media Foundation.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservicesex-beginregisterplatformworkqueuewithmmcssex
     */
    BeginRegisterPlatformWorkQueueWithMMCSSEx(dwPlatformWorkQueue, wszClass, dwTaskId, lPriority, pCallback, pState) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(16, this, "uint", dwPlatformWorkQueue, "ptr", wszClass, "uint", dwTaskId, "int", lPriority, "ptr", pCallback, "ptr", pState, "HRESULT")
        return result
    }

    /**
     * Gets the priority of the Multimedia Class Scheduler Service (MMCSS) priority associated with the specified platform work queue.
     * @param {Integer} dwPlatformWorkQueueId Topology work queue id for which the info will be returned.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfworkqueueservicesex-getplatformworkqueuemmcsspriority
     */
    GetPlatformWorkQueueMMCSSPriority(dwPlatformWorkQueueId) {
        result := ComCall(17, this, "uint", dwPlatformWorkQueueId, "int*", &plPriority := 0, "HRESULT")
        return plPriority
    }
}
