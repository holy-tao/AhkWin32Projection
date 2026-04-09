#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognitionEvent extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRERecognitionWithAlternates => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRERecognition => 2
}
