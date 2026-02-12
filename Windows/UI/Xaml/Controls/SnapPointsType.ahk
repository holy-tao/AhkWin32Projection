#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how panning snap points are processed for gesture/manipulation input. 
  * <!--This is a little guesswork.-->
 * @remarks
 * For panning actions, there are often natural stopping places. Snap points provide a way to indicate where these places are. Then, when a user swipes, the manipulation result favors that natural point using behavior as expressed by a SnapPointsType value. The proximity determination is made by the Direct Manipulation subsystem that supports the manipulation handling for a XAML [ScrollViewer](scrollviewer.md). The **Single** variations factor in both the inertia and the release point.
 * 
 * **Proximity points (****Optional**** and ****OptionalSingle****):
 * ** When a user is going to naturally stop the manipulation in the proximity of a snap point, proximity points help the user land at the natural stopping place. Because the user has to land in proximity to the snap point to cause it to stop there, the user will sometimes have to perform another swipe to reach a snap point.
 * 
 * **Mandatory snap points (****Mandatory**** and ****MandatorySingle**)**:
 * ** In contrast to proximity, mandatory snap points ensure that the content is adjusted to always land on a snap point. Even if the user releases the manipulation halfway between two snap-points, it will always move to one of the snap points.
 * 
 * The SnapPointsType enumeration is used as a value for the [ScrollViewer.HorizontalSnapPointsType](scrollviewer_horizontalsnappointstype.md) and [ScrollViewer.VerticalSnapPointsType](scrollviewer_verticalsnappointstype.md) properties.
 * 
 * To see the effects of snap points on [ScrollViewer](scrollviewer.md) behavior yourself, get the [XAML scrolling, panning and zooming sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/XAML%20scrolling%2C%20panning%2C%20and%20zooming%20sample). Run the sample on a touch device (not the simulator). Try out the SnapPointsType values when you view the "Panning with snap-points" example page of the sample.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.snappointstype
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SnapPointsType extends Win32Enum{

    /**
     * No snapping behavior. Only the manipulation influences the final location.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Content stops at a snap point closest to where inertia would naturally stop along the direction of inertia, depending on how close the snap point is.
     * @type {Integer (Int32)}
     */
    static Optional => 1

    /**
     * Content always stops at the snap point closest to where inertia would naturally stop along the direction of inertia.
     * @type {Integer (Int32)}
     */
    static Mandatory => 2

    /**
     * Content stops at the next snap point, if the motion starts far from it.
     * @type {Integer (Int32)}
     */
    static OptionalSingle => 3

    /**
     * Content always stops at the snap point closest to the release point along the direction of inertia.
     * @type {Integer (Int32)}
     */
    static MandatorySingle => 4
}
