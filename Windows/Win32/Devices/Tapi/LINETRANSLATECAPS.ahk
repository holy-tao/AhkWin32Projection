#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINETRANSLATECAPS structure describes the address translation capabilities.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linetranslatecaps
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINETRANSLATECAPS extends Win32Struct
{
    static sizeof => 44

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of entries in the <b>LocationList</b>. It includes all locations defined, including zero (default).
     * @type {Integer}
     */
    dwNumLocations {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the list of locations known to the address translation, in bytes.
     * @type {Integer}
     */
    dwLocationListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of this structure to the list of locations known to the address translation. The list consists of a sequence of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structures. The <b>dwLocationListOffset</b> member points to the first byte of the first structure, and the <b>dwLocationListSize</b> member indicates the total number of bytes in the list.
     * @type {Integer}
     */
    dwLocationListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Permanent identifier for the <b>CurrentLocation</b> entry in the [Locations] section of the registry. See the <b>dwPermanentLocationID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @type {Integer}
     */
    dwCurrentLocationID {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Number of entries in the <b>CardList</b>.
     * @type {Integer}
     */
    dwNumCards {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Size of the list of calling cards known to the address translation, in bytes.
     * @type {Integer}
     */
    dwCardListSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Offset from the beginning of this structure to the list of calling cards known to the address translation. It includes only non-hidden card entries and always includes card 0 (direct dial). The list consists of a sequence of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecardentry">LINECARDENTRY</a> structures. The <b>dwCardListOffset</b> member points to the first byte of the first structure, and the <b>dwCardListSize</b> member indicates the total number of bytes in the list.
     * @type {Integer}
     */
    dwCardListOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Preferred calling card for the <b>CurrentLocation</b> entry in the [Locations] section of the registry. See the <b>dwPreferredCardID</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linelocationentry">LINELOCATIONENTRY</a> structure.
     * @type {Integer}
     */
    dwCurrentPreferredCardID {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
