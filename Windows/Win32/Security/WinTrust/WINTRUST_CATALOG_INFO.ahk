#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINTRUST_CATALOG_INFO structure is used when calling WinVerifyTrust to verify a member of a Microsoft catalog.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_catalog_info
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_CATALOG_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Optional. Catalog version number.
     * @type {Integer}
     */
    dwCatalogVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The full path and file name of the catalog file that contains the member to be verified.
     * @type {Pointer<PWSTR>}
     */
    pcwszCatalogFilePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Tag of a member file to be verified.
     * @type {Pointer<PWSTR>}
     */
    pcwszMemberTag {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The full path and file name of the catalog member file to be verified.
     * @type {Pointer<PWSTR>}
     */
    pcwszMemberFilePath {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional. Handle of the open catalog member file to be verified. The handle must be to a file with at least read permissions.
     * @type {Pointer<HANDLE>}
     */
    hMemberFile {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Optional. The calculated hash of the file that contains the file to be verified.
     * @type {Pointer<Byte>}
     */
    pbCalculatedFileHash {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The size, in bytes, of the value passed in the <b>pbCalculatedFileHash</b> member. <b>cbCalculatedFileHash</b> is used only if the calculated hash is being passed.
     * @type {Integer}
     */
    cbCalculatedFileHash {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_context">CTL_CONTEXT</a> structure that represents  a catalog context to be used instead of a catalog file.
     * @type {Pointer<CTL_CONTEXT>}
     */
    pcCatalogContext {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Handle to the catalog administrator context that was used when calculating the hash of the file. This value can be zero only for a SHA1 file hash.<b>Windows 8 and Windows Server 2012:  </b>Support for this member begins.
     * @type {Pointer}
     */
    hCatAdmin {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
