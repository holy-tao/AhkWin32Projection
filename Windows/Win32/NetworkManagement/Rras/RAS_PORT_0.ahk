#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The RAS_PORT_0 structure contains general information regarding a specific RAS port, such as port condition and port name. For more detailed information about a specific port, such as line speed or errors, see RAS_PORT_1.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_port_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_PORT_0 extends Win32Struct
{
    static sizeof => 392

    static packingSize => 8

    /**
     * Handle to the port.
     * @type {HANDLE}
     */
    hPort{
        get {
            if(!this.HasProp("__hPort"))
                this.__hPort := HANDLE(this.ptr + 0)
            return this.__hPort
        }
    }

    /**
     * Handle to the connection.
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(this.ptr + 8)
            return this.__hConnection
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_port_condition">RAS_PORT_CONDITION</a> structure.
     * @type {Integer}
     */
    dwPortCondition {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the cumulative number of calls this port has serviced.
     * @type {Integer}
     */
    dwTotalNumberOfCalls {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the duration of the current connection, in seconds.
     * @type {Integer}
     */
    dwConnectDuration {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the port name.
     * @type {String}
     */
    wszPortName {
        get => StrGet(this.ptr + 28, 16, "UTF-16")
        set => StrPut(value, this.ptr + 28, 16, "UTF-16")
    }

    /**
     * Specifies the media name.
     * @type {String}
     */
    wszMediaName {
        get => StrGet(this.ptr + 62, 16, "UTF-16")
        set => StrPut(value, this.ptr + 62, 16, "UTF-16")
    }

    /**
     * Specifies the device name.
     * @type {String}
     */
    wszDeviceName {
        get => StrGet(this.ptr + 96, 128, "UTF-16")
        set => StrPut(value, this.ptr + 96, 128, "UTF-16")
    }

    /**
     * Specifies the device type.
     * @type {String}
     */
    wszDeviceType {
        get => StrGet(this.ptr + 354, 16, "UTF-16")
        set => StrPut(value, this.ptr + 354, 16, "UTF-16")
    }
}
