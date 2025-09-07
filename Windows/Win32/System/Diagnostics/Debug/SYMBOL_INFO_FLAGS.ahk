#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class SYMBOL_INFO_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_CLR_TOKEN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_CONSTANT => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_EXPORT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_FORWARDER => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_FRAMEREL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_FUNCTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_ILREL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_LOCAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_METADATA => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_PARAMETER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_REGISTER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_REGREL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_SLOT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_THUNK => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_TLSREL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_VALUEPRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYMFLAG_VIRTUAL => 4096
}
