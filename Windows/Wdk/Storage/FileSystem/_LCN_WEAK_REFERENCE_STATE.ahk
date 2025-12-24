#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class _LCN_WEAK_REFERENCE_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LCN_WEAK_REFERENCE_VALID => 1

    /**
     * @type {Integer (Int32)}
     */
    static LCN_CHECKSUM_VALID => 2
}
