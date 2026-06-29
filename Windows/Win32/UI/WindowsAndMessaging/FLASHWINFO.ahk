#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\FLASHWINFO_FLAGS.ahk" { FLASHWINFO_FLAGS }

/**
 * Contains the flash status for a window and the number of times the system should flash the window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-flashwinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct FLASHWINFO {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * A handle to the window to be flashed. The window can be either opened or minimized.
     */
    hwnd : HWND

    dwFlags : FLASHWINFO_FLAGS

    /**
     * The number of times to flash the window.
     */
    uCount : UInt32

    /**
     * The rate at which the window is to be flashed, in milliseconds. If <b>dwTimeout</b> is zero, the function uses the default cursor blink rate.
     */
    dwTimeout : UInt32

}
