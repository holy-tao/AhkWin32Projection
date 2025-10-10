#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the animation effects associated with user actions.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-animationinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class ANIMATIONINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(ANIMATIONINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If this member is nonzero, minimize and restore animation is enabled; otherwise it is disabled.
     * @type {Integer}
     */
    iMinAnimate {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
