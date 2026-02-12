#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UsbBulkInEndpointDescriptor.ahk
#Include .\UsbInterruptInEndpointDescriptor.ahk
#Include .\UsbBulkOutEndpointDescriptor.ahk
#Include .\UsbInterruptOutEndpointDescriptor.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\UsbInterfaceDescriptor.ahk
#Include .\UsbDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterfaceSetting extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterfaceSetting
     * @type {Guid}
     */
    static IID => Guid("{1827bba7-8da7-4af7-8f4c-7f3032e781f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BulkInEndpoints", "get_InterruptInEndpoints", "get_BulkOutEndpoints", "get_InterruptOutEndpoints", "get_Selected", "SelectSettingAsync", "get_InterfaceDescriptor", "get_Descriptors"]

    /**
     * @type {IVectorView<UsbBulkInEndpointDescriptor>} 
     */
    BulkInEndpoints {
        get => this.get_BulkInEndpoints()
    }

    /**
     * @type {IVectorView<UsbInterruptInEndpointDescriptor>} 
     */
    InterruptInEndpoints {
        get => this.get_InterruptInEndpoints()
    }

    /**
     * @type {IVectorView<UsbBulkOutEndpointDescriptor>} 
     */
    BulkOutEndpoints {
        get => this.get_BulkOutEndpoints()
    }

    /**
     * @type {IVectorView<UsbInterruptOutEndpointDescriptor>} 
     */
    InterruptOutEndpoints {
        get => this.get_InterruptOutEndpoints()
    }

    /**
     * @type {Boolean} 
     */
    Selected {
        get => this.get_Selected()
    }

    /**
     * @type {UsbInterfaceDescriptor} 
     */
    InterfaceDescriptor {
        get => this.get_InterfaceDescriptor()
    }

    /**
     * @type {IVectorView<UsbDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
    }

    /**
     * 
     * @returns {IVectorView<UsbBulkInEndpointDescriptor>} 
     */
    get_BulkInEndpoints() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbBulkInEndpointDescriptor, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptInEndpointDescriptor>} 
     */
    get_InterruptInEndpoints() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbInterruptInEndpointDescriptor, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbBulkOutEndpointDescriptor>} 
     */
    get_BulkOutEndpoints() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbBulkOutEndpointDescriptor, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptOutEndpointDescriptor>} 
     */
    get_InterruptOutEndpoints() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbInterruptOutEndpointDescriptor, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Selected() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SelectSettingAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {UsbInterfaceDescriptor} 
     */
    get_InterfaceDescriptor() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterfaceDescriptor(value)
    }

    /**
     * 
     * @returns {IVectorView<UsbDescriptor>} 
     */
    get_Descriptors() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbDescriptor, value)
    }
}
