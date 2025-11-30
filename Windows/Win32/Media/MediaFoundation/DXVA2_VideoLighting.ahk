#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the intended lighting conditions for viewing video content.
 * @remarks
 * 
 * This enumeration is equivalent to the <b>DXVA_VideoLighting</b> enumeration used in DXVA 1.0.
 * 
 * If you are using the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface to describe the video format, the video lighting is specified in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-lighting-attribute">MF_MT_VIDEO_LIGHTING</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ne-dxva2api-dxva2_videolighting
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoLighting extends Win32Enum{

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoLightingMask => 15

    /**
     * Unknown. Treat as DXVA2_VideoLighting_dim.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoLighting_Unknown => 0

    /**
     * Outdoor lighting.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoLighting_bright => 1

    /**
     * Medium brightness; for example, an office.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoLighting_office => 2

    /**
     * Dim; for example, a living room with a television and some additional low lighting.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoLighting_dim => 3

    /**
     * Dark; for example, a movie theater.
     * @type {Integer (Int32)}
     */
    static DXVA2_VideoLighting_dark => 4
}
