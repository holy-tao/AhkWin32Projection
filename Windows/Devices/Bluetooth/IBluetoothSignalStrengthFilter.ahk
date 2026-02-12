#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothSignalStrengthFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothSignalStrengthFilter
     * @type {Guid}
     */
    static IID => Guid("{df7b7391-6bb5-4cfe-90b1-5d7324edcf7f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InRangeThresholdInDBm", "put_InRangeThresholdInDBm", "get_OutOfRangeThresholdInDBm", "put_OutOfRangeThresholdInDBm", "get_OutOfRangeTimeout", "put_OutOfRangeTimeout", "get_SamplingInterval", "put_SamplingInterval"]

    /**
     * @type {IReference<Integer>} 
     */
    InRangeThresholdInDBm {
        get => this.get_InRangeThresholdInDBm()
        set => this.put_InRangeThresholdInDBm(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    OutOfRangeThresholdInDBm {
        get => this.get_OutOfRangeThresholdInDBm()
        set => this.put_OutOfRangeThresholdInDBm(value)
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    OutOfRangeTimeout {
        get => this.get_OutOfRangeTimeout()
        set => this.put_OutOfRangeTimeout(value)
    }

    /**
     * @type {IReference<TimeSpan>} 
     */
    SamplingInterval {
        get => this.get_SamplingInterval()
        set => this.put_SamplingInterval(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_InRangeThresholdInDBm() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt16(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_InRangeThresholdInDBm(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_OutOfRangeThresholdInDBm() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt16(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_OutOfRangeThresholdInDBm(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_OutOfRangeTimeout() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_OutOfRangeTimeout(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SamplingInterval() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetTimeSpan(), value)
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SamplingInterval(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
