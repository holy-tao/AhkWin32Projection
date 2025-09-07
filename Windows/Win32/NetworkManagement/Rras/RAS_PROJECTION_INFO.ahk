#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\IN_ADDR.ahk
#Include .\RASPPP_PROJECTION_INFO.ahk
#Include ..\..\Networking\WinSock\IN6_ADDR.ahk
#Include .\RASIKEV2_PROJECTION_INFO.ahk

/**
 * Contains the Point-to-Point (PPP) or Internet Key Exchange version 2 (IKEv2) projection information for a RAS connection.
 * @see https://learn.microsoft.com/windows/win32/api/ras/ns-ras-ras_projection_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RAS_PROJECTION_INFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd408102(v=vs.85)">RASAPIVERSION</a> value that specifies the structure version.
     * @type {Integer}
     */
    version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ras/ne-ras-rasprojection_info_type">RASPROJECTION_INFO_TYPE</a> value that specifies the connection type in <b>union</b>.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {RASPPP_PROJECTION_INFO}
     */
    ppp{
        get {
            if(!this.HasProp("__ppp"))
                this.__ppp := RASPPP_PROJECTION_INFO(this.ptr + 8)
            return this.__ppp
        }
    }

    /**
     * @type {RASIKEV2_PROJECTION_INFO}
     */
    ikev2{
        get {
            if(!this.HasProp("__ikev2"))
                this.__ikev2 := RASIKEV2_PROJECTION_INFO(this.ptr + 8)
            return this.__ikev2
        }
    }
}
