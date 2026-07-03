#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DXVAHD_RATIONAL.ahk" { DXVAHD_RATIONAL }

/**
 * Specifies the pixel aspect ratio (PAR) for the source and destination rectangles.
 * @remarks
 * Pixel aspect ratios of the form 0/<i>n</i> and <i>n</i>/0 are not valid.
 * 
 * If the <b>Enable</b> member is <b>FALSE</b>, the device ignores the values of <b>SourceAspectRatio</b> and <b>DestinationAspectRatio</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_aspect_ratio_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_STREAM_STATE_ASPECT_RATIO_DATA {
    #StructPack 4

    /**
     * <b>If TRUE</b>, the <b>SourceAspectRatio</b> and <b>DestinationAspectRatio</b> members contain valid values<b></b>. Otherwise, the pixel aspect ratios are unspecified.
     */
    Enable : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure that contains the source PAR. The default state value is 1:1 (square pixels).
     */
    SourceAspectRatio : DXVAHD_RATIONAL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure that contains the destination PAR. The default state value is 1:1 (square pixels).
     */
    DestinationAspectRatio : DXVAHD_RATIONAL

}
