#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The table of NET_INTERFACE_CONTEXT structures.
 * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context_table
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class NET_INTERFACE_CONTEXT_TABLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A handle to the interface context.
     * @type {HANDLE}
     */
    InterfaceContextHandle{
        get {
            if(!this.HasProp("__InterfaceContextHandle"))
                this.__InterfaceContextHandle := HANDLE(0, this)
            return this.__InterfaceContextHandle
        }
    }

    /**
     * The number of entries in the table.
     * @type {Integer}
     */
    NumberOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT</a> structures.
     * @type {Pointer<NET_INTERFACE_CONTEXT>}
     */
    InterfaceContextArray {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
