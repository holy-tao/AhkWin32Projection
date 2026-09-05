#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_STATUS extends Win32Enum {

    /**
     * Native name: D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 1

    /**
     * Native name: D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_USED
     * @type {Integer (Int32)}
     */
    static USED => 2

    /**
     * Native name: D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_IGNORED
     * @type {Integer (Int32)}
     */
    static IGNORED => 3

    /**
     * Native name: D3D12_APPLICATION_SPECIFIC_DRIVER_BLOB_NOT_SPECIFIED
     * @type {Integer (Int32)}
     */
    static NOT_SPECIFIED => 4
}
