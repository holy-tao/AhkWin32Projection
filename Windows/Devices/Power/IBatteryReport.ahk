#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class IBatteryReport extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBatteryReport
     * @type {Guid}
     */
    static IID => Guid("{c9858c3a-4e13-420a-a8d0-24f18f395401}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChargeRateInMilliwatts", "get_DesignCapacityInMilliwattHours", "get_FullChargeCapacityInMilliwattHours", "get_RemainingCapacityInMilliwattHours", "get_Status"]

    /**
     * @type {IReference<Integer>} 
     */
    ChargeRateInMilliwatts {
        get => this.get_ChargeRateInMilliwatts()
    }

    /**
     * @type {IReference<Integer>} 
     */
    DesignCapacityInMilliwattHours {
        get => this.get_DesignCapacityInMilliwattHours()
    }

    /**
     * @type {IReference<Integer>} 
     */
    FullChargeCapacityInMilliwattHours {
        get => this.get_FullChargeCapacityInMilliwattHours()
    }

    /**
     * @type {IReference<Integer>} 
     */
    RemainingCapacityInMilliwattHours {
        get => this.get_RemainingCapacityInMilliwattHours()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ChargeRateInMilliwatts() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DesignCapacityInMilliwattHours() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_FullChargeCapacityInMilliwattHours() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RemainingCapacityInMilliwattHours() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
