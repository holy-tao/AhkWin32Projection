#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkTransform extends Win32Enum {

    /**
     * Native name: DISPID_ITReset
     * @type {Integer (Int32)}
     */
    static ITReset => 1

    /**
     * Native name: DISPID_ITTranslate
     * @type {Integer (Int32)}
     */
    static ITTranslate => 2

    /**
     * Native name: DISPID_ITRotate
     * @type {Integer (Int32)}
     */
    static ITRotate => 3

    /**
     * Native name: DISPID_ITReflect
     * @type {Integer (Int32)}
     */
    static ITReflect => 4

    /**
     * Native name: DISPID_ITShear
     * @type {Integer (Int32)}
     */
    static ITShear => 5

    /**
     * Native name: DISPID_ITScale
     * @type {Integer (Int32)}
     */
    static ITScale => 6

    /**
     * Native name: DISPID_ITeM11
     * @type {Integer (Int32)}
     */
    static ITeM11 => 7

    /**
     * Native name: DISPID_ITeM12
     * @type {Integer (Int32)}
     */
    static ITeM12 => 8

    /**
     * Native name: DISPID_ITeM21
     * @type {Integer (Int32)}
     */
    static ITeM21 => 9

    /**
     * Native name: DISPID_ITeM22
     * @type {Integer (Int32)}
     */
    static ITeM22 => 10

    /**
     * Native name: DISPID_ITeDx
     * @type {Integer (Int32)}
     */
    static ITeDx => 11

    /**
     * Native name: DISPID_ITeDy
     * @type {Integer (Int32)}
     */
    static ITeDy => 12

    /**
     * Native name: DISPID_ITGetTransform
     * @type {Integer (Int32)}
     */
    static ITGetTransform => 13

    /**
     * Native name: DISPID_ITSetTransform
     * @type {Integer (Int32)}
     */
    static ITSetTransform => 14

    /**
     * Native name: DISPID_ITData
     * @type {Integer (Int32)}
     */
    static ITData => 15
}
