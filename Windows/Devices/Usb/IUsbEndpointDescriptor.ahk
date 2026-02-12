#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbBulkInEndpointDescriptor.ahk
#Include .\UsbInterruptInEndpointDescriptor.ahk
#Include .\UsbBulkOutEndpointDescriptor.ahk
#Include .\UsbInterruptOutEndpointDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbEndpointDescriptor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbEndpointDescriptor
     * @type {Guid}
     */
    static IID => Guid("{6b4862d9-8df7-4b40-ac83-578f139f0575}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EndpointNumber", "get_Direction", "get_EndpointType", "get_AsBulkInEndpointDescriptor", "get_AsInterruptInEndpointDescriptor", "get_AsBulkOutEndpointDescriptor", "get_AsInterruptOutEndpointDescriptor"]

    /**
     * @type {Integer} 
     */
    EndpointNumber {
        get => this.get_EndpointNumber()
    }

    /**
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * @type {Integer} 
     */
    EndpointType {
        get => this.get_EndpointType()
    }

    /**
     * @type {UsbBulkInEndpointDescriptor} 
     */
    AsBulkInEndpointDescriptor {
        get => this.get_AsBulkInEndpointDescriptor()
    }

    /**
     * @type {UsbInterruptInEndpointDescriptor} 
     */
    AsInterruptInEndpointDescriptor {
        get => this.get_AsInterruptInEndpointDescriptor()
    }

    /**
     * @type {UsbBulkOutEndpointDescriptor} 
     */
    AsBulkOutEndpointDescriptor {
        get => this.get_AsBulkOutEndpointDescriptor()
    }

    /**
     * @type {UsbInterruptOutEndpointDescriptor} 
     */
    AsInterruptOutEndpointDescriptor {
        get => this.get_AsInterruptOutEndpointDescriptor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointNumber() {
        result := ComCall(6, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Direction() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndpointType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {UsbBulkInEndpointDescriptor} 
     */
    get_AsBulkInEndpointDescriptor() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbBulkInEndpointDescriptor(value)
    }

    /**
     * 
     * @returns {UsbInterruptInEndpointDescriptor} 
     */
    get_AsInterruptInEndpointDescriptor() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterruptInEndpointDescriptor(value)
    }

    /**
     * 
     * @returns {UsbBulkOutEndpointDescriptor} 
     */
    get_AsBulkOutEndpointDescriptor() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbBulkOutEndpointDescriptor(value)
    }

    /**
     * 
     * @returns {UsbInterruptOutEndpointDescriptor} 
     */
    get_AsInterruptOutEndpointDescriptor() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterruptOutEndpointDescriptor(value)
    }
}
