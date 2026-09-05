#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the AnimationStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-animationstyle
 * @namespace Windows.Win32.UI.Accessibility
 */
class AnimationStyle extends Win32Enum {

    /**
     * None.
     * Native name: AnimationStyle_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The bounding rectangle displays a border of alternating icons of different colors.
     * Native name: AnimationStyle_LasVegasLights
     * @type {Integer (Int32)}
     */
    static LasVegasLights => 1

    /**
     * The font and background alternate between assigned colors and contrasting colors.
     * Native name: AnimationStyle_BlinkingBackground
     * @type {Integer (Int32)}
     */
    static BlinkingBackground => 2

    /**
     * The background displays flashing, multicolored icons.
     * Native name: AnimationStyle_SparkleText
     * @type {Integer (Int32)}
     */
    static SparkleText => 3

    /**
     * The bounding rectangle displays moving black dashes.
     * Native name: AnimationStyle_MarchingBlackAnts
     * @type {Integer (Int32)}
     */
    static MarchingBlackAnts => 4

    /**
     * The bounding rectangle displays moving red dashes.
     * Native name: AnimationStyle_MarchingRedAnts
     * @type {Integer (Int32)}
     */
    static MarchingRedAnts => 5

    /**
     * The font alternates between solid and blurred.
     * Native name: AnimationStyle_Shimmer
     * @type {Integer (Int32)}
     */
    static Shimmer => 6

    /**
     * Other.
     * Native name: AnimationStyle_Other
     * @type {Integer (Int32)}
     */
    static Other => -1
}
