#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the kind of reprojection an app is requesting to stabilize its holographic rendering relative to the user's head motion.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicreprojectionmode
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicReprojectionMode extends Win32Enum{

    /**
     * The image should be stabilized for changes to both the user's head position and orientation.  This is best for world-locked content that should remain physically stationary as the user walks around.
     * @type {Integer (Int32)}
     */
    static PositionAndOrientation => 0

    /**
     * The image should be stabilized only for changes to both the user's head orientation, ignoring positional changes.  This is best for body-locked content that should tag along with the user as they walk around, such as 360-degree video.
     * @type {Integer (Int32)}
     */
    static OrientationOnly => 1

    /**
     * The image should not be stabilized for the user's head motion, instead remaining fixed in the display.  This is generally discouraged, as it is only comfortable for users when used sparingly, such as when the only visible content is a small cursor.
     * @type {Integer (Int32)}
     */
    static Disabled => 2
}
