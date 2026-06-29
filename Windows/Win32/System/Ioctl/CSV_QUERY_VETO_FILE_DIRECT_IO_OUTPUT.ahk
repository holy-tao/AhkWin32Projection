#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains troubleshooting information about why a volume is in redirected mode.
 * @remarks
 * CSV writes the troubleshooting strings to a diagnostic log that, when filtered, can provide hints as to why 
 *     a volume is in a redirected mode.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-csv_query_veto_file_direct_io_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_QUERY_VETO_FILE_DIRECT_IO_OUTPUT {
    #StructPack 8

    /**
     * The integer portion of VetoedFromAltitude.
     */
    VetoedFromAltitudeIntegral : Int64

    /**
     * The decimal portion of VetoedFromAltitude.
     */
    VetoedFromAltitudeDecimal : Int64

    /**
     * The reason why volume is in a redirected mode.
     */
    Reason : WCHAR[256]

}
