#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattDeviceService.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GattDescriptor.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristic2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristic2
     * @type {Guid}
     */
    static IID => Guid("{ae1ab578-ec06-4764-b780-9835a1d35d6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Service", "GetAllDescriptors"]

    /**
     * @type {GattDeviceService} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * 
     * @returns {GattDeviceService} 
     */
    get_Service() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattDeviceService(value)
    }

    /**
     * 
     * @returns {IVectorView<GattDescriptor>} 
     */
    GetAllDescriptors() {
        result := ComCall(7, this, "ptr*", &descriptors := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GattDescriptor, descriptors)
    }
}
