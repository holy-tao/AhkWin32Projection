#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies a pipeline object to register itself with the Multimedia Class Scheduler Service (MMCSS).
 * @remarks
 * 
 * Media Foundation provides a mechanism for applications to associate branches in the topology with MMCSS tasks. A topology branch is defined by a source node in the topology and all of the nodes downstream from it. An application registers a topology branch with MMCSS by setting the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-workqueue-id-attribute">MF_TOPONODE_WORKQUEUE_ID</a> attribute on the source node and then calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfworkqueueservices-beginregistertopologyworkqueueswithmmcss">IMFWorkQueueServices::BeginRegisterTopologyWorkQueuesWithMMCSS</a>.
 * 
 * When the application registers a topology branch with MMCSS, the Media Session queries every pipeline object in that branch for the <b>IMFRealTimeClient</b> interface. If the object exposes the interface, the Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfrealtimeclient-registerthreads">RegisterThreads</a>.
 * 
 * When the application unregisters the topology branch, the Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfrealtimeclient-unregisterthreads">UnregisterThreads</a>.
 * 
 * If a pipeline object creates its own worker threads but does not implement this interface, it can cause priority inversions in the Media Foundation pipeline, because high-priority processing threads might be blocked while waiting for the component to process data on a thread with lower priority.
 * 
 * Pipeline objects that do not create worker threads do not need to implement this interface.
 * 
 * In Windows 8, this interface is extended with <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfrealtimeclientex">IMFRealTimeClientEx</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfrealtimeclient
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRealTimeClient extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRealTimeClient
     * @type {Guid}
     */
    static IID => Guid("{2347d60b-3fb5-480c-8803-8df3adcd3ef0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterThreads", "UnregisterThreads", "SetWorkQueue"]

    /**
     * 
     * @param {Integer} dwTaskIndex 
     * @param {PWSTR} wszClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclient-registerthreads
     */
    RegisterThreads(dwTaskIndex, wszClass) {
        wszClass := wszClass is String ? StrPtr(wszClass) : wszClass

        result := ComCall(3, this, "uint", dwTaskIndex, "ptr", wszClass, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclient-unregisterthreads
     */
    UnregisterThreads() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWorkQueueId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfrealtimeclient-setworkqueue
     */
    SetWorkQueue(dwWorkQueueId) {
        result := ComCall(5, this, "uint", dwWorkQueueId, "HRESULT")
        return result
    }
}
