#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows for communicating with a device service on a particular Mobile Broadband device.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservice">IMbnDeviceService</a> objects are provided by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-getdeviceservice">GetDeviceService</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicescontext">IMbnDeviceServicesContext</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nn-mbnapi-imbndeviceservice
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
     * Gets the list of commands IDs supported by the Mobile Broadband device service.
     * @remarks
     * <b>QuerySupportedCommands</b> enables the application to enumerate the list of command messages supported by a device service on the Mobile Broadband device. 
     * 
     * This is an asynchronous operation and <b>QuerySupportedCommands</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerysupportedcommandscomplete">OnQuerySupportedCommandsComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-querysupportedcommands
     */
    QuerySupportedCommands() {
        result := ComCall(3, this, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Opens a command session to a device service on a Mobile Broadband device.
     * @remarks
     * <b>OpenCommandSession</b> allows an application to open a command session to a the device service on the mobile broadband device.
     * 
     * This is an asynchronous operation and <b>OpenCommandSession</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onopencommandsessioncomplete">OnOpenCommandSessionComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-opencommandsession
     */
    OpenCommandSession() {
        result := ComCall(4, this, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Closes a command session to a device service on a Mobile Broadband device.
     * @remarks
     * <b>CloseCommandSession</b> closes the command session to the mobile broadband device service.
     * 
     * This is an asynchronous operation and <b>CloseCommandSession</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosecommandsessioncomplete">OnCloseCommandSessionComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-closecommandsession
     */
    CloseCommandSession() {
        result := ComCall(5, this, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Sends a SET control command to the device service of a Mobile Broadband device.
     * @remarks
     * <b>SetCommand</b> exists to implement vendor-specific device service functionality which is not otherwise covered in the Mobile Broadband API. A command session on a device service must be opened before the application can call <b>SetCommand</b>.
     * 
     * The Mobile Broadband service will issue a <b>SET</b> request to the device. <i>deviceServiceData</i> will be copied byte-by-byte into the data buffer passed in to the request. This data buffer must be less than <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxcommandsize">MaxCommandSize</a> bytes.
     * 
     * This is an asynchronous operation and <b>SetCommand</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onsetcommandcomplete">OnSetCommandComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @param {Integer} commandID An identifier for the command.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array that is passed in to the device.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-setcommand
     */
    SetCommand(commandID, deviceServiceData) {
        result := ComCall(6, this, "uint", commandID, "ptr", deviceServiceData, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Sends a QUERY control command to the device service of a Mobile Broadband device.
     * @remarks
     * <b>QueryCommand</b> exists to implement vendor-specific device service functionality which is not otherwise covered in the Mobile Broadband API. The command session on a device service must be opened before the application can call <b>QueryCommand</b>.
     * 
     * The Mobile Broadband service will issue a <b>QUERY</b> request to the device. <i>deviceServiceData</i> will be copied byte-by-byte into the data buffer passed in to the request. This data buffer must not be more than <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxcommandsize">MaxCommandSize</a> bytes.
     * 
     * This is an asynchronous operation and <b>QueryCommand</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onquerycommandcomplete">OnQueryCommandComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @param {Integer} commandID An identifier for the command.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array that is passed in to the device.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-querycommand
     */
    QueryCommand(commandID, deviceServiceData) {
        result := ComCall(7, this, "uint", commandID, "ptr", deviceServiceData, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Open a data session to the device service on a Mobile Broadband device.
     * @remarks
     * <b>OpenDataSession</b> allows an application to open a data session to the mobile broadband device service.
     * 
     * This is an asynchronous operation and <b>OpenDataSession</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onopendatasessioncomplete">OnOpenDataSessionComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-opendatasession
     */
    OpenDataSession() {
        result := ComCall(8, this, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Closes the data session to a device service on a Mobile Broadband device.
     * @remarks
     * <b>CloseDataSession</b> closes the data session to the mobile broadband device service. The data session must be opened before the application can call <b>CloseDataSession</b>.
     * 
     * This is an asynchronous operation and <b>CloseDataSession</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onclosedatasessioncomplete">OnCloseDataSessionComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-closedatasession
     */
    CloseDataSession() {
        result := ComCall(9, this, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * Write data to a device service data session.
     * @remarks
     * <b>WriteData</b> passes a bulk data to a vendor-specific device service on the device. The Mobile Broadband service will forward this request to the device. <i>deviceServiceData</i> will be copied byte-by-byte into the data buffer passed in to the request. This data buffer must be less than <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicescontext-get_maxdatasize">MaxDataSize</a> bytes.
     * 
     * The data session must be opened before the application can call <b>WriteData</b>. The operating system does not provide guarantees on the latency or performance of <b>WriteData</b>.
     * 
     * This is an asynchronous operation and <b>WriteData</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbndeviceservicesevents-onwritedatacomplete">OnWriteDataComplete</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbndeviceservicesevents">IMbnDeviceServicesEvents</a> interface.
     * @param {Pointer<SAFEARRAY>} deviceServiceData A byte array that is passed in to the device to write.
     * @returns {Integer} A unique request ID assigned by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-writedata
     */
    WriteData(deviceServiceData) {
        result := ComCall(10, this, "ptr", deviceServiceData, "uint*", &requestID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return requestID
    }

    /**
     * The interface ID of the Mobile Broadband device to which this object is associated.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-get_interfaceid
     */
    get_InterfaceID() {
        InterfaceID := BSTR()
        result := ComCall(11, this, "ptr", InterfaceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InterfaceID
    }

    /**
     * The ID of the device service to which this object is associated.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-get_deviceserviceid
     */
    get_DeviceServiceID() {
        DeviceServiceID := BSTR()
        result := ComCall(12, this, "ptr", DeviceServiceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceServiceID
    }

    /**
     * Reports if the device service command session is open.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-get_iscommandsessionopen
     */
    get_IsCommandSessionOpen() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reports if the device service data session is open.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/mbnapi/nf-mbnapi-imbndeviceservice-get_isdatasessionopen
     */
    get_IsDataSessionOpen() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
