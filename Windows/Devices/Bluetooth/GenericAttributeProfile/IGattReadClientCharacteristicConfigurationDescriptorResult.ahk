#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattReadClientCharacteristicConfigurationDescriptorResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattReadClientCharacteristicConfigurationDescriptorResult
     * @type {Guid}
     */
    static IID => Guid("{63a66f09-1aea-4c4c-a50f-97bae474b348}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_ClientCharacteristicConfigurationDescriptor"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    ClientCharacteristicConfigurationDescriptor {
        get => this.get_ClientCharacteristicConfigurationDescriptor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ClientCharacteristicConfigurationDescriptor() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
