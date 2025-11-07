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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider-getdevicecount
     */
    GetDeviceCount() {
        result := ComCall(3, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * 
     * @returns {IMDSPEnumDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider-enumdevices
     */
    EnumDevices() {
        result := ComCall(4, this, "ptr*", &ppEnumDevice := 0, "HRESULT")
        return IMDSPEnumDevice(ppEnumDevice)
    }
}
