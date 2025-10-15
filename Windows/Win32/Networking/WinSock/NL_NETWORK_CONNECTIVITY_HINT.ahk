#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes a level of network connectivity, the usage charge for a network connection, and other members reflecting cost factors.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//nldef/ns-nldef-nl_network_connectivity_hint
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_NETWORK_CONNECTIVITY_HINT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: **[NL_NETWORK_CONNECTIVITY_LEVEL_HINT](./ne-nldef-nl_network_connectivity_level_hint.md)**
     * 
     * The level of network connectivity.
     * @type {Integer}
     */
    ConnectivityLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[NL_NETWORK_CONNECTIVITY_COST_HINT](./ne-nldef-nl_network_connectivity_cost_hint.md)**
     * 
     * The usage charge for the network connection.
     * @type {Integer}
     */
    ConnectivityCost {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the connection is approaching its data limit, otherwise `FALSE`.
     * @type {BOOLEAN}
     */
    ApproachingDataLimit{
        get {
            if(!this.HasProp("__ApproachingDataLimit"))
                this.__ApproachingDataLimit := BOOLEAN(this.ptr + 8)
            return this.__ApproachingDataLimit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the connection has exceeded its data limit, otherwise `FALSE`.
     * @type {BOOLEAN}
     */
    OverDataLimit{
        get {
            if(!this.HasProp("__OverDataLimit"))
                this.__OverDataLimit := BOOLEAN(this.ptr + 9)
            return this.__OverDataLimit
        }
    }

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the connection is roaming, otherwise `FALSE`.
     * @type {BOOLEAN}
     */
    Roaming{
        get {
            if(!this.HasProp("__Roaming"))
                this.__Roaming := BOOLEAN(this.ptr + 10)
            return this.__Roaming
        }
    }
}
