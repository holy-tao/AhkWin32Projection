#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the accuracy of a hand joint's position and orientation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.jointposeaccuracy
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class JointPoseAccuracy extends Win32Enum{

    /**
     * The hand joint is being tracked at its nominal accuracy.
     * @type {Integer (Int32)}
     */
    static High => 0

    /**
     * The hand joint is only being tracked approximately, perhaps due to occlusion.
     * @type {Integer (Int32)}
     */
    static Approximate => 1
}
