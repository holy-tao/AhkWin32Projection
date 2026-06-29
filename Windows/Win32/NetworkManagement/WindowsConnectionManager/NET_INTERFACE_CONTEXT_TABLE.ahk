#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\NET_INTERFACE_CONTEXT.ahk" { NET_INTERFACE_CONTEXT }

/**
 * The table of NET_INTERFACE_CONTEXT structures.
 * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context_table
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct NET_INTERFACE_CONTEXT_TABLE {
    #StructPack 8

    /**
     * A handle to the interface context.
     */
    InterfaceContextHandle : HANDLE

    /**
     * The number of entries in the table.
     */
    NumberOfEntries : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context">NET_INTERFACE_CONTEXT</a> structures.
     */
    InterfaceContextArray : NET_INTERFACE_CONTEXT.Ptr

}
