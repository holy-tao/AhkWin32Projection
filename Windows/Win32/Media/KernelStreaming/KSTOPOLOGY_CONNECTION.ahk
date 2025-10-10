#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This topic applies to Windows XP Service Pack 2 or later. The KSTOPOLOGY_CONNECTION structure describes a node connection within a kernel-streaming (KS) filter. A node can be connected to another node within the filter, or to a pin on the filter.
 * @see https://docs.microsoft.com/windows/win32/api//vidcap/ns-vidcap-kstopology_connection
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSTOPOLOGY_CONNECTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Index of the upstream node in the connection. If the upstream connection is a pin, rather than a node, the value is KSFILTER_NODE.
     * @type {Integer}
     */
    FromNode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If the value of the <b>FromNode</b> field is KSFILTER_NODE, this field specifies the index of the upstream pin. Otherwise, this field is ignored.
     * @type {Integer}
     */
    FromNodePin {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Index of the downstream node in the connection. If the downstream connection is a pin, rather than a node, the value is KSFILTER_NODE.
     * @type {Integer}
     */
    ToNode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If the value of the <b>ToNode</b> field is KSFILTER_NODE, this field specifies the index of the downstream pin. Otherwise, this field is ignored.
     * @type {Integer}
     */
    ToNodePin {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
