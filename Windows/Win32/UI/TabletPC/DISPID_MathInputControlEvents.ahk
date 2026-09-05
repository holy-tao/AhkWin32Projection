#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_MathInputControlEvents extends Win32Enum {

    /**
     * Native name: DISPID_MICInsert
     * @type {Integer (Int32)}
     */
    static MICInsert => 0

    /**
     * Native name: DISPID_MICClose
     * @type {Integer (Int32)}
     */
    static MICClose => 1

    /**
     * Native name: DISPID_MICPaint
     * @type {Integer (Int32)}
     */
    static MICPaint => 2

    /**
     * Native name: DISPID_MICClear
     * @type {Integer (Int32)}
     */
    static MICClear => 3
}
