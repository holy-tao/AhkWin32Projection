#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Provides attributes of a helper.
 * @see https://learn.microsoft.com/windows/win32/api/netsh/ns-netsh-ns_helper_attributes
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct NS_HELPER_ATTRIBUTES {
    #StructPack 8

    dwVersion : UInt32

    dwReserved : UInt32

    /**
     * The GUID of the helper.
     */
    guidHelper : Guid

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_helper_start_fn">NS_HELPER_START_FN</a> entry point (the start function) of the helper.
     */
    pfnStart : IntPtr

    /**
     * A pointer to the 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netsh/nc-netsh-ns_helper_stop_fn">NS_HELPER_STOP_FN</a> entry point (the stop function) of the helper. Set to null if no stop function is implemented.
     */
    pfnStop : IntPtr

    static __New() {
        DefineProp(this.Prototype, '_ullAlign', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
