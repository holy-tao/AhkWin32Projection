#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes packets nested in OPTION_RELAY_MSG message.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_dhcpv6_nested_relay_message
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class PXE_DHCPV6_NESTED_RELAY_MESSAGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A pointer to the nested RELAY-FORW message.
     * @type {Pointer<PXE_DHCPV6_RELAY_MESSAGE>}
     */
    pRelayMessage {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the size of the nested RELAY-FORW message.
     * @type {Integer}
     */
    cbRelayMessage {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the nested RELAY-FORW message contains <b>OPTION_INTERFACE_ID</b>, this  is a pointer to the option payload. Otherwise, this field will be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pInterfaceIdOption {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * If the nested RELAY-FORW message contains <b>OPTION_INTERFACE_ID</b>, this  is the size of the option payload.
     *      Otherwise, this field will be 0.
     * @type {Integer}
     */
    cbInterfaceIdOption {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
