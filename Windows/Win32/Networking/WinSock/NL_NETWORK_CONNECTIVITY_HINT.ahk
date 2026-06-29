#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NL_NETWORK_CONNECTIVITY_COST_HINT.ahk" { NL_NETWORK_CONNECTIVITY_COST_HINT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\NL_NETWORK_CONNECTIVITY_LEVEL_HINT.ahk" { NL_NETWORK_CONNECTIVITY_LEVEL_HINT }

/**
 * Describes a level of network connectivity, the usage charge for a network connection, and other members reflecting cost factors.
 * @see https://learn.microsoft.com/windows/win32/api/nldef/ns-nldef-nl_network_connectivity_hint
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NL_NETWORK_CONNECTIVITY_HINT {
    #StructPack 4

    /**
     * Type: **[NL_NETWORK_CONNECTIVITY_LEVEL_HINT](./ne-nldef-nl_network_connectivity_level_hint.md)**
     * 
     * The level of network connectivity.
     */
    ConnectivityLevel : NL_NETWORK_CONNECTIVITY_LEVEL_HINT

    /**
     * Type: **[NL_NETWORK_CONNECTIVITY_COST_HINT](./ne-nldef-nl_network_connectivity_cost_hint.md)**
     * 
     * The usage charge for the network connection.
     */
    ConnectivityCost : NL_NETWORK_CONNECTIVITY_COST_HINT

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the connection is approaching its data limit, otherwise `FALSE`.
     */
    ApproachingDataLimit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the connection has exceeded its data limit, otherwise `FALSE`.
     */
    OverDataLimit : BOOLEAN

    /**
     * Type: **[BOOLEAN](/windows/win32/winprog/windows-data-types)**
     * 
     * `TRUE` if the connection is roaming, otherwise `FALSE`.
     */
    Roaming : BOOLEAN

}
