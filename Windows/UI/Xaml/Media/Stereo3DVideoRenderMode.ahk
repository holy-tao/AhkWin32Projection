#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the stereo 3-D video render mode for the current media source.
 * @remarks
 * Setting the attribute to **stereo** enables stereo display mode. A value of **mono** disables it. The default is **mono**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.stereo3dvideorendermode
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Stereo3DVideoRenderMode extends Win32Enum{

    /**
     * Regular 2-D video.
     * @type {Integer (Int32)}
     */
    static Mono => 0

    /**
     * Stereo 3-D video.
     * @type {Integer (Int32)}
     */
    static Stereo => 1
}
