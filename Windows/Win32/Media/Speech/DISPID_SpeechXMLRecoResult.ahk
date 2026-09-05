#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechXMLRecoResult extends Win32Enum {

    /**
     * Native name: DISPID_SRRGetXMLResult
     * @type {Integer (Int32)}
     */
    static SRRGetXMLResult => 10

    /**
     * Native name: DISPID_SRRGetXMLErrorInfo
     * @type {Integer (Int32)}
     */
    static SRRGetXMLErrorInfo => 11
}
