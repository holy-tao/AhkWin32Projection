#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorPEKind{

    /**
     * @type {Integer (Int32)}
     */
    static peNot => 0

    /**
     * @type {Integer (Int32)}
     */
    static peILonly => 1

    /**
     * @type {Integer (Int32)}
     */
    static pe32BitRequired => 2

    /**
     * @type {Integer (Int32)}
     */
    static pe32Plus => 4

    /**
     * @type {Integer (Int32)}
     */
    static pe32Unmanaged => 8

    /**
     * @type {Integer (Int32)}
     */
    static pe32BitPreferred => 16
}
