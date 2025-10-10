#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a certificate hash.
 * @see https://docs.microsoft.com/windows/win32/api//winefs/ns-winefs-efs_hash_blob
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class EFS_HASH_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of bytes in the <b>pbData</b> buffer.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The certificate hash.
     * @type {Pointer<Byte>}
     */
    pbData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
