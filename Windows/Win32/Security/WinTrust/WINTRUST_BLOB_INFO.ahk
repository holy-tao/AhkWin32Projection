#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used when calling WinVerifyTrust to verify a memory BLOB.
 * @see https://docs.microsoft.com/windows/win32/api//wintrust/ns-wintrust-wintrust_blob_info
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_BLOB_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The number of bytes in this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <b>GUID</b> of the SIP to load.
     * @type {Pointer<Guid>}
     */
    gSubject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A string that contains the name of the memory object pointed to by <b>pbMem</b>.
     * @type {Pointer<Char>}
     */
    pcwszDisplayName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The length, in bytes, of the memory BLOB to be verified.
     * @type {Integer}
     */
    cbMemObject {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to a memory BLOB to be verified.
     * @type {Pointer<Byte>}
     */
    pbMemObject {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * This member is reserved. Do not use it.
     * @type {Integer}
     */
    cbMemSignedMsg {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * This member is reserved. Do not use it.
     * @type {Pointer<Byte>}
     */
    pbMemSignedMsg {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
