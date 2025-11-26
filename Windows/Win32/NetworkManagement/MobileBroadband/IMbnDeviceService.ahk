#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {BSTR} 
     */
    InterfaceID {
        get => this.get_InterfaceID()
    }

    /**
     * @type {BSTR} 
     */
    DeviceServiceID {
        get => this.get_DeviceServiceID()
    }

    /**
     * @type {BOOL} 
     */
    IsCommandSessionOpen {
        get => this.get_IsCommandSessionOpen()
    }

    /**
     * @type {BOOL} 
     */
    IsDataSessionOpen {
        get => this.get_IsDataSessionOpen()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-querysupportedcommands
     */
    QuerySupportedCommands() {
        result := ComCall(3, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-opencommandsession
     */
    OpenCommandSession() {
        result := ComCall(4, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-closecommandsession
     */
    CloseCommandSession() {
        result := ComCall(5, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-setcommand
     */
    SetCommand(commandID, deviceServiceData) {
        result := ComCall(6, this, "uint", commandID, "ptr", deviceServiceData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Integer} commandID 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-querycommand
     */
    QueryCommand(commandID, deviceServiceData) {
        result := ComCall(7, this, "uint", commandID, "ptr", deviceServiceData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-opendatasession
     */
    OpenDataSession() {
        result := ComCall(8, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-closedatasession
     */
    CloseDataSession() {
        result := ComCall(9, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} deviceServiceData 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-writedata
     */
    WriteData(deviceServiceData) {
        result := ComCall(10, this, "ptr", deviceServiceData, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(11, this, "ptr", InterfaceID, "HRESULT")
        return InterfaceID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_deviceserviceid
     */
    get_DeviceServiceID() {
        DeviceServiceID := BSTR()
        result := ComCall(12, this, "ptr", DeviceServiceID, "HRESULT")
        return DeviceServiceID
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_iscommandsessionopen
     */
    get_IsCommandSessionOpen() {
        result := ComCall(13, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbndeviceservice-get_isdatasessionopen
     */
    get_IsDataSessionOpen() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
