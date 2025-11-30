#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which variable-length coding (VLC) table to use for entropy coding. This enumeration is used with the AVEncMPVIntraVLCTable property.
 * @see https://docs.microsoft.com/windows/win32/api//codecapi/ne-codecapi-eavencmpvintravlctable
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncMPVIntraVLCTable extends Win32Enum{

    /**
     * The encoder selects the VLC table.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVIntraVLCTable_Auto => 0

    /**
     * The encoder uses the MPEG-1 VLC table.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVIntraVLCTable_MPEG1 => 1

    /**
     * The encoder uses the alternate "intra" VLC table for MPEG-2.
     * @type {Integer (Int32)}
     */
    static eAVEncMPVIntraVLCTable_Alternate => 2
}
