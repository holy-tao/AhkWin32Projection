#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<SAFEARRAY>} deviceServices 
     * @returns {HRESULT} 
     */
    EnumerateDeviceServices(deviceServices) {
        result := ComCall(3, this, "ptr", deviceServices, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} deviceServiceID 
     * @param {Pointer<IMbnDeviceService>} mbnDeviceService 
     * @returns {HRESULT} 
     */
    GetDeviceService(deviceServiceID, mbnDeviceService) {
        deviceServiceID := deviceServiceID is String ? BSTR.Alloc(deviceServiceID).Value : deviceServiceID

        result := ComCall(4, this, "ptr", deviceServiceID, "ptr", mbnDeviceService, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} maxCommandSize 
     * @returns {HRESULT} 
     */
    get_MaxCommandSize(maxCommandSize) {
        result := ComCall(5, this, "uint*", maxCommandSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} maxDataSize 
     * @returns {HRESULT} 
     */
    get_MaxDataSize(maxDataSize) {
        result := ComCall(6, this, "uint*", maxDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
