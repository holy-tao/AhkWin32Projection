#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorOpenFlags{

    /**
     * @type {Integer (Int32)}
     */
    static ofRead => 0

    /**
     * @type {Integer (Int32)}
     */
    static ofWrite => 1

    /**
     * @type {Integer (Int32)}
     */
    static ofReadWriteMask => 1

    /**
     * @type {Integer (Int32)}
     */
    static ofCopyMemory => 2

    /**
     * @type {Integer (Int32)}
     */
    static ofReadOnly => 16

    /**
     * @type {Integer (Int32)}
     */
    static ofTakeOwnership => 32

    /**
     * @type {Integer (Int32)}
     */
    static ofNoTypeLib => 128

    /**
     * @type {Integer (Int32)}
     */
    static ofNoTransform => 4096

    /**
     * @type {Integer (Int32)}
     */
    static ofCheckIntegrity => 2048

    /**
     * @type {Integer (Int32)}
     */
    static ofReserved1 => 256

    /**
     * @type {Integer (Int32)}
     */
    static ofReserved2 => 512

    /**
     * @type {Integer (Int32)}
     */
    static ofReserved3 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static ofReserved => -6336
}
