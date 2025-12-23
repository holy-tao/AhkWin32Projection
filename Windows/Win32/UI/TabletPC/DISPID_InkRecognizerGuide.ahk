#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkRecognizerGuide extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGWritingBox => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGDrawnBox => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGRows => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGColumns => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGMidline => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRGGuideData => 6
}
