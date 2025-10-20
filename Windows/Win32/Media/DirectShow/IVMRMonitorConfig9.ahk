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
     * 
     * @param {Integer} uDev 
     * @returns {HRESULT} 
     */
    SetMonitor(uDev) {
        result := ComCall(3, this, "uint", uDev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puDev 
     * @returns {HRESULT} 
     */
    GetMonitor(puDev) {
        result := ComCall(4, this, "uint*", puDev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uDev 
     * @returns {HRESULT} 
     */
    SetDefaultMonitor(uDev) {
        result := ComCall(5, this, "uint", uDev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puDev 
     * @returns {HRESULT} 
     */
    GetDefaultMonitor(puDev) {
        result := ComCall(6, this, "uint*", puDev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VMR9MonitorInfo>} pInfo 
     * @param {Integer} dwMaxInfoArraySize 
     * @param {Pointer<UInt32>} pdwNumDevices 
     * @returns {HRESULT} 
     */
    GetAvailableMonitors(pInfo, dwMaxInfoArraySize, pdwNumDevices) {
        result := ComCall(7, this, "ptr", pInfo, "uint", dwMaxInfoArraySize, "uint*", pdwNumDevices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
