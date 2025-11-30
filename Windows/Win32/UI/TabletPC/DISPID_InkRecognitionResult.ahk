#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkRecognitionResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_TopString => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_TopAlternate => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_Strokes => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_TopConfidence => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_AlternatesFromSelection => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_ModifyTopAlternate => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_InkRecognitionResult_SetResultOnStrokes => 7
}
