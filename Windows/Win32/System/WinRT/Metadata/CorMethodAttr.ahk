#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorMethodAttr{

    /**
     * @type {Integer (Int32)}
     */
    static mdMemberAccessMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static mdPrivateScope => 0

    /**
     * @type {Integer (Int32)}
     */
    static mdPrivate => 1

    /**
     * @type {Integer (Int32)}
     */
    static mdFamANDAssem => 2

    /**
     * @type {Integer (Int32)}
     */
    static mdAssem => 3

    /**
     * @type {Integer (Int32)}
     */
    static mdFamily => 4

    /**
     * @type {Integer (Int32)}
     */
    static mdFamORAssem => 5

    /**
     * @type {Integer (Int32)}
     */
    static mdPublic => 6

    /**
     * @type {Integer (Int32)}
     */
    static mdStatic => 16

    /**
     * @type {Integer (Int32)}
     */
    static mdFinal => 32

    /**
     * @type {Integer (Int32)}
     */
    static mdVirtual => 64

    /**
     * @type {Integer (Int32)}
     */
    static mdHideBySig => 128

    /**
     * @type {Integer (Int32)}
     */
    static mdVtableLayoutMask => 256

    /**
     * @type {Integer (Int32)}
     */
    static mdReuseSlot => 0

    /**
     * @type {Integer (Int32)}
     */
    static mdNewSlot => 256

    /**
     * @type {Integer (Int32)}
     */
    static mdCheckAccessOnOverride => 512

    /**
     * @type {Integer (Int32)}
     */
    static mdAbstract => 1024

    /**
     * @type {Integer (Int32)}
     */
    static mdSpecialName => 2048

    /**
     * @type {Integer (Int32)}
     */
    static mdPinvokeImpl => 8192

    /**
     * @type {Integer (Int32)}
     */
    static mdUnmanagedExport => 8

    /**
     * @type {Integer (Int32)}
     */
    static mdReservedMask => 53248

    /**
     * @type {Integer (Int32)}
     */
    static mdRTSpecialName => 4096

    /**
     * @type {Integer (Int32)}
     */
    static mdHasSecurity => 16384

    /**
     * @type {Integer (Int32)}
     */
    static mdRequireSecObject => 32768
}
