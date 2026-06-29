#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the result from an HDCP Key Data query in Certified Output Protection Protocol (COPP). This query returns the device's HDCP key selection vector (KSV).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatushdcpkeydata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA_COPPStatusHDCPKeyData {
    #StructPack 4

    /**
     * A 128-bit random number that was passed by the application in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure.
     */
    rApp : Guid

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     */
    dwFlags : UInt32

    /**
     * Receives zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statushdcpflags">COPP_StatusHDCPFlags</a> enumeration. If the COPP_HDCPRepeater flag is present, the application should not play the content using this graphics adapter.
     */
    dwHDCPFlags : UInt32

    /**
     * Receives the HDCP key selection vector, B<sub>KSV</sub>, from the HDSCP device attached to the graphics adapter.
     */
    BKey : Guid

    /**
     * Reserved. Must be zero.
     */
    Reserved1 : Guid

    /**
     * Reserved. Must be zero.
     */
    Reserved2 : Guid

}
