#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_ExtendedFormat.ahk" { DXVA2_ExtendedFormat }
#Import ".\DXVA2_Frequency.ahk" { DXVA2_Frequency }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Describes a video stream for a DXVA decoder device or video processor device.
 * @remarks
 * The <b>InputSampleFreq</b> member gives the frame rate of the decoded video stream, as received by the video renderer. The <b>OutputFrameFreq</b> member gives the frame rate of the video that is displayed after deinterlacing. If the input video is interlaced and the samples contain interleaved fields, the output frame rate is twice the input frame rate. If the input video is progressive or contains single fields, the output frame rate is the same as the input frame rate.
 * 
 * Decoders should set the values of <b>InputSampleFreq</b> and <b>OutputFrameFreq</b> if the frame rate is known. Otherwise, set these members to 0/0 to indicate an unknown frame rate.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_videodesc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_VideoDesc {
    #StructPack 4

    /**
     * Width of the video frame, in pixels.
     */
    SampleWidth : UInt32

    /**
     * Height of the video frame, in pixels.
     */
    SampleHeight : UInt32

    /**
     * Additional details about the video format, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure.
     */
    SampleFormat : DXVA2_ExtendedFormat

    /**
     * Surface format, specified as a <b>D3DFORMAT</b> value or FOURCC code. A FOURCC code can be constructed using the <b>D3DFORMAT</b> or <b>MAKEFOURCC</b> macros.
     */
    Format : D3DFORMAT

    /**
     * Frame rate of the input video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_frequency">DXVA2_Frequency</a> structure.
     */
    InputSampleFreq : DXVA2_Frequency

    /**
     * Frame rate of the output video, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_frequency">DXVA2_Frequency</a> structure.
     */
    OutputFrameFreq : DXVA2_Frequency

    /**
     * Level of data protection required when the user accessible bus (UAB) is present. If <b>TRUE</b>, the video must be protected when a UAB is present. If <b>FALSE</b>, the video is not required to be protected.
     */
    UABProtectionLevel : UInt32

    /**
     * Reserved. Must be zero.
     */
    Reserved : UInt32

}
