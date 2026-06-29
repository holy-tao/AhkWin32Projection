#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * The WIA_DITHER_PATTERN_DATA structure specifies a dither pattern for scanners. It is used in conjunction with the scanner device property constant WIA_DPS_DITHER_PATTERN_DATA.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_dither_pattern_data
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIA_DITHER_PATTERN_DATA {
    #StructPack 8

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the size of this structure in bytes. Should be set to <b>sizeof(WIA_DITHER_PATTERN_DATA)</b>.
     */
    lSize : Int32

    /**
     * Type: <b>BSTR</b>
     * 
     * Specifies a string that contains the name of this dither pattern.
     */
    bstrPatternName : BSTR

    /**
     * Type: <b>LONG</b>
     * 
     * Indicates the width of the dither pattern in bytes.
     */
    lPatternWidth : Int32

    /**
     * Type: <b>LONG</b>
     * 
     * Indicates the length of the dither pattern in bytes.
     */
    lPatternLength : Int32

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the total number of bytes in the array pointed to by the <b>pbPattern</b> member.
     */
    cbPattern : Int32

    /**
     * Type: <b>BYTE*</b>
     * 
     * Specifies a pointer to a buffer that contains the dither pattern.
     */
    pbPattern : IntPtr

}
