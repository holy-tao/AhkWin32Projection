#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPDeviceControl interface provides methods for controlling devices.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevicecontrol
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDeviceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDeviceControl
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a14-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDCStatus", "GetCapabilities", "Play", "Record", "Pause", "Resume", "Stop", "Seek"]

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-getdcstatus
     */
    GetDCStatus(pdwStatus) {
        result := ComCall(3, this, "uint*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCapabilitiesMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-getcapabilities
     */
    GetCapabilities(pdwCapabilitiesMask) {
        result := ComCall(4, this, "uint*", pdwCapabilitiesMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-play
     */
    Play() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-record
     */
    Record(pFormat) {
        result := ComCall(6, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-pause
     */
    Pause() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-resume
     */
    Resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-stop
     */
    Stop() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fuMode 
     * @param {Integer} nOffset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdspdevicecontrol-seek
     */
    Seek(fuMode, nOffset) {
        result := ComCall(10, this, "uint", fuMode, "int", nOffset, "HRESULT")
        return result
    }
}
