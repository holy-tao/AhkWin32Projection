#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INET_FIREWALL_AC_CAPABILITIES.ahk
#Include .\INET_FIREWALL_AC_BINARIES.ahk

/**
 * Contains information about a change made to an app container.
 * @see https://docs.microsoft.com/windows/win32/api//networkisolation/ns-networkisolation-inet_firewall_ac_change
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INET_FIREWALL_AC_CHANGE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/netfw/ne-netfw-inet_firewall_ac_change_type">INET_FIREWALL_AC_CHANGE_TYPE</a></b>
     * 
     * The type of change made.
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/networkisolation/ne-networkisolation-inet_firewall_ac_creation_type">INET_FIREWALL_AC_CREATION_TYPE</a></b>
     * 
     * The method by which the app container was created.
     * @type {Integer}
     */
    createType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>SID*</b>
     * 
     * The package identifier of the app container
     * @type {Pointer<SID>}
     */
    appContainerSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>SID*</b>
     * 
     * The security identifier (SID) of the user to whom the app container belongs.
     * @type {Pointer<SID>}
     */
    userSid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Friendly name of the app container.
     * @type {PWSTR}
     */
    displayName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {INET_FIREWALL_AC_CAPABILITIES}
     */
    capabilities{
        get {
            if(!this.HasProp("__capabilities"))
                this.__capabilities := INET_FIREWALL_AC_CAPABILITIES(32, this)
            return this.__capabilities
        }
    }

    /**
     * @type {INET_FIREWALL_AC_BINARIES}
     */
    binaries{
        get {
            if(!this.HasProp("__binaries"))
                this.__binaries := INET_FIREWALL_AC_BINARIES(32, this)
            return this.__binaries
        }
    }
}
