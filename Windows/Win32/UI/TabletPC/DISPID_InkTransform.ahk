#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkTransform extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITReset => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITTranslate => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITRotate => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITReflect => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITShear => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITScale => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM11 => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM12 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM21 => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeM22 => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeDx => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITeDy => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITGetTransform => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITSetTransform => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITData => 15
}
