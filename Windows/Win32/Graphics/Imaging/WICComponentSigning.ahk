#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the component signing status.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccomponentsigning
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICComponentSigning extends Win32Enum {

    /**
     * A signed component.
     * Native name: WICComponentSigned
     * @type {Integer (Int32)}
     */
    static Signed => 1

    /**
     * An unsigned component
     * Native name: WICComponentUnsigned
     * @type {Integer (Int32)}
     */
    static Unsigned => 2

    /**
     * A component is safe.
     *             
     * 
     * Components that do not have a binary component to sign, such as a pixel format, should return this value.
     * Native name: WICComponentSafe
     * @type {Integer (Int32)}
     */
    static Safe => 4

    /**
     * A component has been disabled.
     * Native name: WICComponentDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => -2147483648
}
