#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMDeviceControl interface provides methods for controlling playback on a device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevicecontrol
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDeviceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDeviceControl
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a04-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "GetCapabilities", "Play", "Record", "Pause", "Resume", "Stop", "Seek"]

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-getstatus
     */
    GetStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCapabilitiesMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-getcapabilities
     */
    GetCapabilities(pdwCapabilitiesMask) {
        pdwCapabilitiesMaskMarshal := pdwCapabilitiesMask is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCapabilitiesMaskMarshal, pdwCapabilitiesMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-play
     */
    Play() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-record
     */
    Record(pFormat) {
        result := ComCall(6, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-pause
     */
    Pause() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-resume
     */
    Resume() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-stop
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
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicecontrol-seek
     */
    Seek(fuMode, nOffset) {
        result := ComCall(10, this, "uint", fuMode, "int", nOffset, "HRESULT")
        return result
    }
}
