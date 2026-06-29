#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVAHD_RATIONAL.ahk" { DXVAHD_RATIONAL }
#Import ".\DXVAHD_FRAME_FORMAT.ahk" { DXVAHD_FRAME_FORMAT }

/**
 * Describes a video stream for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) video processor.
 * @remarks
 * Frame rates are expressed as ratios. For example, 30 frames per second (fps) is expressed as 30:1, and 29.97 fps is expressed as 30000/1001. For interlaced content, a frame consists of two fields, so that the frame rate is half the field rate.
 *       
 * 
 *  If the application will composite two or more input streams, use the largest stream for the values of <b>InputWidth</b> and <b>InputHeight</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_content_desc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_CONTENT_DESC {
    #StructPack 4

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ne-dxvahd-dxvahd_frame_format">DXVAHD_FRAME_FORMAT</a> enumeration that describes how the video stream is interlaced.
     */
    InputFrameFormat : DXVAHD_FRAME_FORMAT

    /**
     * The frame rate of the input video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure.
     */
    InputFrameRate : DXVAHD_RATIONAL

    /**
     * The width of the input frames, in pixels.
     */
    InputWidth : UInt32

    /**
     * The height of the input frames, in pixels.
     */
    InputHeight : UInt32

    /**
     * The frame rate of the output video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxvahd/ns-dxvahd-dxvahd_rational">DXVAHD_RATIONAL</a> structure.
     */
    OutputFrameRate : DXVAHD_RATIONAL

    /**
     * The width of the output frames, in pixels.
     */
    OutputWidth : UInt32

    /**
     * The height of the output frames, in pixels.
     */
    OutputHeight : UInt32

}
