#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_INTERLEAVE_WAYS extends Win32Enum {

    /**
     * Native name: CxlInterleaveWays_1Way
     * @type {Integer (Int32)}
     */
    static 1Way => 0

    /**
     * Native name: CxlInterleaveWays_2Way
     * @type {Integer (Int32)}
     */
    static 2Way => 1

    /**
     * Native name: CxlInterleaveWays_4Way
     * @type {Integer (Int32)}
     */
    static 4Way => 2

    /**
     * Native name: CxlInterleaveWays_8Way
     * @type {Integer (Int32)}
     */
    static 8Way => 3

    /**
     * Native name: CxlInterleaveWays_16Way
     * @type {Integer (Int32)}
     */
    static 16Way => 4

    /**
     * Native name: CxlInterleaveWays_3Way
     * @type {Integer (Int32)}
     */
    static 3Way => 8

    /**
     * Native name: CxlInterleaveWays_6Way
     * @type {Integer (Int32)}
     */
    static 6Way => 9

    /**
     * Native name: CxlInterleaveWays_12Way
     * @type {Integer (Int32)}
     */
    static 12Way => 10

    /**
     * Native name: CxlInterleaveWays_Max
     * @type {Integer (Int32)}
     */
    static Max => 11
}
