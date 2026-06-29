#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_KERNEL_FUNCTION_TABLE {
    #StructPack 8

    Initialize : IntPtr

    DeleteContext : IntPtr

    InitContext : IntPtr

    MapHandle : IntPtr

    Sign : IntPtr

    Verify : IntPtr

    Seal : IntPtr

    Unseal : IntPtr

    GetToken : IntPtr

    QueryAttributes : IntPtr

    CompleteToken : IntPtr

    ExportContext : IntPtr

    ImportContext : IntPtr

    SetPackagePagingMode : IntPtr

    SerializeAuthData : IntPtr

}
