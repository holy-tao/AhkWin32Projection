#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the animation effects associated with user actions.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-animationinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct ANIMATIONINFO {
    #StructPack 4

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(ANIMATIONINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * If this member is nonzero, minimize and restore animation is enabled; otherwise it is disabled.
     */
    iMinAnimate : Int32

}
