#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_sichintf
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _SICHINTF{

    /**
     * @type {Integer (Int32)}
     */
    static SICHINT_DISPLAY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SICHINT_ALLFIELDS => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static SICHINT_CANONICAL => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static SICHINT_TEST_FILESYSPATH_IF_NOT_EQUAL => 536870912
}
