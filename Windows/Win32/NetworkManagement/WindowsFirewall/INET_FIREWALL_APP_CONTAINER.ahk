#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\INET_FIREWALL_AC_CAPABILITIES.ahk
#Include .\INET_FIREWALL_AC_BINARIES.ahk

/**
 * The INET_FIREWALL_APP_CONTAINER structure contains information about a specific app container. (INET_FIREWALL_APP_CONTAINER)
 * @see https://learn.microsoft.com/windows/win32/api/netfw/ns-netfw-inet_firewall_app_container
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INET_FIREWALL_APP_CONTAINER extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: <b>SID*</b>
     * 
     * The package identifier of the app container
     * @type {Pointer<SID>}
     */
    appContainerSid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>SID*</b>
     * 
     * The security identifier (SID) of the user to whom the app container belongs.
     * @type {Pointer<SID>}
     */
    userSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * The app container's globally unique name.
     * 
     *  Also referred to as the  Package Family Name, for the app container of a Windows Store app.
     * @type {Pointer<PWSTR>}
     */
    appContainerName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Friendly name of the app container
     * @type {Pointer<PWSTR>}
     */
    displayName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A description of the app container (its use, the objective of the application that uses it, etc.)
     * @type {Pointer<PWSTR>}
     */
    description {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/networkisolation/ns-networkisolation-inet_firewall_ac_capabilities">INET_FIREWALL_AC_CAPABILITIES</a></b>
     * 
     * The capabilities of the app container.
     * @type {INET_FIREWALL_AC_CAPABILITIES}
     */
    capabilities{
        get {
            if(!this.HasProp("__capabilities"))
                this.__capabilities := INET_FIREWALL_AC_CAPABILITIES(this.ptr + 40)
            return this.__capabilities
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/netfw/ns-netfw-inet_firewall_ac_binaries">INET_FIREWALL_AC_BINARIES</a></b>
     * 
     * Binary paths to the applications running in the app container.
     * @type {INET_FIREWALL_AC_BINARIES}
     */
    binaries{
        get {
            if(!this.HasProp("__binaries"))
                this.__binaries := INET_FIREWALL_AC_BINARIES(this.ptr + 56)
            return this.__binaries
        }
    }

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    workingDirectory {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * 
     * @type {Pointer<PWSTR>}
     */
    packageFullName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
