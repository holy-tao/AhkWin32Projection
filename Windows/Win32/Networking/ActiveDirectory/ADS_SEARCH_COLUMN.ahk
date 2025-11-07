#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The ADS_SEARCH_COLUMN structure specifies the contents of a search column in the query returned from the directory service database.
 * @remarks
 * 
 * The <b>ADS_SEARCH_COLUMN</b> structure only contains a pointer to the array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures. Memory for the structure must be allocated separately.
 * 
 * For more information about  <b>ADS_SEARCH_COLUMN</b>, see  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectorysearch-getcolumn">IDirectorySearch::GetColumn</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_search_column
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_SEARCH_COLUMN extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A  null-terminated Unicode string that contains the name of the attribute whose values are contained in the current search column.
     * @type {PWSTR}
     */
    pszAttrName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Value from the  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration that indicates how the attribute values are interpreted.
     * @type {Integer}
     */
    dwADsType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Array of  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structures that contain values of the attribute in the current search column for the current row.
     * @type {Pointer<ADSVALUE>}
     */
    pADsValues {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Size of the <b>pADsValues</b> array.
     * @type {Integer}
     */
    dwNumValues {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for internal use by providers.
     * @type {HANDLE}
     */
    hReserved{
        get {
            if(!this.HasProp("__hReserved"))
                this.__hReserved := HANDLE(32, this)
            return this.__hReserved
        }
    }
}
