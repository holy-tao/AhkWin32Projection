#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {HANDLE} hEvent 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registerhardwarecontentprotectionteardownstatusevent
     */
    RegisterHardwareContentProtectionTeardownStatusEvent(hEvent, pdwCookie) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(12, this, "ptr", hEvent, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregisterhardwarecontentprotectionteardownstatus
     */
    UnregisterHardwareContentProtectionTeardownStatus(dwCookie) {
        ComCall(13, this, "uint", dwCookie)
    }

    /**
     * 
     * @param {Integer} NodeIndex 
     * @param {Integer} MemorySegmentGroup 
     * @param {Pointer<DXGI_QUERY_VIDEO_MEMORY_INFO>} pVideoMemoryInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-queryvideomemoryinfo
     */
    QueryVideoMemoryInfo(NodeIndex, MemorySegmentGroup, pVideoMemoryInfo) {
        result := ComCall(14, this, "uint", NodeIndex, "int", MemorySegmentGroup, "ptr", pVideoMemoryInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NodeIndex 
     * @param {Integer} MemorySegmentGroup 
     * @param {Integer} Reservation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-setvideomemoryreservation
     */
    SetVideoMemoryReservation(NodeIndex, MemorySegmentGroup, Reservation) {
        result := ComCall(15, this, "uint", NodeIndex, "int", MemorySegmentGroup, "uint", Reservation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-registervideomemorybudgetchangenotificationevent
     */
    RegisterVideoMemoryBudgetChangeNotificationEvent(hEvent, pdwCookie) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(16, this, "ptr", hEvent, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_4/nf-dxgi1_4-idxgiadapter3-unregistervideomemorybudgetchangenotification
     */
    UnregisterVideoMemoryBudgetChangeNotification(dwCookie) {
        ComCall(17, this, "uint", dwCookie)
    }
}
