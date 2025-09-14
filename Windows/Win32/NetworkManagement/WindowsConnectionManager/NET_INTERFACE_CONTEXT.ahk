#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The interface context that is part of the NET_INTERFACE_CONTEXT_TABLE structure.
 * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class NET_INTERFACE_CONTEXT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The interface index.
     * @type {Integer}
     */
    InterfaceIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The configuration name.
     * @type {Pointer<PWSTR>}
     */
    ConfigurationName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
