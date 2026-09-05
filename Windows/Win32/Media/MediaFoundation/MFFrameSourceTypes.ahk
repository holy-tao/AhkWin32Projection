#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of data provided by a frame source.
 * @remarks
 * The values of this enumeration are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-devicestream-attribute-framesource-types">MF_DEVICESTREAM_ATTRIBUTE_FRAMESOURCE_TYPES</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfframesourcetypes
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFFrameSourceTypes extends Win32Enum {

    /**
     * The frame source provides color data.
     * Native name: MFFrameSourceTypes_Color
     * @type {Integer (Int32)}
     */
    static Color => 1

    /**
     * The frame source provides infrared data.
     * Native name: MFFrameSourceTypes_Infrared
     * @type {Integer (Int32)}
     */
    static Infrared => 2

    /**
     * The frame source provides depth data.
     * Native name: MFFrameSourceTypes_Depth
     * @type {Integer (Int32)}
     */
    static Depth => 4

    /**
     * The frame source provides image data.
     * 
     * <b>Note</b>  This value was added in Windows 10, version 1803.
     * Native name: MFFrameSourceTypes_Image
     * @type {Integer (Int32)}
     */
    static Image => 8

    /**
     * The frame source provides custom data.
     * Native name: MFFrameSourceTypes_Custom
     * @type {Integer (Int32)}
     */
    static Custom => 128
}
