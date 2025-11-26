#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMbnDeviceService.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows for enumerating and retrieving Mobile Broadband device objects on the system.
 * @remarks
 * 
 * <b>IMbnDeviceServicesContext</b> objects are provided by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesmanager-getdeviceservicescontext">GetDeviceServicesContext</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesmanager">IMbnDeviceServicesManager</a> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbndeviceservicescontext
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnDeviceServicesContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnDeviceServicesContext
     * @type {Guid}
     */
    static IID => Guid("{fc5ac347-1592-4068-80bb-6a57580150d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateDeviceServices", "GetDeviceService", "get_MaxCommandSize", "get_MaxDataSize"]

    /**
     * @type {Integer} 
     */
    MaxCommandSize {
        get => this.get_MaxCommandSize()
    }

    /**
     * @type {Integer} 
     */
    MaxDataSize {
        get => this.get_MaxDataSize()
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-enumeratedeviceservices
     */
    EnumerateDeviceServices() {
        result := ComCall(3, this, "ptr*", &deviceServices := 0, "HRESULT")
        return deviceServices
    }

    /**
     * 
     * @param {BSTR} deviceServiceID 
     * @returns {IMbnDeviceService} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-getdeviceservice
     */
    GetDeviceService(deviceServiceID) {
        deviceServiceID := deviceServiceID is String ? BSTR.Alloc(deviceServiceID).Value : deviceServiceID

        result := ComCall(4, this, "ptr", deviceServiceID, "ptr*", &mbnDeviceService := 0, "HRESULT")
        return IMbnDeviceService(mbnDeviceService)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxcommandsize
     */
    get_MaxCommandSize() {
        result := ComCall(5, this, "uint*", &maxCommandSize := 0, "HRESULT")
        return maxCommandSize
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxdatasize
     */
    get_MaxDataSize() {
        result := ComCall(6, this, "uint*", &maxDataSize := 0, "HRESULT")
        return maxDataSize
    }
}
