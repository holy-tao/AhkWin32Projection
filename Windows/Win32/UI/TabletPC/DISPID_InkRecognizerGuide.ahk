#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognizerGuide extends Win32Enum {

    /**
     * Native name: DISPID_IRGWritingBox
     * @type {Integer (Int32)}
     */
    static IRGWritingBox => 1

    /**
     * Native name: DISPID_IRGDrawnBox
     * @type {Integer (Int32)}
     */
    static IRGDrawnBox => 2

    /**
     * Native name: DISPID_IRGRows
     * @type {Integer (Int32)}
     */
    static IRGRows => 3

    /**
     * Native name: DISPID_IRGColumns
     * @type {Integer (Int32)}
     */
    static IRGColumns => 4

    /**
     * Native name: DISPID_IRGMidline
     * @type {Integer (Int32)}
     */
    static IRGMidline => 5

    /**
     * Native name: DISPID_IRGGuideData
     * @type {Integer (Int32)}
     */
    static IRGGuideData => 6
}
