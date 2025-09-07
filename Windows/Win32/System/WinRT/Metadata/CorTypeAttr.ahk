#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorTypeAttr{

    /**
     * @type {Integer (Int32)}
     */
    static tdVisibilityMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static tdNotPublic => 0

    /**
     * @type {Integer (Int32)}
     */
    static tdPublic => 1

    /**
     * @type {Integer (Int32)}
     */
    static tdNestedPublic => 2

    /**
     * @type {Integer (Int32)}
     */
    static tdNestedPrivate => 3

    /**
     * @type {Integer (Int32)}
     */
    static tdNestedFamily => 4

    /**
     * @type {Integer (Int32)}
     */
    static tdNestedAssembly => 5

    /**
     * @type {Integer (Int32)}
     */
    static tdNestedFamANDAssem => 6

    /**
     * @type {Integer (Int32)}
     */
    static tdNestedFamORAssem => 7

    /**
     * @type {Integer (Int32)}
     */
    static tdLayoutMask => 24

    /**
     * @type {Integer (Int32)}
     */
    static tdAutoLayout => 0

    /**
     * @type {Integer (Int32)}
     */
    static tdSequentialLayout => 8

    /**
     * @type {Integer (Int32)}
     */
    static tdExplicitLayout => 16

    /**
     * @type {Integer (Int32)}
     */
    static tdClassSemanticsMask => 32

    /**
     * @type {Integer (Int32)}
     */
    static tdClass => 0

    /**
     * @type {Integer (Int32)}
     */
    static tdInterface => 32

    /**
     * @type {Integer (Int32)}
     */
    static tdAbstract => 128

    /**
     * @type {Integer (Int32)}
     */
    static tdSealed => 256

    /**
     * @type {Integer (Int32)}
     */
    static tdSpecialName => 1024

    /**
     * @type {Integer (Int32)}
     */
    static tdImport => 4096

    /**
     * @type {Integer (Int32)}
     */
    static tdSerializable => 8192

    /**
     * @type {Integer (Int32)}
     */
    static tdWindowsRuntime => 16384

    /**
     * @type {Integer (Int32)}
     */
    static tdStringFormatMask => 196608

    /**
     * @type {Integer (Int32)}
     */
    static tdAnsiClass => 0

    /**
     * @type {Integer (Int32)}
     */
    static tdUnicodeClass => 65536

    /**
     * @type {Integer (Int32)}
     */
    static tdAutoClass => 131072

    /**
     * @type {Integer (Int32)}
     */
    static tdCustomFormatClass => 196608

    /**
     * @type {Integer (Int32)}
     */
    static tdCustomFormatMask => 12582912

    /**
     * @type {Integer (Int32)}
     */
    static tdBeforeFieldInit => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static tdForwarder => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static tdReservedMask => 264192

    /**
     * @type {Integer (Int32)}
     */
    static tdRTSpecialName => 2048

    /**
     * @type {Integer (Int32)}
     */
    static tdHasSecurity => 262144
}
