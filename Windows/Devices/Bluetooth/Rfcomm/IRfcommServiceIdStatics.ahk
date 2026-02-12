#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RfcommServiceId.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommServiceIdStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommServiceIdStatics
     * @type {Guid}
     */
    static IID => Guid("{2a179eba-a975-46e3-b56b-08ffd783a5fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromUuid", "FromShortId", "get_SerialPort", "get_ObexObjectPush", "get_ObexFileTransfer", "get_PhoneBookAccessPce", "get_PhoneBookAccessPse", "get_GenericFileTransfer"]

    /**
     * @type {RfcommServiceId} 
     */
    SerialPort {
        get => this.get_SerialPort()
    }

    /**
     * @type {RfcommServiceId} 
     */
    ObexObjectPush {
        get => this.get_ObexObjectPush()
    }

    /**
     * @type {RfcommServiceId} 
     */
    ObexFileTransfer {
        get => this.get_ObexFileTransfer()
    }

    /**
     * @type {RfcommServiceId} 
     */
    PhoneBookAccessPce {
        get => this.get_PhoneBookAccessPce()
    }

    /**
     * @type {RfcommServiceId} 
     */
    PhoneBookAccessPse {
        get => this.get_PhoneBookAccessPse()
    }

    /**
     * @type {RfcommServiceId} 
     */
    GenericFileTransfer {
        get => this.get_GenericFileTransfer()
    }

    /**
     * 
     * @param {Guid} uuid 
     * @returns {RfcommServiceId} 
     */
    FromUuid(uuid) {
        result := ComCall(6, this, "ptr", uuid, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @param {Integer} shortId 
     * @returns {RfcommServiceId} 
     */
    FromShortId(shortId) {
        result := ComCall(7, this, "uint", shortId, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_SerialPort() {
        result := ComCall(8, this, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_ObexObjectPush() {
        result := ComCall(9, this, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_ObexFileTransfer() {
        result := ComCall(10, this, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_PhoneBookAccessPce() {
        result := ComCall(11, this, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_PhoneBookAccessPse() {
        result := ComCall(12, this, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_GenericFileTransfer() {
        result := ComCall(13, this, "ptr*", &serviceId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RfcommServiceId(serviceId)
    }
}
