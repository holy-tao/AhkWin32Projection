#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The interface context that is part of the NET_INTERFACE_CONTEXT_TABLE structure.
 * @see https://learn.microsoft.com/windows/win32/api/ondemandconnroutehelper/ns-ondemandconnroutehelper-net_interface_context
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct NET_INTERFACE_CONTEXT {
    #StructPack 8

    /**
     * The interface index.
     */
    InterfaceIndex : UInt32

    /**
     * The configuration name.
     */
    ConfigurationName : PWSTR

}
