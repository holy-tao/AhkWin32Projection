#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REG_UNLOAD_KEY_INFORMATION {
    #StructPack 8

    Object : IntPtr

    UserEvent : IntPtr

    CallContext : IntPtr

    ObjectContext : IntPtr

    Reserved : IntPtr

}
