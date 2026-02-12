#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify which axes to animate during the Vector3Transition animation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.vector3transitioncomponents
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Vector3TransitionComponents extends Win32BitflagEnum{

    /**
     * Animate the X axis.
     * @type {Integer (UInt32)}
     */
    static X => 1

    /**
     * Animate the Y axis.
     * @type {Integer (UInt32)}
     */
    static Y => 2

    /**
     * Animate the Z axis.
     * @type {Integer (UInt32)}
     */
    static Z => 4
}
