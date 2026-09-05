#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognizer2 extends Win32Enum {

    /**
     * Native name: DISPID_RecoId
     * @type {Integer (Int32)}
     */
    static RecoId => 0

    /**
     * Native name: DISPID_RecoUnicodeRanges
     * @type {Integer (Int32)}
     */
    static RecoUnicodeRanges => 1
}
