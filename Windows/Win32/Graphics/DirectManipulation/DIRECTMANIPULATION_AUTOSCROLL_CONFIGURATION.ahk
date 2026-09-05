#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines the type and direction of automatic scrolling animation to apply.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/ne-directmanipulation-directmanipulation_autoscroll_configuration
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
class DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION extends Win32Enum {

    /**
     * If content is scrolling, slowly stop along the direction of the motion.
     * Native name: DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 0

    /**
     * Scroll towards the positive boundary of the content.
     * Native name: DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_FORWARD
     * @type {Integer (Int32)}
     */
    static FORWARD => 1

    /**
     * Scroll towards the origin of the content.
     * Native name: DIRECTMANIPULATION_AUTOSCROLL_CONFIGURATION_REVERSE
     * @type {Integer (Int32)}
     */
    static REVERSE => 2
}
