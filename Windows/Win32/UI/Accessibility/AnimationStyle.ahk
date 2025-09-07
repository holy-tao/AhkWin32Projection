#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values for the AnimationStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-animationstyle
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class AnimationStyle{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_None => 0

    /**
     * The bounding rectangle displays a border of alternating icons of different colors.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_LasVegasLights => 1

    /**
     * The font and background alternate between assigned colors and contrasting colors.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_BlinkingBackground => 2

    /**
     * The background displays flashing, multicolored icons.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_SparkleText => 3

    /**
     * The bounding rectangle displays moving black dashes.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_MarchingBlackAnts => 4

    /**
     * The bounding rectangle displays moving red dashes.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_MarchingRedAnts => 5

    /**
     * The font alternates between solid and blurred.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_Shimmer => 6

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static AnimationStyle_Other => -1
}
