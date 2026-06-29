#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDXGIAdapter2.ahk" { IDXGIAdapter2 }
#Import ".\DXGI_MEMORY_SEGMENT_GROUP.ahk" { DXGI_MEMORY_SEGMENT_GROUP }
#Import ".\DXGI_QUERY_VIDEO_MEMORY_INFO.ahk" { DXGI_QUERY_VIDEO_MEMORY_INFO }

/**
 * This interface adds some memory residency methods, for budgeting and reserving physical memory.
 * @remarks
 * For more details, refer to the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/residency">Residency</a> section of the D3D12 documentation.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgiadapter3
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIAdapter3 extends IDXGIAdapter2 {
    /**
     * The interface identifier for IDXGIAdapter3
     * @type {Guid}
     */
    static IID := Guid("{645967a4-1392-4310-a798-8053ce3e93fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIAdapter3 interfaces
    */
    struct Vtbl extends IDXGIAdapter2.Vtbl {
        RegisterHardwareContentProtectionTeardownStatusEvent : IntPtr
        UnregisterHardwareContentProtectionTeardownStatus    : IntPtr
        QueryVideoMemoryInfo                                 : IntPtr
        SetVideoMemoryReservation                            : IntPtr
        RegisterVideoMemoryBudgetChangeNotificationEvent     : IntPtr
        UnregisterVideoMemoryBudgetChangeNotification        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIAdapter3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Registers to receive notification of hardware content protection teardown events.
     * @remarks
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-getcontentprotectioncaps">ID3D11VideoDevice::GetContentProtectionCaps</a>() to check for the presence of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_content_protection_caps">D3D11_CONTENT_PROTECTION_CAPS_HARDWARE_TEARDOWN</a>  capability to know whether the hardware contains an automatic teardown mechanism.
     * 
     * After the event is signaled, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videocontext1-checkcryptosessionstatus">ID3D11VideoContext1::CheckCryptoSessionStatus</a> to determine the impact of the hardware teardown for a specific <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> interface.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * A handle to the event object that the operating system sets when hardware content protection teardown occurs. The <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-createeventa">CreateEvent</a> or <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-openeventa">OpenEvent</a> function returns this handle.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a key value that an application can pass to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregisterhardwarecontentprotectionteardownstatus">IDXGIAdapter3::UnregisterHardwareContentProtectionTeardownStatus</a> method to unregister the notification event that <i>hEvent</i> specifies.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent
     */
    RegisterHardwareContentProtectionTeardownStatusEvent(hEvent) {
        result := ComCall(12, this, HANDLE, hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Unregisters an event to stop it from receiving notification of hardware content protection teardown events.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregisterhardwarecontentprotectionteardownstatus
     */
    UnregisterHardwareContentProtectionTeardownStatus(dwCookie) {
        ComCall(13, this, "uint", dwCookie)
    }

    /**
     * This method informs the process of the current budget and process usage.
     * @remarks
     * Applications must explicitly manage their usage of physical memory explicitly and keep usage within the budget assigned to the application process.
     *           Processes that cannot kept their usage within their assigned budgets will likely experience stuttering, as they are intermittently frozen and paged-out to allow other processes to run.
     * @param {Integer} NodeIndex Type: <b>UINT</b>
     * 
     * Specifies the device's physical adapter for which the video memory information is queried.
     *             For single-GPU operation, set this to zero.
     *             If there are multiple GPU nodes, set this to the index of the node (the device's physical adapter) for which the video memory information is queried.
     *             See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {DXGI_MEMORY_SEGMENT_GROUP} MemorySegmentGroup Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_memory_segment_group">DXGI_MEMORY_SEGMENT_GROUP</a></b>
     * 
     * Specifies a DXGI_MEMORY_SEGMENT_GROUP that identifies the group as local or non-local.
     * @returns {DXGI_QUERY_VIDEO_MEMORY_INFO} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/ns-dxgi1_4-dxgi_query_video_memory_info">DXGI_QUERY_VIDEO_MEMORY_INFO</a>*</b>
     * 
     * Fills in a DXGI_QUERY_VIDEO_MEMORY_INFO structure with the current values.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo
     */
    QueryVideoMemoryInfo(NodeIndex, MemorySegmentGroup) {
        pVideoMemoryInfo := DXGI_QUERY_VIDEO_MEMORY_INFO()
        result := ComCall(14, this, "uint", NodeIndex, DXGI_MEMORY_SEGMENT_GROUP, MemorySegmentGroup, DXGI_QUERY_VIDEO_MEMORY_INFO.Ptr, pVideoMemoryInfo, "HRESULT")
        return pVideoMemoryInfo
    }

    /**
     * This method sends the minimum required physical memory for an application, to the OS.
     * @remarks
     * Applications are encouraged to set a video reservation to denote the amount of physical memory they cannot go without.
     *           This value helps the OS quickly minimize the impact of large memory pressure situations.
     * @param {Integer} NodeIndex Type: <b>UINT</b>
     * 
     * Specifies the device's physical adapter for which the video memory information is being set.
     *             For single-GPU operation, set this to zero.
     *             If there are multiple GPU nodes, set this to the index of the node (the device's physical adapter) for which the video memory information is being set.
     *             See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {DXGI_MEMORY_SEGMENT_GROUP} MemorySegmentGroup Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_memory_segment_group">DXGI_MEMORY_SEGMENT_GROUP</a></b>
     * 
     * Specifies a DXGI_MEMORY_SEGMENT_GROUP that identifies the group as local or non-local.
     * @param {Integer} Reservation Type: <b>UINT64</b>
     * 
     * Specifies a UINT64 that sets the minimum required physical memory, in bytes.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns S_OK if successful; an error code otherwise.
     *             For a list of error codes, see <a href="https://docs.microsoft.com/windows/win32/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-setvideomemoryreservation
     */
    SetVideoMemoryReservation(NodeIndex, MemorySegmentGroup, Reservation) {
        result := ComCall(15, this, "uint", NodeIndex, DXGI_MEMORY_SEGMENT_GROUP, MemorySegmentGroup, "uint", Reservation, "HRESULT")
        return result
    }

    /**
     * This method establishes a correlation between a CPU synchronization object and the budget change event.
     * @remarks
     * Instead of calling <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo">QueryVideoMemoryInfo</a> regularly, applications can use CPU synchronization objects to efficiently wake threads when budget changes occur.
     * @param {HANDLE} hEvent Type: <b>HANDLE</b>
     * 
     * Specifies a HANDLE for the event.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a> method returns this value.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registervideomemorybudgetchangenotificationevent
     */
    RegisterVideoMemoryBudgetChangeNotificationEvent(hEvent) {
        result := ComCall(16, this, HANDLE, hEvent, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * This method stops notifying a CPU synchronization object whenever a budget change occurs. An application may switch back to polling the information regularly.
     * @remarks
     * An application may switch back to polling for the information regularly.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * 
     * A key value for the window or event to unregister. The  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent">IDXGIAdapter3::RegisterHardwareContentProtectionTeardownStatusEvent</a> method returns this value.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregistervideomemorybudgetchangenotification
     */
    UnregisterVideoMemoryBudgetChangeNotification(dwCookie) {
        ComCall(17, this, "uint", dwCookie)
    }

    Query(iid) {
        if (IDXGIAdapter3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterHardwareContentProtectionTeardownStatusEvent := CallbackCreate(GetMethod(implObj, "RegisterHardwareContentProtectionTeardownStatusEvent"), flags, 3)
        this.vtbl.UnregisterHardwareContentProtectionTeardownStatus := CallbackCreate(GetMethod(implObj, "UnregisterHardwareContentProtectionTeardownStatus"), flags, 2)
        this.vtbl.QueryVideoMemoryInfo := CallbackCreate(GetMethod(implObj, "QueryVideoMemoryInfo"), flags, 4)
        this.vtbl.SetVideoMemoryReservation := CallbackCreate(GetMethod(implObj, "SetVideoMemoryReservation"), flags, 4)
        this.vtbl.RegisterVideoMemoryBudgetChangeNotificationEvent := CallbackCreate(GetMethod(implObj, "RegisterVideoMemoryBudgetChangeNotificationEvent"), flags, 3)
        this.vtbl.UnregisterVideoMemoryBudgetChangeNotification := CallbackCreate(GetMethod(implObj, "UnregisterVideoMemoryBudgetChangeNotification"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterHardwareContentProtectionTeardownStatusEvent)
        CallbackFree(this.vtbl.UnregisterHardwareContentProtectionTeardownStatus)
        CallbackFree(this.vtbl.QueryVideoMemoryInfo)
        CallbackFree(this.vtbl.SetVideoMemoryReservation)
        CallbackFree(this.vtbl.RegisterVideoMemoryBudgetChangeNotificationEvent)
        CallbackFree(this.vtbl.UnregisterVideoMemoryBudgetChangeNotification)
    }
}
