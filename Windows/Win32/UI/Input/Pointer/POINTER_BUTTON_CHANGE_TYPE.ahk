#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies a change in the state of a button associated with a pointer.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ne-winuser-pointer_button_change_type
 * @namespace Windows.Win32.UI.Input.Pointer
 * @version v4.0.30319
 */
class POINTER_BUTTON_CHANGE_TYPE extends Win32Enum{

    /**
     * No change in button state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_NONE => 0

    /**
     * The first button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_FIRSTBUTTON</a>) transitioned to a pressed state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_FIRSTBUTTON_DOWN => 1

    /**
     * The first button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_FIRSTBUTTON</a>) transitioned to a released state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_FIRSTBUTTON_UP => 2

    /**
     * The second button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_SECONDBUTTON</a>) transitioned to a pressed state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_SECONDBUTTON_DOWN => 3

    /**
     * The second button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_SECONDBUTTON</a>) transitioned to a released state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_SECONDBUTTON_UP => 4

    /**
     * The third button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_THIRDBUTTON</a>) transitioned to a pressed state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_THIRDBUTTON_DOWN => 5

    /**
     * The third button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_THIRDBUTTON</a>) transitioned to a released state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_THIRDBUTTON_UP => 6

    /**
     * The fourth button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_FOURTHBUTTON</a>) transitioned to a pressed state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_FOURTHBUTTON_DOWN => 7

    /**
     * The fourth button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_FOURTHBUTTON</a>) transitioned to a released state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_FOURTHBUTTON_UP => 8

    /**
     * The fifth button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_FIFTHBUTTON</a>) transitioned to a pressed state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_FIFTHBUTTON_DOWN => 9

    /**
     * The fifth button (see <a href="https://docs.microsoft.com/windows/win32/inputmsg/pointer-flags-contants">POINTER_FLAG_FIFTHBUTTON</a>) transitioned to a released state.
     * @type {Integer (Int32)}
     */
    static POINTER_CHANGE_FIFTHBUTTON_UP => 10
}
