#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the component signing status.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccomponentsigning
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICComponentSigning extends Win32Enum{

    /**
     * A signed component.
     * @type {Integer (Int32)}
     */
    static WICComponentSigned => 1

    /**
     * An unsigned component
     * @type {Integer (Int32)}
     */
    static WICComponentUnsigned => 2

    /**
     * A component is safe.
     *             
     * 
     * Components that do not have a binary component to sign, such as a pixel format, should return this value.
     * @type {Integer (Int32)}
     */
    static WICComponentSafe => 4

    /**
     * A component has been disabled.
     * @type {Integer (Int32)}
     */
    static WICComponentDisabled => -2147483648
}
