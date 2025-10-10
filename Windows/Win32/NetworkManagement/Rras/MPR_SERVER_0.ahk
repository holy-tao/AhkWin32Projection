#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MPR_SERVER_0 structure is used to retrieve information about a device.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_server_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_SERVER_0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A <b>BOOL</b> that specifies whether the Demand Dial Manager (DDM) is running on the device. If <b>TRUE</b>, the DDM is not running on the device. Otherwise, it is <b>FALSE</b>.
     * @type {Integer}
     */
    fLanOnlyMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the elapsed time, in seconds, since the device was started.
     * @type {Integer}
     */
    dwUpTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the number of ports on the device.
     * @type {Integer}
     */
    dwTotalPorts {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the number of ports currently in use on the device.
     * @type {Integer}
     */
    dwPortsInUse {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
