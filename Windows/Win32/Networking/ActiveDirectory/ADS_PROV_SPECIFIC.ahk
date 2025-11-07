#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_PROV_SPECIFIC structure contains provider-specific data represented as a binary large object (BLOB).
 * @remarks
 * 
 * The <b>ADS_PROV_SPECIFIC</b> structure is one of the data types used as a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure definition. The data is represented as a BLOB here, although the actual data can be packed in any format, such as a C structure. The provider writer must publish the specific data format under the BLOB.
 * 
 * ADSI may also return attributes as <b>ADS_PROV_SPECIFIC</b> if unable to determine the correct attribute syntax type as would occur if, for example, the schema was unavailable.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_prov_specific
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_PROV_SPECIFIC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the character array.
     * @type {Integer}
     */
    dwLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of bytes.
     * @type {Pointer<Integer>}
     */
    lpValue {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
