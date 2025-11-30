#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SRV_INSTANCE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SrvInstanceTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static SrvInstanceTypePrimary => 1

    /**
     * @type {Integer (Int32)}
     */
    static SrvInstanceTypeCsv => 2

    /**
     * @type {Integer (Int32)}
     */
    static SrvInstanceTypeSBL => 3

    /**
     * @type {Integer (Int32)}
     */
    static SrvInstanceTypeSR => 4

    /**
     * @type {Integer (Int32)}
     */
    static SrvInstanceTypeVSMB => 5
}
