#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the time of the last input.
 * @remarks
 * This function is useful for input idle detection. For more information on tick counts, see <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-gettickcount">GetTickCount</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-lastinputinfo
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class LASTINPUTINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the structure, in bytes. This member must be set to <c>sizeof(LASTINPUTINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The tick count when the last input event was received.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
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
