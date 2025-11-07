#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceValues.ahk
#Include .\IPortableDeviceContent.ahk
#Include .\IPortableDeviceCapabilities.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDevice interface provides access to a portable device.
 * @remarks
 * 
 * The client interfaces are designed to be used for any WPD object; it is not necessary to create a new instance for each object referenced by the application. After an application opens an instance of the <b>IPortableDevice</b> interface, it should open and cache any other WPD client interfaces that it will require.
 *       
 * 
 * For Windows 7, <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice">IPortableDevice</a> supports two CLSIDs for <b>CoCreateInstance</b>. <b>CLSID_PortableDevice</b> returns an <b>IPortableDevice</b> pointer that does not aggregate the free-threaded marshaler; <b>CLSID_PortableDeviceFTM</b> is a new CLSID that returns an <b>IPortableDevice</b> pointer that aggregates the free-threaded marshaler.  Both pointers support the same functionality otherwise.
 * 
 * Applications that live in Single Threaded Apartments should use <b>CLSID_PortableDeviceFTM</b> as this eliminates the overhead of interface pointer marshaling.  <b>CLSID_PortableDevice</b> is still supported for legacy applications.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevice
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDevice
     * @type {Guid}
     */
    static IID => Guid("{625e2df8-6392-4cf0-9ad1-3cfa5f17775c}")

    /**
     * The class identifier for PortableDevice
     * @type {Guid}
     */
    static CLSID => Guid("{728a21c5-3d9e-48d7-9810-864848f0f404}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "SendCommand", "Content", "Capabilities", "Cancel", "Close", "Advise", "Unadvise", "GetPnPDeviceID"]

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {IPortableDeviceValues} pClientInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-open
     */
    Open(pszPnPDeviceID, pClientInfo) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        result := ComCall(3, this, "ptr", pszPnPDeviceID, "ptr", pClientInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IPortableDeviceValues} pParameters 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-sendcommand
     */
    SendCommand(dwFlags, pParameters) {
        result := ComCall(4, this, "uint", dwFlags, "ptr", pParameters, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }

    /**
     * 
     * @returns {IPortableDeviceContent} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-content
     */
    Content() {
        result := ComCall(5, this, "ptr*", &ppContent := 0, "HRESULT")
        return IPortableDeviceContent(ppContent)
    }

    /**
     * 
     * @returns {IPortableDeviceCapabilities} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-capabilities
     */
    Capabilities() {
        result := ComCall(6, this, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IPortableDeviceCapabilities(ppCapabilities)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IPortableDeviceEventCallback} pCallback 
     * @param {IPortableDeviceValues} pParameters 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-advise
     */
    Advise(dwFlags, pCallback, pParameters) {
        result := ComCall(9, this, "uint", dwFlags, "ptr", pCallback, "ptr", pParameters, "ptr*", &ppszCookie := 0, "HRESULT")
        return ppszCookie
    }

    /**
     * 
     * @param {PWSTR} pszCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-unadvise
     */
    Unadvise(pszCookie) {
        pszCookie := pszCookie is String ? StrPtr(pszCookie) : pszCookie

        result := ComCall(10, this, "ptr", pszCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-getpnpdeviceid
     */
    GetPnPDeviceID() {
        result := ComCall(11, this, "ptr*", &ppszPnPDeviceID := 0, "HRESULT")
        return ppszPnPDeviceID
    }
}
