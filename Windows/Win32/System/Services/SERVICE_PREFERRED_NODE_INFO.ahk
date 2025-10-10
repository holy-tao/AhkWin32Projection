#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the preferred node on which to run a service.
 * @see https://docs.microsoft.com/windows/win32/api//winsvc/ns-winsvc-service_preferred_node_info
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_PREFERRED_NODE_INFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The node number of the preferred node.
     * @type {Integer}
     */
    usPreferredNode {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * If this member is TRUE, the preferred node setting is deleted.
     * @type {Integer}
     */
    fDelete {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
