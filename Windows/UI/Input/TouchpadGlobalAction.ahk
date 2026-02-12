#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class TouchpadGlobalAction extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ThreeFingerTap => 0

    /**
     * @type {Integer (Int32)}
     */
    static FourFingerTap => 1

    /**
     * @type {Integer (Int32)}
     */
    static FiveFingerTap => 2

    /**
     * @type {Integer (Int32)}
     */
    static ThreeFingerPressDown => 3

    /**
     * @type {Integer (Int32)}
     */
    static FourFingerPressDown => 4

    /**
     * @type {Integer (Int32)}
     */
    static FiveFingerPressDown => 5

    /**
     * @type {Integer (Int32)}
     */
    static ThreeFingerPressUp => 6

    /**
     * @type {Integer (Int32)}
     */
    static FourFingerPressUp => 7

    /**
     * @type {Integer (Int32)}
     */
    static FiveFingerPressUp => 8
}
