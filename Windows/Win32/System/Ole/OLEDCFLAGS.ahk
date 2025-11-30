#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies additional information to the container about the device context that the object has requested.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ne-ocidl-oledcflags
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEDCFLAGS extends Win32Enum{

    /**
     * Indicates that the object will not use the returned <b>HDC</b> for drawing but merely to get information about the display device. In this case, the container can simply pass the window's device context without further processing.
     * @type {Integer (Int32)}
     */
    static OLEDC_NODRAW => 1

    /**
     * Requests that the container paint the background behind the object before returning the device context. Objects should use this flag when requesting a device context to paint a transparent area.
     * @type {Integer (Int32)}
     */
    static OLEDC_PAINTBKGND => 2

    /**
     * Indicates that the object prefers to draw into an offscreen device context that should then be copied to the screen. The container can honor this request or not. If this bit is cleared, the container must return an on-screen device context allowing the object to perform direct screen operations such as showing a selection through an XOR operation. An object can specify this value when the drawing operation generates a lot of screen flicker.
     * @type {Integer (Int32)}
     */
    static OLEDC_OFFSCREEN => 4
}
