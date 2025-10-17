#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\PPP_NBFCP_INFO.ahk
#Include .\PPP_IPCP_INFO2.ahk
#Include .\PPP_IPV6_CP_INFO.ahk
#Include .\PPP_CCP_INFO.ahk
#Include .\PPP_LCP_INFO.ahk
#Include .\PPP_INFO_3.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The RAS_CONNECTION_3 structure contains information for the connection, including the Globally Unique Identifier (GUID) that identifies the connection and the quarantine state of the connection.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-ras_connection_3
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_CONNECTION_3 extends Win32Struct
{
    static sizeof => 800

    static packingSize => 8

    /**
     * The version of the <b>RAS_CONNECTION_3</b> structure used.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of this <b>RAS_CONNECTION_3</b> structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A handle to the connection.
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(8, this)
            return this.__hConnection
        }
    }

    /**
     * A null-terminated Unicode string that contains the name of the user logged on to the connection.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 16, 256, "UTF-16")
        set => StrPut(value, this.ptr + 16, 256, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">ROUTER_INTERFACE_TYPE</a> enumeration that identifies the type of connection interface.
     * @type {Integer}
     */
    dwInterfaceType {
        get => NumGet(this, 532, "int")
        set => NumPut("int", value, this, 532)
    }

    /**
     * A GUID  that identifies the connection. For incoming connections, this GUID is valid only as long as the connection is active.
     * @type {Pointer<Guid>}
     */
    guid {
        get => NumGet(this, 536, "ptr")
        set => NumPut("ptr", value, this, 536)
    }

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ppp_info_3">PPP_INFO_3</a> structure that contains Point-to-Point (PPP) projection operation information for a connection.
     * @type {PPP_INFO_3}
     */
    PppInfo3{
        get {
            if(!this.HasProp("__PppInfo3"))
                this.__PppInfo3 := PPP_INFO_3(544, this)
            return this.__PppInfo3
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-ras_quarantine_state">RAS_QUARANTINE_STATE</a> structure that specifies the Network Access Protection (NAP) quarantine state of the connection.
     * @type {Integer}
     */
    rasQuarState {
        get => NumGet(this, 784, "int")
        set => NumPut("int", value, this, 784)
    }

    /**
     * A FILETIME structure that specifies the time required for the connection to come out of quarantine after which the connection will be dropped. This value is valid only if <b>rasQuarState</b> has a value of <b>RAS_QUAR_STATE_PROBATION</b>.
     * @type {FILETIME}
     */
    timer{
        get {
            if(!this.HasProp("__timer"))
                this.__timer := FILETIME(792, this)
            return this.__timer
        }
    }
}
