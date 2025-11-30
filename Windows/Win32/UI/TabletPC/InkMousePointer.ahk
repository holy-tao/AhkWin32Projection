#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of mouse pointer to appear.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkmousepointer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkMousePointer extends Win32Enum{

    /**
     * The default mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_Default => 0

    /**
     * The arrow mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_Arrow => 1

    /**
     * The cross (cross-hair) mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_Crosshair => 2

    /**
     * The I-beam mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_Ibeam => 3

    /**
     * The sizing handle NE/SW mouse pointer (double arrow that points northeast and southwest).
     * @type {Integer (Int32)}
     */
    static IMP_SizeNESW => 4

    /**
     * The sizing handle N/S mouse pointer (double arrow that points north and south).
     * @type {Integer (Int32)}
     */
    static IMP_SizeNS => 5

    /**
     * The sizing handle NW/SE mouse pointer (double arrow that points northwest and southeast).
     * @type {Integer (Int32)}
     */
    static IMP_SizeNWSE => 6

    /**
     * The sizing handle W/E mouse pointer (double arrow that points west and east).
     * @type {Integer (Int32)}
     */
    static IMP_SizeWE => 7

    /**
     * The up arrow mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_UpArrow => 8

    /**
     * The hourglass (wait) mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_Hourglass => 9

    /**
     * The no-drop mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_NoDrop => 10

    /**
     * The arrow and hourglass mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_ArrowHourglass => 11

    /**
     * The arrow and question mark mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_ArrowQuestion => 12

    /**
     * The size-all mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_SizeAll => 13

    /**
     * The hand mouse pointer.
     * @type {Integer (Int32)}
     */
    static IMP_Hand => 14

    /**
     * The custom mouse pointer that the <a href="https://docs.microsoft.com/windows/desktop/api/msinkaut/nf-msinkaut-iinkcollector-get_mouseicon">MouseIcon</a> property specifies.
     * @type {Integer (Int32)}
     */
    static IMP_Custom => 99
}
