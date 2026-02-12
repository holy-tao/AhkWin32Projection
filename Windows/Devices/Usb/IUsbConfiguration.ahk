#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UsbInterface.ahk
#Include .\UsbConfigurationDescriptor.ahk
#Include .\UsbDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbConfiguration
     * @type {Guid}
     */
    static IID => Guid("{68177429-36a9-46d7-b873-fc689251ec30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UsbInterfaces", "get_ConfigurationDescriptor", "get_Descriptors"]

    /**
     * @type {IVectorView<UsbInterface>} 
     */
    UsbInterfaces {
        get => this.get_UsbInterfaces()
    }

    /**
     * @type {UsbConfigurationDescriptor} 
     */
    ConfigurationDescriptor {
        get => this.get_ConfigurationDescriptor()
    }

    /**
     * @type {IVectorView<UsbDescriptor>} 
     */
    Descriptors {
        get => this.get_Descriptors()
    }

    /**
     * 
     * @returns {IVectorView<UsbInterface>} 
     */
    get_UsbInterfaces() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbInterface, value)
    }

    /**
     * 
     * @returns {UsbConfigurationDescriptor} 
     */
    get_ConfigurationDescriptor() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbConfigurationDescriptor(value)
    }

    /**
     * 
     * @returns {IVectorView<UsbDescriptor>} 
     */
    get_Descriptors() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UsbDescriptor, value)
    }
}
