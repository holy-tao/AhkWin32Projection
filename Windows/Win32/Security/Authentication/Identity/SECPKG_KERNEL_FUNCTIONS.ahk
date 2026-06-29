#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_KERNEL_FUNCTIONS {
    #StructPack 8

    AllocateHeap : IntPtr

    FreeHeap : IntPtr

    CreateContextList : IntPtr

    InsertListEntry : IntPtr

    ReferenceListEntry : IntPtr

    DereferenceListEntry : IntPtr

    SerializeWinntAuthData : IntPtr

    SerializeSchannelAuthData : IntPtr

    LocatePackageById : IntPtr

}
