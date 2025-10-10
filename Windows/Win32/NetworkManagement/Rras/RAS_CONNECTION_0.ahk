#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RAS_CONNECTION_0 structure contains general information regarding a specific connection, such as user name or domain. For more detailed information about a specific connection, such as bytes sent or received, see RAS_CONNECTION_1.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ras_connection_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_CONNECTION_0 extends Win32Struct
{
    static sizeof => 1128

    static packingSize => 8

    /**
     * A handle to the connection.
     * @type {Pointer<Void>}
     */
    hConnection {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A handle to the interface.
     * @type {Pointer<Void>}
     */
    hInterface {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A value that represent the duration of the connection, in seconds.
     * @type {Integer}
     */
    dwConnectDuration {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     * @type {Integer}
     */
    dwInterfaceType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    dwConnectionFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A null-terminated Unicode string that contains the name of the interface for this connection.
     * @type {String}
     */
    wszInterfaceName {
        get => StrGet(this.ptr + 28, 256, "UTF-16")
        set => StrPut(value, this.ptr + 28, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 542, 256, "UTF-16")
        set => StrPut(value, this.ptr + 542, 256, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the domain on which the connected user is authenticated.
     * @type {String}
     */
    wszLogonDomain {
        get => StrGet(this.ptr + 1056, 15, "UTF-16")
        set => StrPut(value, this.ptr + 1056, 15, "UTF-16")
    }

    /**
     * A null-terminated Unicode string that contains the name of the remote computer.
     * @type {String}
     */
    wszRemoteComputer {
        get => StrGet(this.ptr + 1088, 16, "UTF-16")
        set => StrPut(value, this.ptr + 1088, 16, "UTF-16")
    }
}
