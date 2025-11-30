#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of data provided by a frame source.
 * @remarks
 * 
 * The values of this enumeration are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devicestream-attribute-framesource-types">MF_DEVICESTREAM_ATTRIBUTE_FRAMESOURCE_TYPES</a> attribute.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfframesourcetypes
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFFrameSourceTypes extends Win32Enum{

    /**
     * The frame source provides color data.
     * @type {Integer (Int32)}
     */
    static MFFrameSourceTypes_Color => 1

    /**
     * The frame source provides infrared data.
     * @type {Integer (Int32)}
     */
    static MFFrameSourceTypes_Infrared => 2

    /**
     * The frame source provides depth data.
     * @type {Integer (Int32)}
     */
    static MFFrameSourceTypes_Depth => 4

    /**
     * The frame source provides image data.
     * 
     * <b>Note</b>  This value was added in Windows 10, version 1803.
     * @type {Integer (Int32)}
     */
    static MFFrameSourceTypes_Image => 8

    /**
     * The frame source provides custom data.
     * @type {Integer (Int32)}
     */
    static MFFrameSourceTypes_Custom => 128
}
