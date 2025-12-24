#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_QUERY_VIDEO_MEMORY_INFO.ahk
#Include .\IDXGIAdapter2.ahk

/**
 * This interface adds some memory residency methods, for budgeting and reserving physical memory.
 * @remarks
 * 
 * For more details, refer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/residency">Residency</a> section of the D3D12 documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nn-dxgi1_4-idxgiadapter3
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIAdapter3 extends IDXGIAdapter2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIAdapter3
     * @type {Guid}
     */
    static IID => Guid("{645967a4-1392-4310-a798-8053ce3e93fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterHardwareContentProtectionTeardownStatusEvent", "UnregisterHardwareContentProtectionTeardownStatus", "QueryVideoMemoryInfo", "SetVideoMemoryReservation", "RegisterVideoMemoryBudgetChangeNotificationEvent", "UnregisterVideoMemoryBudgetChangeNotification"]

    /**
     * Registers to receive notification of hardware content protection teardown events.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * A handle to the event object that the operating system sets when hardware content protection teardown occurs. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregisterhardwarecontentprotectionteardownstatus">IDXGIAdapter3::UnregisterHardwareContentProtectionTeardownStatus</a> method to unregister the notification event that <i>hEvent</i> specifies.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent
     */
    RegisterHardwareContentProtectionTeardownStatusEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(12, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters an event to stop it from receiving notification of hardware content protection teardown events.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregisterhardwarecontentprotectionteardownstatus
     */
    UnregisterHardwareContentProtectionTeardownStatus(dwCookie) {
        ComCall(13, this, "uint", dwCookie)
    }

    /**
     * This method informs the process of the current budget and process usage.
     * @param {Integer} NodeIndex Type: <b>UINT</b>
     * 
     * Specifies the device's physical adapter for which the video memory information is queried.
     *             For single-GPU operation, set this to zero.
     *             If there are multiple GPU nodes, set this to the index of the node (the device's physical adapter) for which the video memory information is queried.
     *             See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {Integer} MemorySegmentGroup Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_memory_segment_group">DXGI_MEMORY_SEGMENT_GROUP</a></b>
     * 
     * Specifies a DXGI_MEMORY_SEGMENT_GROUP that identifies the group as local or non-local.
     * @returns {DXGI_QUERY_VIDEO_MEMORY_INFO} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/ns-dxgi1_4-dxgi_query_video_memory_info">DXGI_QUERY_VIDEO_MEMORY_INFO</a>*</b>
     * 
     * Fills in a DXGI_QUERY_VIDEO_MEMORY_INFO structure with the current values.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo
     */
    QueryVideoMemoryInfo(NodeIndex, MemorySegmentGroup) {
        pVideoMemoryInfo := DXGI_QUERY_VIDEO_MEMORY_INFO()
        result := ComCall(14, this, "uint", NodeIndex, "int", MemorySegmentGroup, "ptr", pVideoMemoryInfo, "HRESULT")
        return pVideoMemoryInfo
    }

    /**
     * This method sends the minimum required physical memory for an application, to the OS.
     * @param {Integer} NodeIndex Type: <b>UINT</b>
     * 
     * Specifies the device's physical adapter for which the video memory information is being set.
     *             For single-GPU operation, set this to zero.
     *             If there are multiple GPU nodes, set this to the index of the node (the device's physical adapter) for which the video memory information is being set.
     *             See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {Integer} MemorySegmentGroup Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_memory_segment_group">DXGI_MEMORY_SEGMENT_GROUP</a></b>
     * 
     * Specifies a DXGI_MEMORY_SEGMENT_GROUP that identifies the group as local or non-local.
     * @param {Integer} Reservation Type: <b>UINT64</b>
     * 
     * Specifies a UINT64 that sets the minimum required physical memory, in bytes.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; an error code otherwise.
     *             For a list of error codes, see <a href="/windows/win32/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiadapter3-setvideomemoryreservation
     */
    SetVideoMemoryReservation(NodeIndex, MemorySegmentGroup, Reservation) {
        result := ComCall(15, this, "uint", NodeIndex, "int", MemorySegmentGroup, "uint", Reservation, "HRESULT")
        return result
    }

    /**
     * This method establishes a correlation between a CPU synchronization object and the budget change event.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * Specifies a HANDLE for the event.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a> method returns this value.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiadapter3-registervideomemorybudgetchangenotificationevent
     */
    RegisterVideoMemoryBudgetChangeNotificationEvent(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(16, this, "ptr", hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * This method stops notifying a CPU synchronization object whenever a budget change occurs. An application may switch back to polling the information regularly.
     * @remarks
     * 
     * An application may switch back to polling for the information regularly.
     * 
     * 
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregistervideomemorybudgetchangenotification
     */
    UnregisterVideoMemoryBudgetChangeNotification(dwCookie) {
        ComCall(17, this, "uint", dwCookie)
    }
}
