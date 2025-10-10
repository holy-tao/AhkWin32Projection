#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of certificates.
 * @see https://docs.microsoft.com/windows/win32/api//winefs/ns-winefs-encryption_certificate_list
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class ENCRYPTION_CERTIFICATE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of certificates in the list.
     * @type {Integer}
     */
    nUsers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the first 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/winefs/ns-winefs-encryption_certificate">ENCRYPTION_CERTIFICATE</a> structure in the list.
     * @type {Pointer<ENCRYPTION_CERTIFICATE>}
     */
    pUsers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
