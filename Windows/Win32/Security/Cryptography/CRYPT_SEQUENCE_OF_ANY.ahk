#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an arbitrary list of encoded BLOBs.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-crypt_sequence_of_any
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_SEQUENCE_OF_ANY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgValue</b> array.
     * @type {Integer}
     */
    cValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DER_BLOB</a> structures.
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    rgValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
