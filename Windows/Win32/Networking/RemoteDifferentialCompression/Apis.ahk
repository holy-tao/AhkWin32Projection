#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RemoteDifferentialCompression {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static RDCE_TABLE_FULL => 2147745793

    /**
     * @type {Integer (UInt32)}
     */
    static RDCE_TABLE_CORRUPT => 2147745794

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_SIGNATURE_HASHSIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SimilarityFileIdMinSize => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SimilarityFileIdMaxSize => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_COMPATIBLE_APP_VERSION => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_DEPTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MAXIMUM_DEPTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_COMPAREBUFFER => 100000

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MAXIMUM_COMPAREBUFFER => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_DEFAULT_COMPAREBUFFER => 3200000

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_INPUTBUFFERSIZE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_HORIZONSIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MAXIMUM_HORIZONSIZE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_HASHWINDOWSIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MAXIMUM_HASHWINDOWSIZE => 96

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_DEFAULT_HASHWINDOWSIZE_1 => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_DEFAULT_HORIZONSIZE_1 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_DEFAULT_HASHWINDOWSIZE_N => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_DEFAULT_HORIZONSIZE_N => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MAXIMUM_TRAITVALUE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MINIMUM_MATCHESREQUIRED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MSRDC_MAXIMUM_MATCHESREQUIRED => 16
;@endregion Constants

;@region Methods
;@endregion Methods
}
