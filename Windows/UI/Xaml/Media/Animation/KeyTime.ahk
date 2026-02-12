#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies when a particular key frame should take place during an animation.
 * @remarks
 * Each key frame's **KeyTime** property specifies when that key frame ends. It does not specify how long the key frame plays. The amount of time a key frame plays is determined by when the key frame ends, when the previous key frame ended, and the animation's duration.
 * 
 * Specifying a KeyTime by only an integer without any time span literal characters such as **:** or **.** will result in a KeyTime of that number of days! This is seldom the intended result. Usually you specify time spans in seconds. Thus the KeyTime string typically includes preceding zero values for hours and minutes, along with the literal **:** as separator between hours, minutes, and seconds. For example, to specify a KeyTime of five seconds, the correct string is "0:0:5" ("0:0:05" is equivalent).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.keytime
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class KeyTime extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The time component of this KeyTime.
     * @type {Pointer<TimeSpan>}
     */
    TimeSpan {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
