#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEPreferredConnectionParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEPreferredConnectionParameters
     * @type {Guid}
     */
    static IID => Guid("{f2f44344-7372-5f7b-9b34-29c944f5a715}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LinkTimeout", "get_ConnectionLatency", "get_MinConnectionInterval", "get_MaxConnectionInterval"]

    /**
     * @type {Integer} 
     */
    LinkTimeout {
        get => this.get_LinkTimeout()
    }

    /**
     * @type {Integer} 
     */
    ConnectionLatency {
        get => this.get_ConnectionLatency()
    }

    /**
     * @type {Integer} 
     */
    MinConnectionInterval {
        get => this.get_MinConnectionInterval()
    }

    /**
     * @type {Integer} 
     */
    MaxConnectionInterval {
        get => this.get_MaxConnectionInterval()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LinkTimeout() {
        result := ComCall(6, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionLatency() {
        result := ComCall(7, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinConnectionInterval() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxConnectionInterval() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
