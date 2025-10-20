#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMonitorConfig interface is implemented by the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrmonitorconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMonitorConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMonitorConfig
     * @type {Guid}
     */
    static IID => Guid("{9cf0b1b6-fbaa-4b7f-88cf-cf1f130a0dce}")

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
     * @param {Pointer<VMRGUID>} pGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-setmonitor
     */
    SetMonitor(pGUID) {
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMRGUID>} pGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-getmonitor
     */
    GetMonitor(pGUID) {
        result := ComCall(4, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMRGUID>} pGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-setdefaultmonitor
     */
    SetDefaultMonitor(pGUID) {
        result := ComCall(5, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMRGUID>} pGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-getdefaultmonitor
     */
    GetDefaultMonitor(pGUID) {
        result := ComCall(6, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VMRMONITORINFO>} pInfo 
     * @param {Integer} dwMaxInfoArraySize 
     * @param {Pointer<Integer>} pdwNumDevices 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrmonitorconfig-getavailablemonitors
     */
    GetAvailableMonitors(pInfo, dwMaxInfoArraySize, pdwNumDevices) {
        result := ComCall(7, this, "ptr", pInfo, "uint", dwMaxInfoArraySize, "uint*", pdwNumDevices, "HRESULT")
        return result
    }
}
