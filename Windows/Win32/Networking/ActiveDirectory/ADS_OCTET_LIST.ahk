#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_OCTET_LIST structure is an ADSI representation of an ordered sequence of single-byte strings.
 * @remarks
 * For more information, see Novell NetWare Directory Services Schema Specification, version 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_octet_list
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_OCTET_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Pointer to the next <b>ADS_OCTET_LIST</b> entry in the list.
     * @type {Pointer<ADS_OCTET_LIST>}
     */
    Next {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Contains the length, in bytes, of the list.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Pointer to an array of BYTEs that contains the list. The <b>Length</b> member of this structure contains the number of BYTEs in this array.
     * @type {Pointer<Integer>}
     */
    Data {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
