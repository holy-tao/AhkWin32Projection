#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents whether the user is present within the headset to view and interact with a particular HolographicSpace.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspaceuserpresence
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicSpaceUserPresence extends Win32Enum{

    /**
     * This HolographicSpace is not visible in the headset or the user is not wearing the headset.
     * 
     * The app may wish to pause and stop rendering to release system resources for use by other apps.
     * @type {Integer (Int32)}
     */
    static Absent => 0

    /**
     * This HolographicSpace is visible in the headset and the user is wearing the headset, but a modal dialog is taking all input from the app.
     * 
     * The app should continue rendering, but may wish to pause its simulation.
     * @type {Integer (Int32)}
     */
    static PresentPassive => 1

    /**
     * This HolographicSpace is visible in the headset, the user is wearing the headset, and input is being routed to the app.
     * 
     * The app should render and run its simulation as normal.
     * @type {Integer (Int32)}
     */
    static PresentActive => 2
}
