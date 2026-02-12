#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISerialDevice.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ISerialDeviceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SerialDevice.ahk
#Include .\ErrorReceivedEventArgs.ahk
#Include .\PinChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a serial port. The object provides methods and properties that an app can use to find and interact with serials ports on the system.
 * @remarks
 * The serial device capability, `serialCommunication`, is required to use the `SerialDevice` class. For more information, see [Windows.Devices.SerialCommunication](windows_devices_serialcommunication.md).
 * 
 * 
 * **Create a SerialDevice object**
 * 
 * 1. Generate an Advanced Query Syntax (AQS) string that contains search criteria for finding the device in the enumerated device collection. If you have the vendor and product identifiers, call [GetDeviceSelectorFromUsbVidPid](serialdevice_getdeviceselectorfromusbvidpid_2128196110.md).
 * 1. Pass the retrieved string to [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md). The call retrieves a [DeviceInformationCollection](../windows.devices.enumeration/deviceinformationcollection.md) object.
 * 1. Loop through the collection. Each iteration gets a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object.
 * 1. Get the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property value. The string value is the device interface path. (e.g `\\?\usb#vid_03eb&pid_2157&mi_01#7&1435ec7f&0&0001#{86e0d1e0-8089-11d0-9ce4-08003e301f73}`).
 * 1. Call [FromIdAsync](serialdevice_fromidasync_1322863552.md) by passing the device interface string and get the `SerialDevice` object.  If this throws an exception or returns null, it is likely:
 *     + The device interface path is invalid
 *     + The device interface path does not respresent a serial device
 *     + Application is missing the `serialCommunication` capability
 *     + The serial device is inaccessible. (see [Windows.Devices.SerialCommunication](windows_devices_serialcommunication.md))
 * 
 * 
 * **Read and write data**
 * 
 * You can then use the SerialDevice object to read from or write to the serial port by using the [Windows.Storage.Streams](../windows.storage.streams/windows_storage_streams.md) namespace.
 * 1. Obtain a reference to the input stream by getting the [SerialDevice.InputStream](serialdevice_inputstream.md) property.
 * 1. Create a [DataReader](../windows.storage.streams/datareader.md) object by specifying the input stream in the [DataReader](../windows.storage.streams/datareader_datareader_25787062.md) constructor.
 * 1. Obtain a reference to the output stream by getting the [SerialDevice.OutputStream](serialdevice_outputstream.md) property.
 * 1. Create a [DataWriter](../windows.storage.streams/datawriter.md) object by specifying the output stream in the [DataWriter](../windows.storage.streams/datawriter_datawriter_1221375020.md) constructor.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class SerialDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISerialDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISerialDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an Advanced Query Syntax (AQS) string that the app can pass to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find a serial device by specifying its port name.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!SerialDevice.HasProp("__ISerialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SerialCommunication.SerialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISerialDeviceStatics.IID)
            SerialDevice.__ISerialDeviceStatics := ISerialDeviceStatics(factoryPtr)
        }

        return SerialDevice.__ISerialDeviceStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that the app can pass to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find all serial devices on the system.
     * @param {HSTRING} portName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.getdeviceselector
     */
    static GetDeviceSelectorFromPortName(portName) {
        if (!SerialDevice.HasProp("__ISerialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SerialCommunication.SerialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISerialDeviceStatics.IID)
            SerialDevice.__ISerialDeviceStatics := ISerialDeviceStatics(factoryPtr)
        }

        return SerialDevice.__ISerialDeviceStatics.GetDeviceSelectorFromPortName(portName)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that the app can pass to [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) in order to find a specific Serial-to-USB device by specifying its VID and PID.
     * @param {Integer} vendorId Specifies the vendor identifier for the device as assigned by the USB specification committee. Possible values are 0 through 0xffff.
     * @param {Integer} productId Specifies the product identifier. This value is assigned by the manufacturer and is device-specific. Possible values are 0 through 0xffff.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.getdeviceselectorfromusbvidpid
     */
    static GetDeviceSelectorFromUsbVidPid(vendorId, productId) {
        if (!SerialDevice.HasProp("__ISerialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SerialCommunication.SerialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISerialDeviceStatics.IID)
            SerialDevice.__ISerialDeviceStatics := ISerialDeviceStatics(factoryPtr)
        }

        return SerialDevice.__ISerialDeviceStatics.GetDeviceSelectorFromUsbVidPid(vendorId, productId)
    }

    /**
     * Starts an asynchronous operation that creates a [SerialDevice](serialdevice.md) object.
     * @param {HSTRING} deviceId The device instance path of the device. To obtain that value, get the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) property value.
     * @returns {IAsyncOperation<SerialDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!SerialDevice.HasProp("__ISerialDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SerialCommunication.SerialDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISerialDeviceStatics.IID)
            SerialDevice.__ISerialDeviceStatics := ISerialDeviceStatics(factoryPtr)
        }

        return SerialDevice.__ISerialDeviceStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the baud rate.
     * @remarks
     * The property is set on the [SerialDevice](serialdevice.md) object that represents the serial port. The baud rate must be supported by the serial port. To see the possible values, in Device Manager, open the **Port Settings** tab of the COM port.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.baudrate
     * @type {Integer} 
     */
    BaudRate {
        get => this.get_BaudRate()
        set => this.put_BaudRate(value)
    }

    /**
     * Gets or sets the break signal state.
     * @remarks
     * In serial communication, the break signal state is used to toggle the TX line. To suspend data transmission, set the property value to **true**. In that state, you cannot write to the serial port. To resume transmission, set to **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.breaksignalstate
     * @type {Boolean} 
     */
    BreakSignalState {
        get => this.get_BreakSignalState()
        set => this.put_BreakSignalState(value)
    }

    /**
     * Represents the number of bytes received by the last read operation of the input stream.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.bytesreceived
     * @type {Integer} 
     */
    BytesReceived {
        get => this.get_BytesReceived()
    }

    /**
     * Gets the state of the Carrier Detect (CD) line.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.carrierdetectstate
     * @type {Boolean} 
     */
    CarrierDetectState {
        get => this.get_CarrierDetectState()
    }

    /**
     * Gets the state of the Clear-to-Send (CTS) line.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.cleartosendstate
     * @type {Boolean} 
     */
    ClearToSendState {
        get => this.get_ClearToSendState()
    }

    /**
     * The number of data bits in each character value that is transmitted or received, and does not include parity bits or stop bits.
     * @remarks
     * DataBits corresponds to the **WordLength** member of the [SERIAL_LINE_CONTROL](/windows-hardware/drivers/ddi/content/ntddser/ns-ntddser-_serial_line_control) structure.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.databits
     * @type {Integer} 
     */
    DataBits {
        get => this.get_DataBits()
        set => this.put_DataBits(value)
    }

    /**
     * Gets the state of the Data Set Ready (DSR) signal.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.datasetreadystate
     * @type {Boolean} 
     */
    DataSetReadyState {
        get => this.get_DataSetReadyState()
    }

    /**
     * Gets or sets the handshaking protocol for flow control.
     * @remarks
     * The handshaking protocol is used by the serial port to establish flow control between the port and the connected device. There are two types of control protocol.
     * 
     * 
     * + Hardware control: The Request-to-Send (RTS) line is set to false when the receiver's buffer is full. This indicates to the sender that it must stop sending data. When the buffer is able to hold data, the RTS line is set to true that indicates to the send that it is now ready to receive data again.
     * + Software control: The receiver sends an Xoff control code to the sender to stop transmission of data. When the receiver is ready, it sends the Xon code and the sender resumes data transmission.
     *  The [SerialHandshake](serialhandshake.md) enumeration defines the preceding control type values.
     * 
     * You can set hardware, software, or both types of control protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.handshake
     * @type {Integer} 
     */
    Handshake {
        get => this.get_Handshake()
        set => this.put_Handshake(value)
    }

    /**
     * Gets or sets a value that enables the Data Terminal Ready (DTR) signal.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.isdataterminalreadyenabled
     * @type {Boolean} 
     */
    IsDataTerminalReadyEnabled {
        get => this.get_IsDataTerminalReadyEnabled()
        set => this.put_IsDataTerminalReadyEnabled(value)
    }

    /**
     * Gets or sets a value that enables the Request to Send (RTS) signal.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.isrequesttosendenabled
     * @type {Boolean} 
     */
    IsRequestToSendEnabled {
        get => this.get_IsRequestToSendEnabled()
        set => this.put_IsRequestToSendEnabled(value)
    }

    /**
     * Gets or sets the parity bit for error-checking.
     * @remarks
     * In serial communication, the parity bit is used as an error-checking procedure. In data transmission that uses parity checking, the bit format is 7 data bits-*x*-1 stop bit, where *x* is the parity bit. That bit indicates whether the number of 1s in the data byte is even or odd. The parity bit can be E (even), O (odd), M (mark), or S (space). Those values are defined in the [SerialParity](serialparity.md) enumeration.
     * 
     * For example, if the format is 7-E-1 and the data bits are 0001000, the parity bit is set to 1 to make sure there are even number of 1s.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.parity
     * @type {Integer} 
     */
    Parity {
        get => this.get_Parity()
        set => this.put_Parity(value)
    }

    /**
     * Gets the port name for serial communications.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.portname
     * @type {HSTRING} 
     */
    PortName {
        get => this.get_PortName()
    }

    /**
     * Gets or sets the time-out value for a read operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.readtimeout
     * @type {TimeSpan} 
     */
    ReadTimeout {
        get => this.get_ReadTimeout()
        set => this.put_ReadTimeout(value)
    }

    /**
     * Gets or sets the standard number of stop bits per byte.
     * @remarks
     * In serial communication, a transmission begins with a start bit, followed by 8 bits of data, and ends with a stop bit. The purpose of the stop bit is to separate each unit of data or to indicate that no data is available for transmission.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.stopbits
     * @type {Integer} 
     */
    StopBits {
        get => this.get_StopBits()
        set => this.put_StopBits(value)
    }

    /**
     * Gets the **idVendor** field of the [USB device descriptor](/windows-hardware/drivers/ddi/content/index). The value indicates the vendor identifier for the device as assigned by the USB specification committee.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.usbvendorid
     * @type {Integer} 
     */
    UsbVendorId {
        get => this.get_UsbVendorId()
    }

    /**
     * Gets the **idProduct** field of the [USB device descriptor](/windows-hardware/drivers/ddi/content/index). This value indicates the device-specific product identifier and is assigned by the manufacturer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.usbproductid
     * @type {Integer} 
     */
    UsbProductId {
        get => this.get_UsbProductId()
    }

    /**
     * Gets or sets the time-out value for a write operation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.writetimeout
     * @type {TimeSpan} 
     */
    WriteTimeout {
        get => this.get_WriteTimeout()
        set => this.put_WriteTimeout(value)
    }

    /**
     * Input stream that contains the data received on the serial port.
     * @remarks
     * To access data received on the port, get the input stream from [SerialDevice](serialdevice.md) object, and then use the [DataReader](../windows.storage.streams/datareader.md) to read data.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.inputstream
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * Gets an output stream to which the app can write data to transmit through the serial port.
     * @remarks
     * To write data, first get the output stream from the [SerialDevice](serialdevice.md) object by using OutputStream property and then use the [DataWriter](../windows.storage.streams/datawriter.md) object to write the actual buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * Event handler that is invoked when error occurs on the serial port.
     * @remarks
     * This event is used to detect and respond to errors when communicating data through a serial port. When an error condition occurs, the ErrorReceived event handler is invoked and error information is received in an [ErrorReceivedEventArgs](errorreceivedeventargs.md) object. Determine the type of error by retrieving the [Error](errorreceivedeventargs_error.md) property of the [ErrorReceivedEventArgs](errorreceivedeventargs.md) class. Those property values are defined in the [SerialError](serialerror.md) enumeration.
     * @type {TypedEventHandler<SerialDevice, ErrorReceivedEventArgs>}
    */
    OnErrorReceived {
        get {
            if(!this.HasProp("__OnErrorReceived")){
                this.__OnErrorReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d92ea323-b7bf-5e02-b9fb-c61f97d080e9}"),
                    SerialDevice,
                    ErrorReceivedEventArgs
                )
                this.__OnErrorReceivedToken := this.add_ErrorReceived(this.__OnErrorReceived.iface)
            }
            return this.__OnErrorReceived
        }
    }

    /**
     * Event handler that is invoked when the state of a signal or line changes on the serial port.
     * @remarks
     * This event is used to detect and respond to changes in the signal state of the serial port. When state changes, the PinChanged event handler is invoked and information is received in a [PinChangedEventArgs](pinchangedeventargs.md) object. Determine the type of signal by retrieving the [PinChange](pinchangedeventargs_pinchange.md) property. Those property values are defined in the [SerialPinChange](serialpinchange.md) enumeration.
     * @type {TypedEventHandler<SerialDevice, PinChangedEventArgs>}
    */
    OnPinChanged {
        get {
            if(!this.HasProp("__OnPinChanged")){
                this.__OnPinChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e496c3ef-5802-5ac4-ac2e-96bc23fa9447}"),
                    SerialDevice,
                    PinChangedEventArgs
                )
                this.__OnPinChangedToken := this.add_PinChanged(this.__OnPinChanged.iface)
            }
            return this.__OnPinChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnErrorReceivedToken")) {
            this.remove_ErrorReceived(this.__OnErrorReceivedToken)
            this.__OnErrorReceived.iface.Dispose()
        }

        if(this.HasProp("__OnPinChangedToken")) {
            this.remove_PinChanged(this.__OnPinChangedToken)
            this.__OnPinChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BaudRate() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_BaudRate()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BaudRate(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_BaudRate(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BreakSignalState() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_BreakSignalState()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BreakSignalState(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_BreakSignalState(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesReceived() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_BytesReceived()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CarrierDetectState() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_CarrierDetectState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ClearToSendState() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_ClearToSendState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DataBits() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_DataBits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataBits(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_DataBits(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DataSetReadyState() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_DataSetReadyState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Handshake() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_Handshake()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Handshake(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_Handshake(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataTerminalReadyEnabled() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_IsDataTerminalReadyEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDataTerminalReadyEnabled(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_IsDataTerminalReadyEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRequestToSendEnabled() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_IsRequestToSendEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRequestToSendEnabled(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_IsRequestToSendEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Parity() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_Parity()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Parity(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_Parity(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PortName() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_PortName()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ReadTimeout() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_ReadTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_ReadTimeout(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_ReadTimeout(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StopBits() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_StopBits()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StopBits(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_StopBits(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsbVendorId() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_UsbVendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsbProductId() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_UsbProductId()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_WriteTimeout() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_WriteTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_WriteTimeout(value) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.put_WriteTimeout(value)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_InputStream()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.get_OutputStream()
    }

    /**
     * 
     * @param {TypedEventHandler<SerialDevice, ErrorReceivedEventArgs>} reportHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ErrorReceived(reportHandler) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.add_ErrorReceived(reportHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ErrorReceived(token) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.remove_ErrorReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SerialDevice, PinChangedEventArgs>} reportHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PinChanged(reportHandler) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.add_PinChanged(reportHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PinChanged(token) {
        if (!this.HasProp("__ISerialDevice")) {
            if ((queryResult := this.QueryInterface(ISerialDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISerialDevice := ISerialDevice(outPtr)
        }

        return this.__ISerialDevice.remove_PinChanged(token)
    }

    /**
     * Releases the reference to the [SerialDevice](serialdevice.md) object that was previously obtained by calling [FromIdAsync](serialdevice_fromidasync_1322863552.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialdevice.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
