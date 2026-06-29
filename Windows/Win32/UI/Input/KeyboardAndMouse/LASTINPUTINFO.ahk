#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the time of the last input.
 * @remarks
 * This function is useful for input idle detection. For more information on tick counts, see <a href="https://docs.microsoft.com/windows/desktop/api/sysinfoapi/nf-sysinfoapi-gettickcount">GetTickCount</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-lastinputinfo
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
export default struct LASTINPUTINFO {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The size of the structure, in bytes. This member must be set to <c>sizeof(LASTINPUTINFO)</c>.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * The tick count when the last input event was received.
     */
    dwTime : UInt32

}
