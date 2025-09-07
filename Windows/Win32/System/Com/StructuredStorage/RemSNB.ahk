#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The RemSNB structure is used for marshaling the SNB data type.Defined in the IStorage interface (Storag.idl).
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-remsnb
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class RemSNB extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Number of strings in the <b>rgString</b> buffer.
     * @type {Integer}
     */
    ulCntStr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size in bytes of the <b>rgString</b> buffer.
     * @type {Integer}
     */
    ulCntChar {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to an array of bytes containing the stream name strings from the <b>SNB</b> structure.
     * @type {String}
     */
    rgString {
        get => StrGet(this.ptr + 8, 0, "UTF-16")
        set => StrPut(value, this.ptr + 8, 0, "UTF-16")
    }
}
