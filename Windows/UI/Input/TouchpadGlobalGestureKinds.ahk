#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class TouchpadGlobalGestureKinds extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ThreeFingerManipulations => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FourFingerManipulations => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FiveFingerManipulations => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ThreeFingerActions => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FourFingerActions => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FiveFingerActions => 32
}
