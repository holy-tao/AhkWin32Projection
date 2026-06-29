#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This topic applies to Windows XP Service Pack 2 or later. The KSTOPOLOGY_CONNECTION structure describes a node connection within a kernel-streaming (KS) filter. A node can be connected to another node within the filter, or to a pin on the filter.
 * @see https://learn.microsoft.com/windows/win32/api/vidcap/ns-vidcap-kstopology_connection
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSTOPOLOGY_CONNECTION {
    #StructPack 4

    /**
     * Index of the upstream node in the connection. If the upstream connection is a pin, rather than a node, the value is KSFILTER_NODE.
     */
    FromNode : UInt32

    /**
     * If the value of the <b>FromNode</b> field is KSFILTER_NODE, this field specifies the index of the upstream pin. Otherwise, this field is ignored.
     */
    FromNodePin : UInt32

    /**
     * Index of the downstream node in the connection. If the downstream connection is a pin, rather than a node, the value is KSFILTER_NODE.
     */
    ToNode : UInt32

    /**
     * If the value of the <b>ToNode</b> field is KSFILTER_NODE, this field specifies the index of the downstream pin. Otherwise, this field is ignored.
     */
    ToNodePin : UInt32

}
