#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognitionResult extends Win32Enum {

    /**
     * Native name: DISPID_InkRecognitionResult_TopString
     * @type {Integer (Int32)}
     */
    static TopString => 1

    /**
     * Native name: DISPID_InkRecognitionResult_TopAlternate
     * @type {Integer (Int32)}
     */
    static TopAlternate => 2

    /**
     * Native name: DISPID_InkRecognitionResult_Strokes
     * @type {Integer (Int32)}
     */
    static Strokes => 3

    /**
     * Native name: DISPID_InkRecognitionResult_TopConfidence
     * @type {Integer (Int32)}
     */
    static TopConfidence => 4

    /**
     * Native name: DISPID_InkRecognitionResult_AlternatesFromSelection
     * @type {Integer (Int32)}
     */
    static AlternatesFromSelection => 5

    /**
     * Native name: DISPID_InkRecognitionResult_ModifyTopAlternate
     * @type {Integer (Int32)}
     */
    static ModifyTopAlternate => 6

    /**
     * Native name: DISPID_InkRecognitionResult_SetResultOnStrokes
     * @type {Integer (Int32)}
     */
    static SetResultOnStrokes => 7
}
