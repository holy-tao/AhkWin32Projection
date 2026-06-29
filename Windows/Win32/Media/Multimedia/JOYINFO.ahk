#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The JOYINFO structure contains information about the joystick position and button state.
 * @see https://learn.microsoft.com/windows/win32/api/joystickapi/ns-joystickapi-joyinfo
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct JOYINFO {
    #StructPack 4

    /**
     * Current X-coordinate.
     */
    wXpos : UInt32

    /**
     * Current Y-coordinate.
     */
    wYpos : UInt32

    /**
     * Current Z-coordinate.
     */
    wZpos : UInt32

    wButtons : UInt32

}
