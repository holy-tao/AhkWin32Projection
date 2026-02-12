#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UsbBulkInPipe.ahk
#Include .\UsbInterruptInPipe.ahk
#Include .\UsbBulkOutPipe.ahk
#Include .\UsbInterruptOutPipe.ahk
#Include .\UsbInterfaceSetting.ahk
#Include .\UsbDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterface
     * @type {Guid}
     */
    static IID => Guid("{a0322b95-7f47-48ab-a727-678c25be2112}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BulkInPipes", "get_InterruptInPipes", "get_BulkOutPipes", "get_InterruptOutPipes", "get_InterfaceSettings", "get_InterfaceNumber", "get_Descriptors"]

    /**
     * @type {IVectorView<UsbBulkInPipe>} 
     */
    BulkInPipes {
        get => this.get_BulkInPipes()
    }

    /**
     * @type {IVectorView<UsbInterruptInPipe>} 
     */
    InterruptInPipes {
        get => this.get_InterruptInPipes()
    }

    /**
     * @type {IVectorView<UsbBulkOutPipe>} 
     */
    BulkOutPipes {
        get => this.get_BulkOutPipes()
    }

    /**
     * @type {IVectorView<UsbInterruptOutPipe>} 
     */
    InterruptOutPipes {
        get => this.get_InterruptOutPipes()
    }

    /**
     * @type {IVectorView<UsbInterfaceSetting>} 
     */
    InterfaceSettings {
        get => this.get_InterfaceSettings()
    }

    /**
     * @type {Integer} 
     */
    InterfaceNumber {
        get => this.get_InterfaceNumber()
    }

    /**
     * @type {IVectorView<UsbDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
    }

    /**
     * 
     * @returns {IVectorView<UsbBulkInPipe>} 
     */
    get_BulkInPipes() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbBulkInPipe, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptInPipe>} 
     */
    get_InterruptInPipes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbInterruptInPipe, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbBulkOutPipe>} 
     */
    get_BulkOutPipes() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbBulkOutPipe, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbInterruptOutPipe>} 
     */
    get_InterruptOutPipes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbInterruptOutPipe, value)
    }

    /**
     * 
     * @returns {IVectorView<UsbInterfaceSetting>} 
     */
    get_InterfaceSettings() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbInterfaceSetting, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InterfaceNumber() {
        result := ComCall(11, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<UsbDescriptor>} 
     */
    get_Descriptors() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbDescriptor, value)
    }
}
