#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows for communicating with a device service on a particular Mobile Broadband device.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> objects are provided by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-getdeviceservice">GetDeviceService</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicescontext">IMbnDeviceServicesContext</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbndeviceservice
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnDeviceService extends IUnknown{
    /**
     * The interface identifier for IMbnDeviceService
     * @type {Guid}
     */
    static IID => Guid("{b3bb9a71-dc70-4be9-a4da-7886ae8b191b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    QuerySupportedCommands(requestID) {
        result := ComCall(3, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    OpenCommandSession(requestID) {
        result := ComCall(4, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    CloseCommandSession(requestID) {
        result := ComCall(5, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetCommand(commandID, deviceServiceData, requestID) {
        result := ComCall(6, this, "uint", commandID, "ptr", deviceServiceData, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    QueryCommand(commandID, deviceServiceData, requestID) {
        result := ComCall(7, this, "uint", commandID, "ptr", deviceServiceData, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    OpenDataSession(requestID) {
        result := ComCall(8, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    CloseDataSession(requestID) {
        result := ComCall(9, this, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    WriteData(deviceServiceData, requestID) {
        result := ComCall(10, this, "ptr", deviceServiceData, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} InterfaceID 
     * @returns {HRESULT} 
     */
    get_InterfaceID(InterfaceID) {
        result := ComCall(11, this, "ptr", InterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} DeviceServiceID 
     * @returns {HRESULT} 
     */
    get_DeviceServiceID(DeviceServiceID) {
        result := ComCall(12, this, "ptr", DeviceServiceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     */
    get_IsCommandSessionOpen(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     */
    get_IsDataSessionOpen(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
