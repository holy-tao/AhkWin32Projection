#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDSPEnumDevice.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDServiceProvider interface is the initial interface that Windows Media Device Manager uses to connect to your service provider.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdserviceprovider
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDServiceProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDServiceProvider
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a10-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceCount", "EnumDevices"]

    /**
     * The GetDeviceCount method returns the number of installed physical or software devices that are currently attached and are known by the service provider.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the count of known devices.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdserviceprovider-getdevicecount
     */
    GetDeviceCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * The EnumDevices method enumerates the installed physical or software devices that are currently attached and are known by the service provider.
     * @returns {IMDSPEnumDevice} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumdevice">IMDSPEnumDevice</a> interface. If the service provider implements <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-imdserviceprovider2-createdevice">IMDServiceProvider2::CreateDevice</a>, this enumerator should only enumerate non-Plug and Play devices.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdserviceprovider-enumdevices
     */
    EnumDevices() {
        result := ComCall(4, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IMDSPEnumDevice(ppEnumDevice)
    }
}
