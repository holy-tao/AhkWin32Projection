#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEPROVIDERENTRY structure provides the information for a single service provider entry. An array of these structures is returned as part of the LINEPROVIDERLIST structure returned by the function lineGetProviderList.
 * @remarks
 * 
 * Not extensible.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-lineproviderentry
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEPROVIDERENTRY extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Permanent provider identifier of the entry.
     * @type {Integer}
     */
    dwPermanentProviderID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the provider file name string, including the <b>null</b> terminator, in bytes.
     * @type {Integer}
     */
    dwProviderFilenameSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Offset from the beginning of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-lineproviderlist">LINEPROVIDERLIST</a> structure to a <b>null</b>-terminated string containing the file name (path) of the service provider DLL (.TSP) file. The size of the string is specified by <b>dwProviderFilenameSize</b>.
     * @type {Integer}
     */
    dwProviderFilenameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
