#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides additional information for in-memory BLOB subject types.
 * @see https://docs.microsoft.com/windows/win32/api//mssip/ns-mssip-ms_addinfo_blob
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class MS_ADDINFO_BLOB extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size, in bytes, of the data in the <i>pbMemObject</i> member.
     * @type {Integer}
     */
    cbMemObject {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the in-memory BLOB subject.
     * @type {Pointer<Byte>}
     */
    pbMemObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size, in bytes, of the data in the <i>pbMemSignedMsg</i> member.
     * @type {Integer}
     */
    cbMemSignedMsg {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the signed message.
     * @type {Pointer<Byte>}
     */
    pbMemSignedMsg {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
