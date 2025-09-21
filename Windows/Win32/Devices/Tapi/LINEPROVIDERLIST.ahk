#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEPROVIDERLIST structure describes a list of service providers. A structure of this type is returned by the lineGetProviderList function. The LINEPROVIDERLIST structure can contain an array of LINEPROVIDERENTRY structures.
 * @remarks
 * This structure may not be extended.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproviderlist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEPROVIDERLIST extends Win32Struct
{
    static sizeof => 24

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
     * Number of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderentry">LINEPROVIDERENTRY</a> structures present in the array denominated by <b>dwProviderListSize</b> and <b>dwProviderListOffset</b>.
     * @type {Integer}
     */
    dwNumProviders {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the provider list array, in bytes.
     * @type {Integer}
     */
    dwProviderListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of this structure to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderentry">LINEPROVIDERENTRY</a> elements, which provide the information on each service provider. The size of the array is specified by <b>dwProviderListSize</b>.
     * @type {Integer}
     */
    dwProviderListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
