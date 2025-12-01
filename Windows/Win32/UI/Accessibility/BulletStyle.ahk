#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the BulletStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-bulletstyle
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class BulletStyle extends Win32Enum{

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static BulletStyle_None => 0

    /**
     * Hollow round bullet.
     * @type {Integer (Int32)}
     */
    static BulletStyle_HollowRoundBullet => 1

    /**
     * Filled round bullet.
     * @type {Integer (Int32)}
     */
    static BulletStyle_FilledRoundBullet => 2

    /**
     * Hollow square bullet.
     * @type {Integer (Int32)}
     */
    static BulletStyle_HollowSquareBullet => 3

    /**
     * Filled square bullet.
     * @type {Integer (Int32)}
     */
    static BulletStyle_FilledSquareBullet => 4

    /**
     * Dash bullet.
     * @type {Integer (Int32)}
     */
    static BulletStyle_DashBullet => 5

    /**
     * Other.
     * @type {Integer (Int32)}
     */
    static BulletStyle_Other => -1
}
