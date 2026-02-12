#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbBulkOutPipe.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbBulkOutEndpointDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbBulkOutEndpointDescriptor
     * @type {Guid}
     */
    static IID => Guid("{2820847a-ffee-4f60-9be1-956cac3ecb65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxPacketSize", "get_EndpointNumber", "get_Pipe"]

    /**
     * @type {Integer} 
     */
    MaxPacketSize {
        get => this.get_MaxPacketSize()
    }

    /**
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * @type {UsbBulkOutPipe} 
     */
    Pipe {
        get => this.get_Pipe()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPacketSize() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointNumber() {
        result := ComCall(7, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UsbBulkOutPipe} 
     */
    get_Pipe() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbBulkOutPipe(value)
    }
}
