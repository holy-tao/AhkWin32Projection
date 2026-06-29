#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The ATSC_FILTER_OPTIONS structure specifies additional criteria for matching ATSC section headers.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-atsc_filter_options
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ATSC_FILTER_OPTIONS {
    #StructPack 4

    /**
     * If this flag is <b>TRUE</b>, the ETM_id field in the header must match the value of the <b>EtmId</b> structure member. Otherwise, the ETM_id field is ignored.
     */
    fSpecifyEtmId : BOOL

    /**
     * Specifies a value for the ETM_id field.
     */
    EtmId : UInt32

}
