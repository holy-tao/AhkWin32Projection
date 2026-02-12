#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattServiceProviderAdvertisingParameters3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProviderAdvertisingParameters3
     * @type {Guid}
     */
    static IID => Guid("{a23546b2-b216-5929-9055-f1313dd53e2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UseLowEnergyUncoded1MPhyAsSecondaryPhy", "put_UseLowEnergyUncoded1MPhyAsSecondaryPhy", "get_UseLowEnergyUncoded2MPhyAsSecondaryPhy", "put_UseLowEnergyUncoded2MPhyAsSecondaryPhy"]

    /**
     * @type {Boolean} 
     */
    UseLowEnergyUncoded1MPhyAsSecondaryPhy {
        get => this.get_UseLowEnergyUncoded1MPhyAsSecondaryPhy()
        set => this.put_UseLowEnergyUncoded1MPhyAsSecondaryPhy(value)
    }

    /**
     * @type {Boolean} 
     */
    UseLowEnergyUncoded2MPhyAsSecondaryPhy {
        get => this.get_UseLowEnergyUncoded2MPhyAsSecondaryPhy()
        set => this.put_UseLowEnergyUncoded2MPhyAsSecondaryPhy(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseLowEnergyUncoded1MPhyAsSecondaryPhy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseLowEnergyUncoded1MPhyAsSecondaryPhy(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseLowEnergyUncoded2MPhyAsSecondaryPhy() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseLowEnergyUncoded2MPhyAsSecondaryPhy(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
