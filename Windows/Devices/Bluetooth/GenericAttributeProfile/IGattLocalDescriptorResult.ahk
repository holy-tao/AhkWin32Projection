#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GattLocalDescriptor.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattLocalDescriptorResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattLocalDescriptorResult
     * @type {Guid}
     */
    static IID => Guid("{375791be-321f-4366-bfc1-3bc6b82c79f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Descriptor", "get_Error"]

    /**
     * @type {GattLocalDescriptor} 
     */
    Descriptor {
        get => this.get_Descriptor()
    }

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * 
     * @returns {GattLocalDescriptor} 
     */
    get_Descriptor() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GattLocalDescriptor(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
