#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_ADD_PAGES {
    #StructPack 8

    Context : IntPtr

    Flags : UInt32

    BugCheckCode : UInt32

    Address : IntPtr

    Count : IntPtr

}
