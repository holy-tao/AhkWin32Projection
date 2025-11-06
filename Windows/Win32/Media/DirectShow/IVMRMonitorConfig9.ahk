#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMonitorConfig9 interface is implemented by the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
  * Include DShow.h and D3d9.h before Vmr9.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/nn-vmr9-ivmrmonitorconfig9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMonitorConfig9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMonitorConfig9
     * @type {Guid}
     */
    static IID => Guid("{46c2e457-8ba0-4eef-b80b-0680f0978749}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMonitor", "GetMonitor", "SetDefaultMonitor", "GetDefaultMonitor", "GetAvailableMonitors"]

    /**
     * 
     * @param {Integer} uDev 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmonitorconfig9-setmonitor
     */
    SetMonitor(uDev) {
        result := ComCall(3, this, "uint", uDev, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmonitorconfig9-getmonitor
     */
    GetMonitor() {
        result := ComCall(4, this, "uint*", &puDev := 0, "HRESULT")
        return puDev
    }

    /**
     * 
     * @param {Integer} uDev 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmonitorconfig9-setdefaultmonitor
     */
    SetDefaultMonitor(uDev) {
        result := ComCall(5, this, "uint", uDev, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmonitorconfig9-getdefaultmonitor
     */
    GetDefaultMonitor() {
        result := ComCall(6, this, "uint*", &puDev := 0, "HRESULT")
        return puDev
    }

    /**
     * 
     * @param {Pointer<VMR9MonitorInfo>} pInfo 
     * @param {Integer} dwMaxInfoArraySize 
     * @param {Pointer<Integer>} pdwNumDevices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrmonitorconfig9-getavailablemonitors
     */
    GetAvailableMonitors(pInfo, dwMaxInfoArraySize, pdwNumDevices) {
        pdwNumDevicesMarshal := pdwNumDevices is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pInfo, "uint", dwMaxInfoArraySize, pdwNumDevicesMarshal, pdwNumDevices, "HRESULT")
        return result
    }
}
