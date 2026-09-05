#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class _LCN_WEAK_REFERENCE_STATE extends Win32Enum {

    /**
     * Native name: LCN_WEAK_REFERENCE_VALID
     * @type {Integer (Int32)}
     */
    static VALID => 1

    /**
     * Native name: LCN_CHECKSUM_VALID
     * @type {Integer (Int32)}
     */
    static CHECKSUM_VALID => 2
}
