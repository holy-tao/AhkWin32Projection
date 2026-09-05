#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecoContext extends Win32Enum {

    /**
     * Native name: DISPID_IRecoCtx_Strokes
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Strokes => 1

    /**
     * Native name: DISPID_IRecoCtx_CharacterAutoCompletionMode
     * @type {Integer (Int32)}
     */
    static IRecoCtx_CharacterAutoCompletionMode => 2

    /**
     * Native name: DISPID_IRecoCtx_Factoid
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Factoid => 3

    /**
     * Native name: DISPID_IRecoCtx_WordList
     * @type {Integer (Int32)}
     */
    static IRecoCtx_WordList => 4

    /**
     * Native name: DISPID_IRecoCtx_Recognizer
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Recognizer => 5

    /**
     * Native name: DISPID_IRecoCtx_Guide
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Guide => 6

    /**
     * Native name: DISPID_IRecoCtx_Flags
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Flags => 7

    /**
     * Native name: DISPID_IRecoCtx_PrefixText
     * @type {Integer (Int32)}
     */
    static IRecoCtx_PrefixText => 8

    /**
     * Native name: DISPID_IRecoCtx_SuffixText
     * @type {Integer (Int32)}
     */
    static IRecoCtx_SuffixText => 9

    /**
     * Native name: DISPID_IRecoCtx_StopRecognition
     * @type {Integer (Int32)}
     */
    static IRecoCtx_StopRecognition => 10

    /**
     * Native name: DISPID_IRecoCtx_Clone
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Clone => 11

    /**
     * Native name: DISPID_IRecoCtx_Recognize
     * @type {Integer (Int32)}
     */
    static IRecoCtx_Recognize => 12

    /**
     * Native name: DISPID_IRecoCtx_StopBackgroundRecognition
     * @type {Integer (Int32)}
     */
    static IRecoCtx_StopBackgroundRecognition => 13

    /**
     * Native name: DISPID_IRecoCtx_EndInkInput
     * @type {Integer (Int32)}
     */
    static IRecoCtx_EndInkInput => 14

    /**
     * Native name: DISPID_IRecoCtx_BackgroundRecognize
     * @type {Integer (Int32)}
     */
    static IRecoCtx_BackgroundRecognize => 15

    /**
     * Native name: DISPID_IRecoCtx_BackgroundRecognizeWithAlternates
     * @type {Integer (Int32)}
     */
    static IRecoCtx_BackgroundRecognizeWithAlternates => 16

    /**
     * Native name: DISPID_IRecoCtx_IsStringSupported
     * @type {Integer (Int32)}
     */
    static IRecoCtx_IsStringSupported => 17
}
