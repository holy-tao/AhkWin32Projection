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
     * Gets the list of supported device services by the Mobile Broadband device.
     * @returns {Pointer<SAFEARRAY>} Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_device_service">MBN_DEVICE_SERVICE</a> structures that contains the list of device service supported by the device. If <b>EnumerateDeviceServices</b> returns any value other than <b>S_OK</b>, <i>deviceServices</i> is <b>NULL</b>. Otherwise, upon completion, the calling program must free the allocated memory. Before freeing the array by calling <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>, the calling program must also free all the <b>BSTRs</b> in the<b>MBN_DEVICE_SERVICE</b> structure by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicescontext-enumeratedeviceservices
     */
    EnumerateDeviceServices() {
        result := ComCall(3, this, "ptr*", &deviceServices := 0, "HRESULT")
        return deviceServices
    }

    /**
     * Gets the IMbnDeviceService object that can be used for communicating with a device service on the Mobile Broadband device.
     * @param {BSTR} deviceServiceID The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservice-get_deviceserviceid">deviceServiceID</a> of the Mobile Broadband device.
     * @returns {IMbnDeviceService} The <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicescontext-getdeviceservice
     */
    GetDeviceService(deviceServiceID) {
        deviceServiceID := deviceServiceID is String ? BSTR.Alloc(deviceServiceID).Value : deviceServiceID

        result := ComCall(4, this, "ptr", deviceServiceID, "ptr*", &mbnDeviceService := 0, "HRESULT")
        return IMbnDeviceService(mbnDeviceService)
    }

    /**
     * The maximum length, in bytes, of data that can be associated with a device service SET or QUERY command.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxcommandsize
     */
    get_MaxCommandSize() {
        result := ComCall(5, this, "uint*", &maxCommandSize := 0, "HRESULT")
        return maxCommandSize
    }

    /**
     * The maximum length, in bytes, of data that can be written to or read from a device service session.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxdatasize
     */
    get_MaxDataSize() {
        result := ComCall(6, this, "uint*", &maxDataSize := 0, "HRESULT")
        return maxDataSize
    }
}
