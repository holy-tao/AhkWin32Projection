#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the potential states of a [MediaElement](../windows.ui.xaml.controls/mediaelement.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.mediaelementstate
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class MediaElementState extends Win32Enum{

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) contains no media. The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) displays a transparent frame.
     * @type {Integer (Int32)}
     */
    static Closed => 0

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) is validating and attempting to load the specified source.
     * @type {Integer (Int32)}
     */
    static Opening => 1

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) is loading the media for playback. Its [Position](../windows.ui.xaml.controls/mediaelement_position.md) does not advance during this state. If the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) was already playing video, it continues to display the last displayed frame.
     * @type {Integer (Int32)}
     */
    static Buffering => 2

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) is playing the current media source.
     * @type {Integer (Int32)}
     */
    static Playing => 3

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) does not advance its [Position](../windows.ui.xaml.controls/mediaelement_position.md). If the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) was playing video, it continues to display the current frame.
     * @type {Integer (Int32)}
     */
    static Paused => 4

    /**
     * The [MediaElement](../windows.ui.xaml.controls/mediaelement.md) contains media but is not playing or paused. Its [Position](../windows.ui.xaml.controls/mediaelement_position.md) is 0 and does not advance. If the loaded media is video, the [MediaElement](../windows.ui.xaml.controls/mediaelement.md) displays the first frame.
     * @type {Integer (Int32)}
     */
    static Stopped => 5
}
