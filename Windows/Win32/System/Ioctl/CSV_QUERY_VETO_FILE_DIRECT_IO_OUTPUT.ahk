#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains troubleshooting information about why a volume is in redirected mode.
 * @remarks
 * 
 * CSV writes the troubleshooting strings to a diagnostic log that, when filtered, can provide hints as to why 
 *     a volume is in a redirected mode.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-csv_query_veto_file_direct_io_output
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_QUERY_VETO_FILE_DIRECT_IO_OUTPUT extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * The integer portion of VetoedFromAltitude.
     * @type {Integer}
     */
    VetoedFromAltitudeIntegral {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The decimal portion of VetoedFromAltitude.
     * @type {Integer}
     */
    VetoedFromAltitudeDecimal {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The reason why volume is in a redirected mode.
     * @type {String}
     */
    Reason {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }
}
