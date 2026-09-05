#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values for the BulletStyle text attribute.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-bulletstyle
 * @namespace Windows.Win32.UI.Accessibility
 */
class BulletStyle extends Win32Enum {

    /**
     * None.
     * Native name: BulletStyle_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Hollow round bullet.
     * Native name: BulletStyle_HollowRoundBullet
     * @type {Integer (Int32)}
     */
    static HollowRoundBullet => 1

    /**
     * Filled round bullet.
     * Native name: BulletStyle_FilledRoundBullet
     * @type {Integer (Int32)}
     */
    static FilledRoundBullet => 2

    /**
     * Hollow square bullet.
     * Native name: BulletStyle_HollowSquareBullet
     * @type {Integer (Int32)}
     */
    static HollowSquareBullet => 3

    /**
     * Filled square bullet.
     * Native name: BulletStyle_FilledSquareBullet
     * @type {Integer (Int32)}
     */
    static FilledSquareBullet => 4

    /**
     * Dash bullet.
     * Native name: BulletStyle_DashBullet
     * @type {Integer (Int32)}
     */
    static DashBullet => 5

    /**
     * Other.
     * Native name: BulletStyle_Other
     * @type {Integer (Int32)}
     */
    static Other => -1
}
