#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CHANGER_ELEMENT_STATUS_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: ELEMENT_STATUS_ACCESS
     * @type {Integer (UInt32)}
     */
    static ACCESS => 8

    /**
     * Native name: ELEMENT_STATUS_AVOLTAG
     * @type {Integer (UInt32)}
     */
    static AVOLTAG => 536870912

    /**
     * Native name: ELEMENT_STATUS_EXCEPT
     * @type {Integer (UInt32)}
     */
    static EXCEPT => 4

    /**
     * Native name: ELEMENT_STATUS_EXENAB
     * @type {Integer (UInt32)}
     */
    static EXENAB => 16

    /**
     * Native name: ELEMENT_STATUS_FULL
     * @type {Integer (UInt32)}
     */
    static FULL => 1

    /**
     * Native name: ELEMENT_STATUS_ID_VALID
     * @type {Integer (UInt32)}
     */
    static ID_VALID => 8192

    /**
     * Native name: ELEMENT_STATUS_IMPEXP
     * @type {Integer (UInt32)}
     */
    static IMPEXP => 2

    /**
     * Native name: ELEMENT_STATUS_INENAB
     * @type {Integer (UInt32)}
     */
    static INENAB => 32

    /**
     * Native name: ELEMENT_STATUS_INVERT
     * @type {Integer (UInt32)}
     */
    static INVERT => 4194304

    /**
     * Native name: ELEMENT_STATUS_LUN_VALID
     * @type {Integer (UInt32)}
     */
    static LUN_VALID => 4096

    /**
     * Native name: ELEMENT_STATUS_NOT_BUS
     * @type {Integer (UInt32)}
     */
    static NOT_BUS => 32768

    /**
     * Native name: ELEMENT_STATUS_PVOLTAG
     * @type {Integer (UInt32)}
     */
    static PVOLTAG => 268435456

    /**
     * Native name: ELEMENT_STATUS_SVALID
     * @type {Integer (UInt32)}
     */
    static SVALID => 8388608

    /**
     * Native name: ELEMENT_STATUS_PRODUCT_DATA
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATA => 64
}
