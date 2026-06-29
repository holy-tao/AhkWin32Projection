#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POINTER_DEVICE_CURSOR_TYPE.ahk" { POINTER_DEVICE_CURSOR_TYPE }

/**
 * Contains cursor ID mappings for pointer devices.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-pointer_device_cursor_info
 * @namespace Windows.Win32.UI.Input.Pointer
 */
export default struct POINTER_DEVICE_CURSOR_INFO {
    #StructPack 4

    /**
     * The assigned cursor ID.
     */
    cursorId : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-pointer_device_cursor_type">POINTER_DEVICE_CURSOR_TYPE</a> that the ID is mapped to.
     */
    cursor : POINTER_DEVICE_CURSOR_TYPE

}
