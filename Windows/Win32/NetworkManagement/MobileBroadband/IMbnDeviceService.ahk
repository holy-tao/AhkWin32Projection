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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QuerySupportedCommands", "OpenCommandSession", "CloseCommandSession", "SetCommand", "QueryCommand", "OpenDataSession", "CloseDataSession", "WriteData", "get_InterfaceID", "get_DeviceServiceID", "get_IsCommandSessionOpen", "get_IsDataSessionOpen"]

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-querysupportedcommands
     */
    QuerySupportedCommands(requestID) {
        result := ComCall(3, this, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-opencommandsession
     */
    OpenCommandSession(requestID) {
        result := ComCall(4, this, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-closecommandsession
     */
    CloseCommandSession(requestID) {
        result := ComCall(5, this, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-setcommand
     */
    SetCommand(commandID, deviceServiceData, requestID) {
        result := ComCall(6, this, "uint", commandID, "ptr", deviceServiceData, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-querycommand
     */
    QueryCommand(commandID, deviceServiceData, requestID) {
        result := ComCall(7, this, "uint", commandID, "ptr", deviceServiceData, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-opendatasession
     */
    OpenDataSession(requestID) {
        result := ComCall(8, this, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-closedatasession
     */
    CloseDataSession(requestID) {
        result := ComCall(9, this, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-writedata
     */
    WriteData(deviceServiceData, requestID) {
        result := ComCall(10, this, "ptr", deviceServiceData, "uint*", requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} InterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_interfaceid
     */
    get_InterfaceID(InterfaceID) {
        result := ComCall(11, this, "ptr", InterfaceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} DeviceServiceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_deviceserviceid
     */
    get_DeviceServiceID(DeviceServiceID) {
        result := ComCall(12, this, "ptr", DeviceServiceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_iscommandsessionopen
     */
    get_IsCommandSessionOpen(value) {
        result := ComCall(13, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_isdatasessionopen
     */
    get_IsDataSessionOpen(value) {
        result := ComCall(14, this, "ptr", value, "HRESULT")
        return result
    }
}
