#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BfEnTvRat_GenericAttributes extends Win32Enum {

    /**
     * Native name: BfAttrNone
     * @type {Integer (Int32)}
     */
    static AttrNone => 0

    /**
     * Native name: BfIsBlocked
     * @type {Integer (Int32)}
     */
    static IsBlocked => 1

    /**
     * Native name: BfIsAttr_1
     * @type {Integer (Int32)}
     */
    static IsAttr_1 => 2

    /**
     * Native name: BfIsAttr_2
     * @type {Integer (Int32)}
     */
    static IsAttr_2 => 4

    /**
     * Native name: BfIsAttr_3
     * @type {Integer (Int32)}
     */
    static IsAttr_3 => 8

    /**
     * Native name: BfIsAttr_4
     * @type {Integer (Int32)}
     */
    static IsAttr_4 => 16

    /**
     * Native name: BfIsAttr_5
     * @type {Integer (Int32)}
     */
    static IsAttr_5 => 32

    /**
     * Native name: BfIsAttr_6
     * @type {Integer (Int32)}
     */
    static IsAttr_6 => 64

    /**
     * Native name: BfIsAttr_7
     * @type {Integer (Int32)}
     */
    static IsAttr_7 => 128

    /**
     * Native name: BfValidAttrSubmask
     * @type {Integer (Int32)}
     */
    static ValidAttrSubmask => 255
}
