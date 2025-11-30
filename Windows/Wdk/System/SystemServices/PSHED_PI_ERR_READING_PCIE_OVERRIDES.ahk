#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PSHED_PI_ERR_READING_PCIE_OVERRIDES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNoErr => 0

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNoMemory => 1

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesQueryErr => 2

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesBadSize => 3

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesBadSignature => 4

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNoCapOffset => 5

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiErrReadingPcieOverridesNotBinary => 6
}
