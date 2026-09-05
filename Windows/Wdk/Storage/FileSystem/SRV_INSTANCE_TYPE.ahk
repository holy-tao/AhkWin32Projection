#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class SRV_INSTANCE_TYPE extends Win32Enum {

    /**
     * Native name: SrvInstanceTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: SrvInstanceTypePrimary
     * @type {Integer (Int32)}
     */
    static Primary => 1

    /**
     * Native name: SrvInstanceTypeCsv
     * @type {Integer (Int32)}
     */
    static Csv => 2

    /**
     * Native name: SrvInstanceTypeSBL
     * @type {Integer (Int32)}
     */
    static TypeSBL => 3

    /**
     * Native name: SrvInstanceTypeSR
     * @type {Integer (Int32)}
     */
    static TypeSR => 4

    /**
     * Native name: SrvInstanceTypeVSMB
     * @type {Integer (Int32)}
     */
    static TypeVSMB => 5
}
