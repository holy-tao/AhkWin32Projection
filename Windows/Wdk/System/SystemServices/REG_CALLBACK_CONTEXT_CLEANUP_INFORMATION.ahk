#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_CALLBACK_CONTEXT_CLEANUP_INFORMATION {
    #StructPack 8

    Object : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
