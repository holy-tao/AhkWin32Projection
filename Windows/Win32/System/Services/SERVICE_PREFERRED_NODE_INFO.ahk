#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Represents the preferred node on which to run a service.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_preferred_node_info
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_PREFERRED_NODE_INFO {
    #StructPack 2

    /**
     * The node number of the preferred node.
     */
    usPreferredNode : UInt16

    /**
     * If this member is TRUE, the preferred node setting is deleted.
     */
    fDelete : BOOLEAN

}
