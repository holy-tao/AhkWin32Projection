#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the result from a Certified Output Protection Protocol (COPP) status request.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA_COPPStatusData {
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
     * Response to the status query. The meaning of this value depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/DirectShow/copp-query-reference">COPP Query Reference</a>.
     */
    dwData : UInt32

    /**
     * Reserved. Must be zero.
     */
    ExtendedInfoValidMask : UInt32

    /**
     * Reserved. Must be zero.
     */
    ExtendedInfoData : UInt32

}
