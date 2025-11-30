#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkRecoContext extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Strokes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_CharacterAutoCompletionMode => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Factoid => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_WordList => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Recognizer => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Guide => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Flags => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_PrefixText => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_SuffixText => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_StopRecognition => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Clone => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_Recognize => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_StopBackgroundRecognition => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_EndInkInput => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_BackgroundRecognize => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_BackgroundRecognizeWithAlternates => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IRecoCtx_IsStringSupported => 17
}
