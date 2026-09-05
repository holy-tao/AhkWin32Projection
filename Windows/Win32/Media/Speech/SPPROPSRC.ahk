#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPPROPSRC extends Win32Enum {

    /**
     * Native name: SPPROPSRC_RECO_INST
     * @type {Integer (Int32)}
     */
    static RECO_INST => 0

    /**
     * Native name: SPPROPSRC_RECO_CTX
     * @type {Integer (Int32)}
     */
    static RECO_CTX => 1

    /**
     * Native name: SPPROPSRC_RECO_GRAMMAR
     * @type {Integer (Int32)}
     */
    static RECO_GRAMMAR => 2
}
