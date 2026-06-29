#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information returned from a MIB opaque query.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-mib_opaque_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_OPAQUE_INFO {
    #StructPack 8

    /**
     * The type of information returned.
     */
    dwId : UInt32

    ullAlign : Int64

    static __New() {
        DefineProp(this.Prototype, 'rgbyData', { type: Int8[1], offset: 8 })
        this.DeleteProp("__New")
    }
}
