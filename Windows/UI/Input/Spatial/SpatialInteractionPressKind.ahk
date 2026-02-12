#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of press represented by a [SourcePressed](spatialinteractionmanager_sourcepressed.md) or [SourceReleased](spatialinteractionmanager_sourcereleased.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionpresskind
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionPressKind extends Win32Enum{

    /**
     * This is a SourceDetected, SourceLost or SourceUpdated event, which does not represent a press or a release.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Select represents the primary press for a spatial interaction source:
     * 
     * * For hands, a Select press represents the user's index finger in the down position.
     * * For motion controllers, a Select press represents the controller's index-finger trigger (or primary face button, if no trigger) being fully pressed.
     * * For voice, a Select press represents the user saying the system keyword "Select".
     * @type {Integer (Int32)}
     */
    static Select => 1

    /**
     * For motion controllers, a Menu press represents the controller's Menu button being pressed.
     * @type {Integer (Int32)}
     */
    static Menu => 2

    /**
     * For motion controllers, a grasp represents the user squeezing their fist tightly.  This may be detected by grip buttons or a palm trigger.
     * @type {Integer (Int32)}
     */
    static Grasp => 3

    /**
     * For motion controllers, a touchpad press represents the user clicking down on the touchpad.
     * @type {Integer (Int32)}
     */
    static Touchpad => 4

    /**
     * For motion controllers, a thumbstick press represents the user clicking down on the thumbstick.
     * @type {Integer (Int32)}
     */
    static Thumbstick => 5
}
