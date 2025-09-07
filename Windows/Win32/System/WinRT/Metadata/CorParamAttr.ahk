#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorParamAttr{

    /**
     * @type {Integer (Int32)}
     */
    static pdIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static pdOut => 2

    /**
     * @type {Integer (Int32)}
     */
    static pdOptional => 16

    /**
     * @type {Integer (Int32)}
     */
    static pdReservedMask => 61440

    /**
     * @type {Integer (Int32)}
     */
    static pdHasDefault => 4096

    /**
     * @type {Integer (Int32)}
     */
    static pdHasFieldMarshal => 8192

    /**
     * @type {Integer (Int32)}
     */
    static pdUnused => 53216
}
