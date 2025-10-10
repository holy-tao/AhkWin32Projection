#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_OCTET_STRING structure is an ADSI representation of the Octet String attribute syntax used in Active Directory.
 * @remarks
 * 
  * Memory for the byte array must be allocated separately.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_octet_string
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_OCTET_STRING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of the character array.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of single byte characters 
     * not interpreted by the underlying directory.
     * @type {Pointer<Byte>}
     */
    lpValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
