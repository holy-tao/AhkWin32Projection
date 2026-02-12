#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the frame-packing mode for stereo 3-D video content.
 * @remarks
 * The default is to allow the system to determine the packing mode from the metadata of the video content.
 * 
 * In order to reset this value once it has been set, use the [ClearValue](../windows.ui.xaml/dependencyobject_clearvalue_1095854009.md) API.
 * 
 * This API is used in conjunction with [Stereo3DVideoRenderMode](stereo3dvideorendermode.md) to display 3-D content.
 * 
 * Returns or sets **topbottom** or **sidebyside** for stereo 3-D content packing, or **none** for regular 2-D video.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.stereo3dvideopackingmode
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Stereo3DVideoPackingMode extends Win32Enum{

    /**
     * Regular 2-D video.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Stereo 3-D content packing with components side-by-side.
     * @type {Integer (Int32)}
     */
    static SideBySide => 1

    /**
     * Stereo 3-D content packing with components top and bottom.
     * @type {Integer (Int32)}
     */
    static TopBottom => 2
}
