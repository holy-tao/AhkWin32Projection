#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorFieldAttr{

    /**
     * @type {Integer (Int32)}
     */
    static fdFieldAccessMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static fdPrivateScope => 0

    /**
     * @type {Integer (Int32)}
     */
    static fdPrivate => 1

    /**
     * @type {Integer (Int32)}
     */
    static fdFamANDAssem => 2

    /**
     * @type {Integer (Int32)}
     */
    static fdAssembly => 3

    /**
     * @type {Integer (Int32)}
     */
    static fdFamily => 4

    /**
     * @type {Integer (Int32)}
     */
    static fdFamORAssem => 5

    /**
     * @type {Integer (Int32)}
     */
    static fdPublic => 6

    /**
     * @type {Integer (Int32)}
     */
    static fdStatic => 16

    /**
     * @type {Integer (Int32)}
     */
    static fdInitOnly => 32

    /**
     * @type {Integer (Int32)}
     */
    static fdLiteral => 64

    /**
     * @type {Integer (Int32)}
     */
    static fdNotSerialized => 128

    /**
     * @type {Integer (Int32)}
     */
    static fdSpecialName => 512

    /**
     * @type {Integer (Int32)}
     */
    static fdPinvokeImpl => 8192

    /**
     * @type {Integer (Int32)}
     */
    static fdReservedMask => 38144

    /**
     * @type {Integer (Int32)}
     */
    static fdRTSpecialName => 1024

    /**
     * @type {Integer (Int32)}
     */
    static fdHasFieldMarshal => 4096

    /**
     * @type {Integer (Int32)}
     */
    static fdHasDefault => 32768

    /**
     * @type {Integer (Int32)}
     */
    static fdHasFieldRVA => 256
}
