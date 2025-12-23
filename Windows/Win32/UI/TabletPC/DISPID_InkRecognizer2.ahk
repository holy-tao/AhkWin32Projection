#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkRecognizer2 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoId => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_RecoUnicodeRanges => 1
}
