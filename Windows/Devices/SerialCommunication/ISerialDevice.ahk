#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class ISerialDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISerialDevice
     * @type {Guid}
     */
    static IID => Guid("{e187ccc6-2210-414f-b65a-f5553a03372a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaudRate", "put_BaudRate", "get_BreakSignalState", "put_BreakSignalState", "get_BytesReceived", "get_CarrierDetectState", "get_ClearToSendState", "get_DataBits", "put_DataBits", "get_DataSetReadyState", "get_Handshake", "put_Handshake", "get_IsDataTerminalReadyEnabled", "put_IsDataTerminalReadyEnabled", "get_IsRequestToSendEnabled", "put_IsRequestToSendEnabled", "get_Parity", "put_Parity", "get_PortName", "get_ReadTimeout", "put_ReadTimeout", "get_StopBits", "put_StopBits", "get_UsbVendorId", "get_UsbProductId", "get_WriteTimeout", "put_WriteTimeout", "get_InputStream", "get_OutputStream", "add_ErrorReceived", "remove_ErrorReceived", "add_PinChanged", "remove_PinChanged"]

    /**
     * @type {Integer} 
     */
    BaudRate {
        get => this.get_BaudRate()
        set => this.put_BaudRate(value)
    }

    /**
     * @type {Boolean} 
     */
    BreakSignalState {
        get => this.get_BreakSignalState()
        set => this.put_BreakSignalState(value)
    }

    /**
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
    }

    /**
     * @type {Boolean} 
     */
    CarrierDetectState {
        get => this.get_CarrierDetectState()
    }

    /**
     * @type {Boolean} 
     */
    ClearToSendState {
        get => this.get_ClearToSendState()
    }

    /**
     * @type {Integer} 
     */
    DataBits {
        get => this.get_DataBits()
        set => this.put_DataBits(value)
    }

    /**
     * @type {Boolean} 
     */
    DataSetReadyState {
        get => this.get_DataSetReadyState()
    }

    /**
     * @type {Integer} 
     */
    Handshake {
        get => this.get_Handshake()
        set => this.put_Handshake(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDataTerminalReadyEnabled {
        get => this.get_IsDataTerminalReadyEnabled()
        set => this.put_IsDataTerminalReadyEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsRequestToSendEnabled {
        get => this.get_IsRequestToSendEnabled()
        set => this.put_IsRequestToSendEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    Parity {
        get => this.get_Parity()
        set => this.put_Parity(value)
    }

    /**
     * @type {HSTRING} 
     */
    PortName {
        get => this.get_PortName()
    }

    /**
     * @type {TimeSpan} 
     */
    ReadTimeout {
        get => this.get_ReadTimeout()
        set => this.put_ReadTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    StopBits {
        get => this.get_StopBits()
        set => this.put_StopBits(value)
    }

    /**
     * @type {Integer} 
     */
    UsbVendorId {
        get => this.get_UsbVendorId()
    }

    /**
     * @type {Integer} 
     */
    UsbProductId {
        get => this.get_UsbProductId()
    }

    /**
     * @type {TimeSpan} 
     */
    WriteTimeout {
        get => this.get_WriteTimeout()
        set => this.put_WriteTimeout(value)
    }

    /**
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BaudRate() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BaudRate(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BreakSignalState() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BreakSignalState(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CarrierDetectState() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ClearToSendState() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataBits() {
        result := ComCall(13, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataBits(value) {
        result := ComCall(14, this, "ushort", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DataSetReadyState() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Handshake() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Handshake(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataTerminalReadyEnabled() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDataTerminalReadyEnabled(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequestToSendEnabled() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRequestToSendEnabled(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Parity() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Parity(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PortName() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ReadTimeout() {
        value := TimeSpan()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_ReadTimeout(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StopBits() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StopBits(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsbVendorId() {
        result := ComCall(29, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsbProductId() {
        result := ComCall(30, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_WriteTimeout() {
        value := TimeSpan()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_WriteTimeout(value) {
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        result := ComCall(33, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(34, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SerialDevice, ErrorReceivedEventArgs>} reportHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorReceived(reportHandler) {
        token := EventRegistrationToken()
        result := ComCall(35, this, "ptr", reportHandler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(36, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SerialDevice, PinChangedEventArgs>} reportHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PinChanged(reportHandler) {
        token := EventRegistrationToken()
        result := ComCall(37, this, "ptr", reportHandler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PinChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(38, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
