#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Not implemented.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkrecognitionalternatesselection
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognitionAlternatesSelection extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static IRAS_Start => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static IRAS_DefaultCount => 10

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static IRAS_All => -1
}
