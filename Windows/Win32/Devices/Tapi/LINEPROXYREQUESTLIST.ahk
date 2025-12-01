#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEPROXYREQUESTLIST structure describes a list of proxy requests. The lineGetProxyStatus function returns the LINEPROXYREQUESTLIST structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-lineproxyrequestlist
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEPROXYREQUESTLIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Total size allocated to this structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed to hold all the information requested, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of <b>DWORD</b> elements that appear in the list array.
     * @type {Integer}
     */
    dwNumEntries {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Size of the proxy request type list, in bytes.
     * @type {Integer}
     */
    dwListSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Offset from the beginning of the structure to an array of <b>DWORD</b> elements indicating the currently supported proxy request types. Each element is one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineproxyrequest--constants">LINEPROXYREQUEST_ constants</a>. The <b>dwListOffset</b> member is <b>dwNumEntries</b> times SIZEOF(DWORD). The size of the field is specified by <b>dwListSize</b>.
     * @type {Integer}
     */
    dwListOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
