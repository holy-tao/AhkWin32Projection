#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PSHED_PI_ERR_READING_PCIE_OVERRIDES extends Win32Enum {

    /**
     * Native name: PshedPiErrReadingPcieOverridesNoErr
     * @type {Integer (Int32)}
     */
    static NoErr => 0

    /**
     * Native name: PshedPiErrReadingPcieOverridesNoMemory
     * @type {Integer (Int32)}
     */
    static NoMemory => 1

    /**
     * Native name: PshedPiErrReadingPcieOverridesQueryErr
     * @type {Integer (Int32)}
     */
    static QueryErr => 2

    /**
     * Native name: PshedPiErrReadingPcieOverridesBadSize
     * @type {Integer (Int32)}
     */
    static BadSize => 3

    /**
     * Native name: PshedPiErrReadingPcieOverridesBadSignature
     * @type {Integer (Int32)}
     */
    static BadSignature => 4

    /**
     * Native name: PshedPiErrReadingPcieOverridesNoCapOffset
     * @type {Integer (Int32)}
     */
    static NoCapOffset => 5

    /**
     * Native name: PshedPiErrReadingPcieOverridesNotBinary
     * @type {Integer (Int32)}
     */
    static NotBinary => 6
}
