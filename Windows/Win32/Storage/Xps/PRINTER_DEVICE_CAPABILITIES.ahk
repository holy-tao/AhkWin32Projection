#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class PRINTER_DEVICE_CAPABILITIES extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static DC_BINNAMES => 12

    /**
     * @type {Integer (UInt16)}
     */
    static DC_BINS => 6

    /**
     * @type {Integer (UInt16)}
     */
    static DC_COLLATE => 22

    /**
     * @type {Integer (UInt16)}
     */
    static DC_COLORDEVICE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static DC_COPIES => 18

    /**
     * @type {Integer (UInt16)}
     */
    static DC_DRIVER => 11

    /**
     * @type {Integer (UInt16)}
     */
    static DC_DUPLEX => 7

    /**
     * @type {Integer (UInt16)}
     */
    static DC_ENUMRESOLUTIONS => 13

    /**
     * @type {Integer (UInt16)}
     */
    static DC_EXTRA => 9

    /**
     * @type {Integer (UInt16)}
     */
    static DC_FIELDS => 1

    /**
     * @type {Integer (UInt16)}
     */
    static DC_FILEDEPENDENCIES => 14

    /**
     * @type {Integer (UInt16)}
     */
    static DC_MAXEXTENT => 5

    /**
     * @type {Integer (UInt16)}
     */
    static DC_MEDIAREADY => 29

    /**
     * @type {Integer (UInt16)}
     */
    static DC_MEDIATYPENAMES => 34

    /**
     * @type {Integer (UInt16)}
     */
    static DC_MEDIATYPES => 35

    /**
     * @type {Integer (UInt16)}
     */
    static DC_MINEXTENT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static DC_ORIENTATION => 17

    /**
     * @type {Integer (UInt16)}
     */
    static DC_NUP => 33

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PAPERNAMES => 16

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PAPERS => 2

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PAPERSIZE => 3

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PERSONALITY => 25

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PRINTERMEM => 28

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PRINTRATE => 26

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PRINTRATEPPM => 31

    /**
     * @type {Integer (UInt16)}
     */
    static DC_PRINTRATEUNIT => 27

    /**
     * @type {Integer (UInt16)}
     */
    static DC_SIZE => 8

    /**
     * @type {Integer (UInt16)}
     */
    static DC_STAPLE => 30

    /**
     * @type {Integer (UInt16)}
     */
    static DC_TRUETYPE => 15

    /**
     * @type {Integer (UInt16)}
     */
    static DC_VERSION => 10
}
