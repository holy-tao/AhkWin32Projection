#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include .\UsbInterface.ahk
#Include .\UsbDeviceDescriptor.ahk
#Include .\UsbConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbDevice
     * @type {Guid}
     */
    static IID => Guid("{5249b992-c456-44d5-ad5e-24f5a089f63b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendControlOutTransferAsync", "SendControlOutTransferAsyncNoBuffer", "SendControlInTransferAsync", "SendControlInTransferAsyncNoBuffer", "get_DefaultInterface", "get_DeviceDescriptor", "get_Configuration"]

    /**
     * @type {UsbInterface} 
     */
    DefaultInterface {
        get => this.get_DefaultInterface()
    }

    /**
     * @type {UsbDeviceDescriptor} 
     */
    DeviceDescriptor {
        get => this.get_DeviceDescriptor()
    }

    /**
     * @type {UsbConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * 
     * @param {UsbSetupPacket} setupPacket 
     * @param {IBuffer} buffer_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    SendControlOutTransferAsync(setupPacket, buffer_) {
        result := ComCall(6, this, "ptr", setupPacket, "ptr", buffer_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @param {UsbSetupPacket} setupPacket 
     * @returns {IAsyncOperation<Integer>} 
     */
    SendControlOutTransferAsyncNoBuffer(setupPacket) {
        result := ComCall(7, this, "ptr", setupPacket, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @param {UsbSetupPacket} setupPacket 
     * @param {IBuffer} buffer_ 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    SendControlInTransferAsync(setupPacket, buffer_) {
        result := ComCall(8, this, "ptr", setupPacket, "ptr", buffer_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }

    /**
     * 
     * @param {UsbSetupPacket} setupPacket 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    SendControlInTransferAsyncNoBuffer(setupPacket) {
        result := ComCall(9, this, "ptr", setupPacket, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }

    /**
     * 
     * @returns {UsbInterface} 
     */
    get_DefaultInterface() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterface(value)
    }

    /**
     * 
     * @returns {UsbDeviceDescriptor} 
     */
    get_DeviceDescriptor() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbDeviceDescriptor(value)
    }

    /**
     * 
     * @returns {UsbConfiguration} 
     */
    get_Configuration() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbConfiguration(value)
    }
}
