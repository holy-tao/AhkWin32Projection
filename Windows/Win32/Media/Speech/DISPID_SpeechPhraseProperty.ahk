#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseProperty extends Win32Enum {

    /**
     * Native name: DISPID_SPPName
     * @type {Integer (Int32)}
     */
    static SPPName => 1

    /**
     * Native name: DISPID_SPPId
     * @type {Integer (Int32)}
     */
    static SPPId => 2

    /**
     * Native name: DISPID_SPPValue
     * @type {Integer (Int32)}
     */
    static SPPValue => 3

    /**
     * Native name: DISPID_SPPFirstElement
     * @type {Integer (Int32)}
     */
    static SPPFirstElement => 4

    /**
     * Native name: DISPID_SPPNumberOfElements
     * @type {Integer (Int32)}
     */
    static SPPNumberOfElements => 5

    /**
     * Native name: DISPID_SPPEngineConfidence
     * @type {Integer (Int32)}
     */
    static SPPEngineConfidence => 6

    /**
     * Native name: DISPID_SPPConfidence
     * @type {Integer (Int32)}
     */
    static SPPConfidence => 7

    /**
     * Native name: DISPID_SPPParent
     * @type {Integer (Int32)}
     */
    static SPPParent => 8

    /**
     * Native name: DISPID_SPPChildren
     * @type {Integer (Int32)}
     */
    static SPPChildren => 9
}
