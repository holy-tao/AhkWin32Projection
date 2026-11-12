#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_INTERLEAVE_GRANULARITY extends Win32Enum {

    /**
     * Native name: CxlInterleaveGranularity_256
     * @type {Integer (Int32)}
     */
    static 256 => 0

    /**
     * Native name: CxlInterleaveGranularity_512
     * @type {Integer (Int32)}
     */
    static 512 => 1

    /**
     * Native name: CxlInterleaveGranularity_1024
     * @type {Integer (Int32)}
     */
    static 1024 => 2

    /**
     * Native name: CxlInterleaveGranularity_2048
     * @type {Integer (Int32)}
     */
    static 2048 => 3

    /**
     * Native name: CxlInterleaveGranularity_4096
     * @type {Integer (Int32)}
     */
    static 4096 => 4

    /**
     * Native name: CxlInterleaveGranularity_8192
     * @type {Integer (Int32)}
     */
    static 8192 => 5

    /**
     * Native name: CxlInterleaveGranularity_16384
     * @type {Integer (Int32)}
     */
    static 16384 => 6

    /**
     * Native name: CxlInterleaveGranularity_Max
     * @type {Integer (Int32)}
     */
    static Max => 7
}
