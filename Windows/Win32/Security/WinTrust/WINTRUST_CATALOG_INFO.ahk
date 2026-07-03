#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Cryptography\CTL_CONTEXT.ahk" { CTL_CONTEXT }

/**
 * The WINTRUST_CATALOG_INFO structure is used when calling WinVerifyTrust to verify a member of a Microsoft catalog.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_catalog_info
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct WINTRUST_CATALOG_INFO {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * Optional. Catalog version number.
     */
    dwCatalogVersion : UInt32

    /**
     * The full path and file name of the catalog file that contains the member to be verified.
     */
    pcwszCatalogFilePath : PWSTR

    /**
     * Tag of a member file to be verified.
     */
    pcwszMemberTag : PWSTR

    /**
     * The full path and file name of the catalog member file to be verified.
     */
    pcwszMemberFilePath : PWSTR

    /**
     * Optional. Handle of the open catalog member file to be verified. The handle must be to a file with at least read permissions.
     */
    hMemberFile : HANDLE

    /**
     * Optional. The calculated hash of the file that contains the file to be verified.
     */
    pbCalculatedFileHash : IntPtr

    /**
     * The size, in bytes, of the value passed in the <b>pbCalculatedFileHash</b> member. <b>cbCalculatedFileHash</b> is used only if the calculated hash is being passed.
     */
    cbCalculatedFileHash : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> structure that represents  a catalog context to be used instead of a catalog file.
     */
    pcCatalogContext : CTL_CONTEXT.Ptr

    /**
     * Handle to the catalog administrator context that was used when calculating the hash of the file. This value can be zero only for a SHA1 file hash.<b>Windows 8 and Windows Server 2012:  </b>Support for this member begins.
     */
    hCatAdmin : IntPtr

}
