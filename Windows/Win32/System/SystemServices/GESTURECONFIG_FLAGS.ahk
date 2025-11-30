#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class GESTURECONFIG_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ALLGESTURES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ZOOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_SINGLE_FINGER_VERTICALLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_SINGLE_FINGER_HORIZONTALLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_GUTTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PAN_WITH_INERTIA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ROTATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_TWOFINGERTAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_PRESSANDTAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_ROLLOVER => 1
}
