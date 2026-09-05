#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognitionEvent extends Win32Enum {

    /**
     * Native name: DISPID_IRERecognitionWithAlternates
     * @type {Integer (Int32)}
     */
    static IRERecognitionWithAlternates => 1

    /**
     * Native name: DISPID_IRERecognition
     * @type {Integer (Int32)}
     */
    static IRERecognition => 2
}
