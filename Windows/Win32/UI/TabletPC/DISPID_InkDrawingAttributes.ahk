#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkDrawingAttributes extends Win32Enum {

    /**
     * Native name: DISPID_DAHeight
     * @type {Integer (Int32)}
     */
    static DAHeight => 1

    /**
     * Native name: DISPID_DAColor
     * @type {Integer (Int32)}
     */
    static DAColor => 2

    /**
     * Native name: DISPID_DAWidth
     * @type {Integer (Int32)}
     */
    static DAWidth => 3

    /**
     * Native name: DISPID_DAFitToCurve
     * @type {Integer (Int32)}
     */
    static DAFitToCurve => 4

    /**
     * Native name: DISPID_DAIgnorePressure
     * @type {Integer (Int32)}
     */
    static DAIgnorePressure => 5

    /**
     * Native name: DISPID_DAAntiAliased
     * @type {Integer (Int32)}
     */
    static DAAntiAliased => 6

    /**
     * Native name: DISPID_DATransparency
     * @type {Integer (Int32)}
     */
    static DATransparency => 7

    /**
     * Native name: DISPID_DARasterOperation
     * @type {Integer (Int32)}
     */
    static DARasterOperation => 8

    /**
     * Native name: DISPID_DAPenTip
     * @type {Integer (Int32)}
     */
    static DAPenTip => 9

    /**
     * Native name: DISPID_DAClone
     * @type {Integer (Int32)}
     */
    static DAClone => 10

    /**
     * Native name: DISPID_DAExtendedProperties
     * @type {Integer (Int32)}
     */
    static DAExtendedProperties => 11
}
