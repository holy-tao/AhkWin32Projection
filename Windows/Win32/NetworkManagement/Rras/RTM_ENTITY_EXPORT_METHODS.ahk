#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_ENTITY_EXPORT_METHODS structure contains the set of methods exported by a client.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_export_methods
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_ENTITY_EXPORT_METHODS {
    #StructPack 8

    /**
     * Specifies the number of methods exported by the client in the <b>Methods</b> member.
     */
    NumMethods : UInt32

    /**
     * Specifies which methods the client is exporting.
     */
    Methods : IntPtr[1]

}
