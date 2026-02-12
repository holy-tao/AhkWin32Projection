#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\XboxLiveDeviceAddress.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class IXboxLiveQualityOfServiceMetricResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXboxLiveQualityOfServiceMetricResult
     * @type {Guid}
     */
    static IID => Guid("{aeec53d1-3561-4782-b0cf-d3ae29d9fa87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_DeviceAddress", "get_Metric", "get_Value"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {XboxLiveDeviceAddress} 
     */
    DeviceAddress {
        get => this.get_DeviceAddress()
    }

    /**
     * @type {Integer} 
     */
    Metric {
        get => this.get_Metric()
    }

    /**
     * @type {Integer} 
     */
    Value {
        get => this.get_Value()
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
     * @returns {XboxLiveDeviceAddress} 
     */
    get_DeviceAddress() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return XboxLiveDeviceAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Metric() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Value() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
