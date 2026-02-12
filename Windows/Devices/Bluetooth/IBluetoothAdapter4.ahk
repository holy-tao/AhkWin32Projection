#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothAdapter4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothAdapter4
     * @type {Guid}
     */
    static IID => Guid("{f875f3e1-6d9a-5d5e-aee5-a17248e5f6dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsLowEnergyUncoded2MPhySupported", "get_IsLowEnergyCodedPhySupported"]

    /**
     * @type {Boolean} 
     */
    IsLowEnergyUncoded2MPhySupported {
        get => this.get_IsLowEnergyUncoded2MPhySupported()
    }

    /**
     * @type {Boolean} 
     */
    IsLowEnergyCodedPhySupported {
        get => this.get_IsLowEnergyCodedPhySupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergyUncoded2MPhySupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLowEnergyCodedPhySupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
