#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\PPP_NBFCP_INFO.ahk
#Include .\PPP_IPCP_INFO2.ahk
#Include .\PPP_IPXCP_INFO.ahk
#Include .\PPP_ATCP_INFO.ahk
#Include .\PPP_CCP_INFO.ahk
#Include .\PPP_LCP_INFO.ahk
#Include .\PPP_INFO_2.ahk

/**
 * The RAS_CONNECTION_2 structure contains information for a connection, including the Globally Unique Identifier (GUID) that identifies the connection.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-ras_connection_2
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_CONNECTION_2 extends Win32Struct
{
    static sizeof => 856

    static packingSize => 8

    /**
     * A handle to the connection.
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(0, this)
            return this.__hConnection
        }
    }

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 8, 256, "UTF-16")
        set => StrPut(value, this.ptr + 8, 256, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     * @type {Integer}
     */
    dwInterfaceType {
        get => NumGet(this, 524, "int")
        set => NumPut("int", value, this, 524)
    }

    /**
     * A GUID  that identifies the connection. For incoming connections, this GUID is valid only as long as the connection is active.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_info_2">PPP_INFO_2</a> structure that contains Point-to-Point (PPP) projection operation information for a connection.
     * @type {PPP_INFO_2}
     */
    PppInfo2{
        get {
            if(!this.HasProp("__PppInfo2"))
                this.__PppInfo2 := PPP_INFO_2(536, this)
            return this.__PppInfo2
        }
    }
}
